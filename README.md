# Shorten Url Assignment 

## What I did do?
- Create a RoR app (Rails v6.1.5, ruby-2.7.3)
- API to encode, decode URL
- Setup home screen and redirect user to original url from shortened url 
- Setup a scaleable database
- Setup rack-attach to minimize the impact of a DDOS attack
- Unit tests & rubocop
- Setup & deploy the app to Heroku(https://shortener-url-assigment.herokuapp.com/)

## Usage
```
bundle install
```
```
rake db:create db:migrate db:seed
```
```
rails s
```
Access [http://localhost:3000](http://localhost:3000)

## API Endpoints
- **POST /encode**: Create a shorten url
  + Endpoint: `/api/v1/shortener/encode`
  + Params: `url`

- **GET /decode**: Get original url from shorten url 
  + Endpoint: `/api/v1/shortener/decode`
  + Params: `url`


## Best practices
- Fat Model, Skinny Controller
- Feature extraction
- Factory pattern
- DRY
- KISS

## Details
#### Attacking
- Users can submit a link that is so long or invalid. So I have validated the link by limiting the maximum length and URL format.
- Users can make a lot of requests to attack server. This can make database server overload. So I have implemented rack-attack to limit the number of requests of a user in 1 minute.

Related files:
- [app/models/shorten_url.rb](https://github.com/hniah/shorten_url/blob/master/app/models/shorten_url.rb#L10,L11)
- [app/config/initializers/rack-attack.rb](https://github.com/hniah/shorten_url/blob/master/config/initializers/rack-attack.rb#L4,L6)
- [spec/requests/rack_attack_spec.rb](https://github.com/hniah/shorten_url/blob/master/spec/requests/rack_attack_spec.rb)

#### Table Partitioning
The app can have a lot of links which can make the query's cost so high. So I have split them into small chunks:

**Table shorten_urls**: Split based on part, total of 36 partitions. eg:
- Partition **urls_start_a** contains records which has first character of **slug** in [a,A]
- Partition **urls_start_b** contains records which has first character of **slug** in [b,B]
- ...
- Partition **urls_start_9** contains records which has first character of **slug** is 9

This can speed up queries on `part`. Instead of `Seq scan` every single record, PG will do scan on the specific partition. So `Execution Time` will be lower.
![img](https://i.ibb.co/6PTNCCW/Screen-Shot-2022-07-10-at-10-31-59.png)

Related files:
- [db/migrate/20220706061612_create_shorten_urls_table.rb](https://github.com/hniah/shorten_url/blob/master/db/migrate/20220706061612_create_shorten_urls_table.rb)
- [app/models/shorten_url.rb](https://github.com/hniah/shorten_url/blob/master/app/models/shorten_url.rb#L19,L23)
