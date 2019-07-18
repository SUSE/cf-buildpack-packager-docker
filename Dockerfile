ARG base_image=opensuse/leap:15.1
FROM ${base_image}

RUN zypper in -y ruby-devel zlib-devel libxml2-devel libxslt-devel gcc make \
                 zip which git-core curl jq go

# Get latest ruby gem bundler
RUN gem install bundler && ln -s /usr/bin/bundle.ruby* /usr/bin/bundle && ln -s /usr/bin/bundler.ruby* /usr/bin/bundler

ADD package /

ENTRYPOINT ["/package"]
