# Используйте официальный образ Ruby
FROM ruby:3.3

# Установите необходимые пакеты и зависимости
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Создайте и установите рабочую директорию
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# Установите гемы
RUN bundle install

# Скопируйте весь код в рабочую директорию
COPY . /app

# Откройте порт, на котором будет работать приложение
EXPOSE 3000

# Команда для запуска приложения
CMD ["rails", "server", "-b", "0.0.0.0"]