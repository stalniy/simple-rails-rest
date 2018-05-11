# Rails 5 REST API with CanCan

This is an example of API based on Rails5 and CanCan which can be integrated with [CASL](https://github.com/stalniy/casl).

## Installation

If you don't have Ruby, install it (e.g., by using [rvm](https://rvm.io/) and when you finish, just run this:

```sh
gem install bundler
bundle install
```

Then configure database (it uses `sqlite3` by default) in `config/databse.yml` and run migrations and seeds:

```sh
rails db:migrate
rails db:seed
```

Seeds adds 2 users:
* admin - admin@freaksidea.com / 123456
* member - member@freaksidea.com / 123456

## API

To login send:

```
POST /api/session

{
  "email": "admin@freaksidea.com", # or member@freaksidea.com
  "password": "123456"
}
```

The response will give back JWT token and a list of rules which can be read by [CASL](https://github.com/stalniy/casl)

Run `rails routes` to see the full list of routes. `articles` and `users` follows the general REST CRUD scheme.

## Run Server

```bash
rails s
```
