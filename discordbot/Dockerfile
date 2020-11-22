FROM ruby:2.7.1

RUN mkdir /app
ENV HOME /app
WORKDIR $HOME
ADD ./discordbot/Gemfile $HOME/Gemfile
ADD ./discordbot/Gemfile.lock $HOME/Gemfile.lock

RUN apt-get update
RUN apt-get install -y libgmp-dev libsodium-dev

RUN bundle install
