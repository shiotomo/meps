FROM ruby:2.7.1

RUN mkdir /app
ENV HOME /app
WORKDIR $HOME
ADD ./worker/Gemfile $HOME/Gemfile
ADD ./worker/Gemfile.lock $HOME/Gemfile.lock
ADD ./.env $HOME/.env
ADD ./.env.sample $HOME/.env.sample

RUN apt-get update
RUN apt-get install -y libgmp-dev

RUN bundle install