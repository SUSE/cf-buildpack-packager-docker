ARG base_image=opensuse/leap:15.0
FROM ${base_image}

RUN zypper ar https://download.opensuse.org/repositories/devel:/languages:/go/openSUSE_Leap_15.0/ go
RUN zypper --gpg-auto-import-keys -n in go

RUN zypper in -y ruby-devel ruby2.5-rubygem-bundler zlib-devel  \
                 libxml2-devel libxslt-devel gcc make zip which \
                 git-core curl jq

ADD package /

ENTRYPOINT ["/package"]
