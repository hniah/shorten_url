class CreateShortenUrlsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :shorten_urls do |t|
      t.string :original_url
      t.string :slug
      t.timestamps
    end
    add_index :shorten_urls, :slug, unique: true
  end
end
