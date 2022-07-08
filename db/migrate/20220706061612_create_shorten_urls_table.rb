class CreateShortenUrlsTable < ActiveRecord::Migration[6.1]
  def up
    create_list_partition :shorten_urls, partition_key: :part, id: false,
      template: false do |t|
      t.string :original_url, null: false
      t.string :slug, null: false
      t.string :part, null: false
      t.datetime :created_at
    end

    execute "ALTER TABLE shorten_urls ADD PRIMARY KEY (slug, part);"

    [*('a'..'z'), *('0'..'9')].each {|k| ShortenUrl.create_partition(values: k, name: "urls_start_#{k}")}
  end

  def down
    ActiveRecord::Base.connection.execute("DROP TABLE if exists shorten_urls cascade;")
  end
end
