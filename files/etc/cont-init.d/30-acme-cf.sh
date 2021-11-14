#!/usr/bin/with-contenv sh

PATH=$PATH:/root/.acme.sh

# Remap variable names
export SYNO_Scheme=$SYNO_SCHEME
export SYNO_Hostname=$SYNO_HOSTNAME
export SYNO_Port=$SYNO_PORT
export SYNO_Username=$SYNO_USERNAME
export SYNO_Password=$SYNO_PASSWORD
export SYNO_Certificate=$SYNO_CERT_NAME
export SYNO_Create=$SYNO_CERT_CREATE
export CF_Token=$CF_TOKEN
export CF_Account_ID=$CF_ACCOUNT_ID

if [ -n "${ACEM_TEST:-}" ]; then
    ACEM_TEST_FLAG="--test"
else
    ACEM_TEST_FLAG="--force"
    acme.sh --register-account -m ${ACME_EMAIL}
fi

main_domain=$(echo $DOMAINS | cut -d"," -f1)
domains_flags="-d $(echo $DOMAINS | sed 's/,/ -d /')"

# Request certificate
echo "Issue cert for $main_domain..."
acme.sh --issue $domains_flags --dns dns_cf ${ACEM_TEST_FLAG}

# Deploy to Synology
echo "Deploy cert for $main_domain..."
acme.sh -d "$main_domain" --deploy --deploy-hook synology_dsm
