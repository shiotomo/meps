FROM ruby:2.6.3

RUN mkdir /app
ENV HOME /app
WORKDIR $HOME
ADD Gemfile $HOME/Gemfile
ADD Gemfile.lock $HOME/Gemfile.lock

RUN apt-get update
RUN apt-get install -y libgmp-dev

RUN bundle install