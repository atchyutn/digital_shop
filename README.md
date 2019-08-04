# README

# Project

[Digital Shop](#)

## Install

### Clone the repository

```shell
git clone https://github.com/atchyutn/digital_shop.git
cd project
```

### Check your Ruby version

```shell
ruby -v
```

The output should start with something like `ruby 2.6.0`

If not, install the right ruby version using [rvm](https://rvm.io/rvm/install) (it could take a while):

```shell
rvm install 2.6.0
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```shell
gem install
```

### Set environment variables

```
TODO
```

### Initialize the database

```shell
rails db:create db:migrate db:seed
```

### Run spec
```
bundle exec rspec
```

### Server

```shell
rails s
```

### Add heroku remotes

Using [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli):

```shell
heroku git:remote -a digital-shop
heroku git:remote --remote heroku-staging -a digital-shop
```

## Deploy

### With Heroku pipeline (recommended)

Push to Heroku staging remote:

```shell
git push heroku-staging
```

Go to the Heroku Dashboard and [promote the app to production](https://devcenter.heroku.com/articles/pipelines) or use Heroku CLI:

```shell
heroku pipelines:promote -a project-staging
```


### Directly to production (not recommended)

Push to Heroku production remote:

```shell
git push heroku
```
