FROM opensuse

RUN zypper in -y go ruby2.3-devel zlib-devel libxml2-devel libxslt-devel gcc make zip which git-core curl jq \
 && gem.ruby2.3 install bundler

ADD package /

ENTRYPOINT ["/package"]
