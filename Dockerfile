FROM opensuse

RUN zypper in -y go ruby2.3-devel gcc make zip which git-core curl && gem.ruby2.3 install bundler

ADD package /

ENTRYPOINT ["/package"]
