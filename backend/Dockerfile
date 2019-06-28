FROM ruby:2.5

ARG UID
RUN adduser rails --uid $UID --disabled-password --gecos ""

ENV APP /usr/src/app
RUN mkdir $APP
WORKDIR $APP

COPY Gemfile* $APP/
RUN bundle install -j3 --path vendor/bundle

COPY . $APP/

CMD ["bundle", "exec", "bin/rails", "s", "-p", "8080", "-b", "0.0.0.0"]
