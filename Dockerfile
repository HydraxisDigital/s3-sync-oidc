FROM amazon/aws-cli:latest

LABEL "com.github.actions.name"="S3 Sync with OIDC"
LABEL "com.github.actions.description"="Sync repository to AWS S3 bucket using OIDC authentication"
LABEL "com.github.actions.icon"="refresh-cw"
LABEL "com.github.actions.color"="blue"

LABEL version="0.1.0"
LABEL repository="https://github.com/TheBigSniz/s3-sync-oidc"
LABEL homepage="https://sr4n.com/"
LABEL maintainer="Sam Nisbet <sam@sr4n.com>"

ADD s3-sync.sh /s3-sync.sh
ENTRYPOINT ["/s3-sync.sh"]
