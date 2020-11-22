FROM ruby:2.6.3

RUN mkdir /app
ENV HOME /app
WORKDIR $HOME
ADD ./fluentd/Gemfile $HOME/Gemfile
ADD ./fluentd/Gemfile.lock $HOME/Gemfile.lock

RUN apt-get update
RUN apt-get install -y libgmp-dev
RUN gem install bundler:2.1.4

RUN bundle install