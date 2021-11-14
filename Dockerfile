FROM oznu/s6-alpine


RUN apk --no-cache add -f \
    openssl \
    openssh-client \
    coreutils \
    bind-tools \
    curl \
    sed \
    socat \
    tzdata \
    oath-toolkit-oathtool \
    tar \
    libidn \
    jq \
    oath-toolkit-oathtool


ENV LE_CONFIG_HOME /acme.sh
ENV CERT_HOME /certs
ENV AUTO_UPGRADE 1

#Placeholder
ENV SYNO_SCHEME="http"
ENV SYNO_HOSTNAME="localhost"
ENV SYNO_PORT="5000"
ENV SYNO_USERNAME=
ENV SYNO_PASSWORD=
ENV SYNO_TOTP_SECRET=
ENV DOMAINS="example.com,*.example.com"
ENV SYNO_CERT_NAME="synology-acme-cf-test" 
ENV SYNO_CERT_CREATE=
ENV ACME_EMAIL="my@example.com"
ENV ACEM_TEST=yes
ENV CF_TOKEN=
ENV CF_ACCOUNT_ID=


RUN curl -OL https://github.com/dacrystal/acme.sh/archive/topic/synology_dsm-otp_code.tar.gz \
    && tar xvf synology_dsm-otp_code.tar.gz \
    && cd acme.sh-topic-synology_dsm-otp_code && ./acme.sh --install

COPY files/etc /etc