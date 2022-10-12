## Rails-приложение для управления задачами

## Роли пользователей
Пользователь может выступать в единственной роли - “Автор задачи”

## Регистрация, авторизация
Неавторизованный пользователь перенаправляется на форму входа.
С формы входа есть возможность залогиниться введя email и пароль.
Также на форме входа есть ссылка на форму регистрации. На форме регистрации пользователю предлагается заполнить поля: Email, First name, Last name, Password. После регистрации подтверждение email не требуется. Функции восстановления пароля не предусмотрено.

## Задача
Задача принадлежат пользователю, создавшему ее.
Возможные приоритеты задачи: High, Medium, Low
Возможные статусы задачи: Todo, In progress, Review, Done, Cancelled

## Форма создания/изменения задачи
Пользователь попадает на форму создания задачи по клику на иконку [+] на дашборде. Пользователь попадает на форму изменения задачи по клику на иконку [edit] на плашке задачи на дашборде.
Открытие формы создания/редактирования задачи и сохранение формы происходит без перезагрузки страницы.
Обязательные поля форм создания/редактирования - заголовок, описание задачи, приоритет, статус.

## Удаление задачи
Пользователь может удалить задачу, кликнув на иконку [remove] на плашке задачи на дашборде. Пользователь получает (toast) об успешном удалении задачи.
Удаление происходить по методу soft delete, без физического удаления записи, поскольку физическое удаление связанных с задачей данных может повлиять на результаты статистики по обновлениям задач.

### Форма фильтра задач по приоритету
Состоит из выпадающего списка с множественным выбором (High, Medium, Low). В начальном состоянии выбраны все пункты. Кнопки "Apply" не предусмотрено

### Список задач пользователя
Таблица, с колонками соответствующими статусам задач: Todo, In progress, Review, Done, Cancelled.
В колонке размещены плашки задач находящихся в этом статусе.
Внутри колонки задачи отсортированы по приоритету: от high сверху к low снизу.
В плашке показывается заголовок задачи, ее приоритет, а также кнопки [edit], [log], [remove].
Отображаю только задачи текущего (авторизованного) пользователя

### Футер
В футере отображаю дневную статистику обновлений задач (Today's activity: Y tickets updated). Y считается как количество тикетов созданных или обновленных текущим пользователем за сегодня. Начало дня считается в часовом поясе UTC.

### Лог изменений по задаче
Из списка задач, по клику на иконку [log], находящейся в плашке задачи, есть возможность просмотреть логи изменения задачи (от самых свежих к самым старым). Список измененийотображаться без перезагрузки страницы.


https://user-images.githubusercontent.com/25199412/193970463-56c79edf-7610-4401-9aef-ab349687e504.mov

## Link to heroku
Heroku [link](https://task-project-new.herokuapp.com/)

- User Email
```shell
testuser@gmail.com
```
- User Password
```shell
123456
```

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
- seeds.rb [seed](https://github.com/gidpoiiohika/new_task_project/blob/master/db/seeds.rb#L4)

```shell
rails db:create db:migrate db:seed 
```

## Run rails server

```shell
bin/dev
```

Open [http://127.0.0.1:3000/](http://127.0.0.1:3000)

## Gems

- [gem 'rubocop-rails'](https://github.com/rubocop/rubocop-rails)
- [gem "haml-rails"](https://github.com/haml/haml-rails)
- [gem "faker"](https://github.com/faker-ruby/faker)
- [gem 'devise'](https://github.com/heartcombo/devise)
- [gem "rolify"](https://github.com/RolifyCommunity/rolify)
- [gem 'toastr-rails'](https://github.com/CodeSeven/toastr)
- [gem 'local_time'](https://github.com/basecamp/local_time)
- [gem 'paper_trail'](https://github.com/paper-trail-gem/paper_trail)
- [gem "rspec-rails"](https://github.com/rspec/rspec-rails)
- [gem "factory_bot_rails" ](https://github.com/thoughtbot/factory_bot_rails)
- [gem "byebug"](https://github.com/deivid-rodriguez/byebug)
