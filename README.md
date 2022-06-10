# README
## Todo
- [x] Implement function on WEB
- [x] Implement API support for FE
- [x] Rspec for API and WEB

## Setup Project
### Dependences
- Ruby: 2.7.5
- Rails: 6.1.6
- Node: v10.15.3
- Yarn: 1.22.17

### Run project

```
bundle install

rails db:create db:migrate db:seed

# run webpack
bin/webpack-dev-server

# run server
rails server
```

### Run with docker-compose.yml

```
docker-compose -f docker-compose.yml up -d

docker exec -ti rails bundle exec rake db:create db:migrate db:seed

access http://localhost:30000
```

### Note
Access to site with account

```
- username: testuser
- password: TestPassowrd1!
```