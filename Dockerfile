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
ENV SYNO_Scheme="http"
ENV SYNO_Hostname="localhost"
ENV SYNO_Port="5000"
ENV SYNO_Username=
ENV SYNO_Password=
ENV SYNO_TOTP_SECRET=
ENV DOMAINS="example.com,*.example.com"
ENV SYNO_Certificate="synology-acme-cf-test" 
ENV SYNO_Create=
ENV ACME_EMAIL="my@example.com"
ENV ACEM_TEST=
ENV CF_Token=
ENV CF_Account_ID=


RUN curl -OL https://github.com/dacrystal/acme.sh/archive/topic/synology_dsm-otp_code.tar.gz \
    && tar xvf synology_dsm-otp_code.tar.gz \
    && cd acme.sh-topic-synology_dsm-otp_code && ./acme.sh --install

COPY files/etc /etc