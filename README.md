
# Shorten Url Assignment 

## What I did do?
- Create a RoR app (Rails v6.1.5, ruby-2.7.3)
- API to encode, decode URL
- Setup home screen and redirect user from shortened url to original url
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

#### Table Partitioning
The app can have a lot of links which can make the query's cost so high. So I have split them into small chunks:
**Table shorten_urls**: Split based on part, total of 33 partitions. eg:
- Partition **urls_start_a** contains records which has first character of **slug** in [a,A]
- Partition **urls_start_b** contains records which has first character of **slug** in [b,B]
...
- Partition **urls_start_9** contains records which has first character of **slug** is 9

Related files:
- [db/migrate/20220706061612_create_shorten_urls_table.rb](https://github.com/hniah/shorten_url/blob/master/db/migrate/20220706061612_create_shorten_urls_table.rb)
- [app/models/shorten_url.rb](https://github.com/hniah/shorten_url/blob/master/app/models/shorten_url.rb#L19,L23)