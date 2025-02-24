#!/bin/sh
set -e

# Get the OIDC token from GitHub's token endpoint with the correct audience
TOKEN=$(curl -H "Authorization: Bearer $ACTIONS_ID_TOKEN_REQUEST_TOKEN" "$ACTIONS_ID_TOKEN_REQUEST_URL&audience=sts.amazonaws.com" | jq -r '.value')

export AWS_WEB_IDENTITY_TOKEN_FILE="/tmp/awstoken"
echo "$TOKEN" > "$AWS_WEB_IDENTITY_TOKEN_FILE"
export AWS_ROLE_ARN="$AWS_ROLE_ARN"
export AWS_REGION="$AWS_REGION"
aws s3 sync "$GITHUB_WORKSPACE" "s3://$AWS_S3_BUCKET" $INPUT_ARGS
rm -f "$AWS_WEB_IDENTITY_TOKEN_FILE"
