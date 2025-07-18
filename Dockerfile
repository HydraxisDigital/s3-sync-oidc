FROM amazon/aws-cli:latest

LABEL "com.github.actions.name"="S3 Sync with OIDC"
LABEL "com.github.actions.description"="Sync repository to AWS S3 bucket using OIDC authentication"
LABEL "com.github.actions.icon"="refresh-cw"
LABEL "com.github.actions.color"="blue"

LABEL version="0.1.0"
LABEL repository="https://github.com/TheBigSniz/s3-sync-oidc"

RUN yum install -y jq
ADD s3-sync.sh /s3-sync.sh
RUN chmod +x /s3-sync.sh
ENTRYPOINT ["/s3-sync.sh"]
