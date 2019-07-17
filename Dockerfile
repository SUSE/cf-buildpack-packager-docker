ARG base_image=opensuse/leap:15.1
FROM ${base_image}

RUN zypper in -y ruby-devel zlib-devel libxml2-devel libxslt-devel gcc make \
                 zip which git-core curl jq

# Get latest go version
RUN zypper ar https://download.opensuse.org/repositories/devel:/languages:/go/openSUSE_Leap_15.0/ go
RUN zypper --gpg-auto-import-keys -n in go

# Get latest ruby gem bundler
RUN zypper ar https://download.opensuse.org/repositories/devel:/languages:/ruby:/extensions/openSUSE_Leap_15.0/ ruby-extensions
RUN zypper --gpg-auto-import-keys -n in ruby2.5-rubygem-bundler

ADD package /

ENTRYPOINT ["/package"]
