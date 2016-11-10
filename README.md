# sparkle-pack-aws-my-subnets
SparklePack to auto-detect S3 buckets that have two tags:

- Environment = `ENV['environment']`
- Purpose = 'purpose'

h/t to [techshell](https://github.com/techshell) for this approach.

## Environment variables

The following environment variables must be set in order to use this Sparkle
Pack:

- AWS_REGION
- AWS_DEFAULT_REGION (being deprecated?)
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- environment

## Usage
Add the pack to your Gemfile and .sfn:

Gemfile:
```ruby
source 'https://rubygems.org'

gem 'sfn'
gem 'sparkle-pack-aws-aws-my-s3-buckets'
```

.sfn:
```ruby
Configuration.new do
  sparkle_pack [ 'sparkle-pack-aws-my-s3-buckets' ]
  ...
end
```

In a SparkleFormation Template/Component/Dynamic:
```ruby
s3_bucket registry!(:my_s3_bucket, 'lambda')
```
The `my_s3_bucket` registry will return an bucket name where the bucket's
'Purpose' tag is set to 'lambda', and the 'Environment' tag matches
`ENV['environment']`.  Alternatively, you can override `ENV['environment']`
by specifying it as a second parameter:
```ruby
s3_bucket registry!(:my_s3_bucket, 'lambda', 'prod')
```
