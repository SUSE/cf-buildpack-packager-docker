FROM opensuse/leap

RUN zypper in -y go ruby-devel ruby2.5-rubygem-bundler zlib-devel libxml2-devel libxslt-devel gcc make zip which git-core curl jq

ADD package /

ENTRYPOINT ["/package"]
