# S3 Sync with OIDC

This is a reworked version of Jake Jarvis's [s3-sync-action](https://github.com/jakejarvis/s3-sync-action) to use [OIDC Federation](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_oidc.html) to authenticate with AWS. 

## Usage

```yaml
- name: Sync to S3
  uses: TheBigSniz/s3-sync-oidc@main
  env:
    AWS_S3_BUCKET: ${{ secrets.AWS_S3_BUCKET }}
    AWS_ROLE_ARN: ${{ secrets.AWS_ROLE_ARN }}
    AWS_REGION: eu-west-2
    S3_ARGS: --delete --exclude ".git/*"
    SOURCE_DIR: ./
```

## Environment Variables

- `AWS_S3_BUCKET`: (Required) The name of the S3 bucket to sync to.
- `AWS_ROLE_ARN`: (Required) The ARN of the IAM role to assume.
- `AWS_REGION`: (Required) The region of the S3 bucket.
- `SOURCE_DIR`: (Required) The directory to sync to S3. Use ./ for the root of the repository.
- `S3_ARGS`: (Optional) Additional arguments to pass to the `aws s3 sync` command. Refer to the [aws s3 sync](https://docs.aws.amazon.com/cli/latest/reference/s3/sync.html) documentation for more information.
