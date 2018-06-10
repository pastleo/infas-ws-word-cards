FROM ruby:2.5.1-alpine3.7

RUN \
apk add -U \
build-base \
sqlite-dev \
tzdata \
bash \
nodejs \
git \
less

RUN \
gem install rails

RUN \
mkdir -p /workspace

ADD . /workspace

WORKDIR /workspace

RUN \
bundle

CMD ["sh", "-c", "bundle && bundle exec rake db:migrate && rm -f tmp/pids/server.pid && bundle exec rails s -b 0.0.0.0 -p 3000"]


