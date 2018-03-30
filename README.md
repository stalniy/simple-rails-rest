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

## Run Server

```bash
rails s
```
