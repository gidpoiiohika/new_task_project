## Prerequisites

The setups steps expect following tools installed on the system.

- GitHub
- Ruby [3.0.1](https://github.com/gidpoiiohika/new_task_project/blob/master/Gemfile#L4)
- Rails [7.0.3](https://github.com/gidpoiiohika/new_task_project/blob/master/Gemfile#L6)
- PostgreSQL 

## Install

### Clone the repository

```shell
git git@github.com:gidpoiiohika/new_task_project.git
cd new_task_project
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 3.0.1`

If not, install the right ruby version using [RVM](https://rvm.io/rvm/install#installing-rvm) (it could take a while):

```shell
rvm install 3.0.1
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```shell
bundle install
```
### Initialize the database

```shell
rails db:create db:migrate db:seed
```

## Run rails server

```shell
rails s
```

Open [http://127.0.0.1:3000/](http://127.0.0.1:3000)

```
TODO
```

[gem 'rubocop-rails'](https://github.com/rubocop/rubocop-rails)
[gem "haml-rails"](https://github.com/haml/haml-rails)
[gem "faker"](https://github.com/faker-ruby/faker)
[gem 'devise'](https://github.com/heartcombo/devise)
[gem "rolify"](https://github.com/RolifyCommunity/rolify)
[gem 'toastr-rails'](https://github.com/CodeSeven/toastr)
[gem 'local_time'](https://github.com/basecamp/local_time)
[gem 'paper_trail'](https://github.com/paper-trail-gem/paper_trail)
[gem "rspec-rails"](https://github.com/rspec/rspec-rails)
[gem "factory_bot_rails" ](https://github.com/thoughtbot/factory_bot_rails)
[gem "byebug"](https://github.com/deivid-rodriguez/byebug)


