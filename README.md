# Docker Let's Encrypt ACME deployment for Synology DSM.

Deploy and renew [Let's Encrypt](https://letsencrypt.org) SSL certificate to Synology DSM using [acme.sh](https://github.com/acmesh-official/acme.sh) and [CloudFlare DNS Service](https://www.cloudflare.com/dns/).


## Requirements

* Synology user account with admin privileges. If two-factor enabled, `SYNO_TOTP_SECRET` can be retrieved from 2-factor authentication setup via link(can't scan it) below QR.
* Cloudflare Account ID and an API token with the following permissions:
    * Zone - Zone Settings - Read
    * Zone - Zone - Read
    * Zone - DNS - Edit


## Environment variables

### Connection
* `SYNO_SCHEME` - Defaults to `http`.
* `SYNO_HOSTNAME` - Defaults to `localhost`
* `SYNO_PORT` - Defaults to `5000`

### Auth
* `SYNO_USERNAME` - Synology Username to login (must be an administrator)
* `SYNO_PASSWORD` - Synology Password to login
* `SYNO_TOTP_SECRET` - TOTP secret to generate OTP. If two-factor authentication is enabled for the user.
* `CF_ACCOUNT_ID` - Cloudflare Account ID.
* `CF_TOKEN` - Cloudflare API Key.

### Certificate details
* `DOMAINS` - List of domains; comma separated.
* `SYNO_CERT_NAME` - Synology certificate description.
* `SYNO_CERT_CREATE` - Set to non-empty value to create new certificate if not found. 

### ACME settings
* `ACEM_TEST` - Set to non-empty value to request staging/test certificate.
* `ACME_EMAIL` - Account email for production certificate.



## License

This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org/>