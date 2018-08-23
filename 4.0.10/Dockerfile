FROM redis:4.0.10

RUN apt-get -y update && \
  apt-get install -y --no-install-recommends --no-install-suggests zlib1g-dev libssl-dev libreadline-dev libgdbm-dev openssl build-essential supervisor rubygems wget iproute2 && \
  rm -rf /var/lib/apt/lists/*

RUN wget https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.4.tar.gz -O /ruby-2.4.4.tar.gz && \
  cd / && \
  tar xfz ruby-2.4.4.tar.gz && \
  cd ruby-2.4.4 && \
  ./configure && \
  make && make install

RUN gem install redis -v 4.0.1

RUN wget https://raw.githubusercontent.com/antirez/redis/4.0/src/redis-trib.rb -O /redis-trib.rb && \
  chmod +x /redis-trib.rb

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
COPY supervisord.conf /supervisord.conf
COPY redis.conf /redis.conf

WORKDIR /

EXPOSE 7000 7001 7002 7003

CMD ["/docker-entrypoint.sh"]