# S3 Sync with OIDC

This is a rework of Jake Jarvis's [s3-sync-action](https://github.com/jakejarvis/s3-sync-action) to use [OIDC Federation](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_oidc.html) to authenticate with AWS. 

## Usage

```yaml
- name: Sync to S3
  uses: TheBigSniz/s3-sync-oidc@main
  with:
    args: --follow-symlinks --delete --exclude ".git/*"
  env:
    AWS_S3_BUCKET: ${{ secrets.AWS_S3_BUCKET }}
    AWS_ROLE_ARN: ${{ secrets.AWS_ROLE_ARN }}
    AWS_REGION: eu-west-2
```

## Environment Variables

- `AWS_S3_BUCKET`: The name of the S3 bucket to sync to.
- `AWS_ROLE_ARN`: The ARN of the IAM role to assume.
- `AWS_REGION`: The region of the S3 bucket.

## args

All [aws s3 sync](https://docs.aws.amazon.com/cli/latest/reference/s3/sync.html) flags are supported. 

