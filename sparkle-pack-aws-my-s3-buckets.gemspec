Gem::Specification.new do |s|
  s.name = 'sparkle-pack-aws-my-s3-buckets'
  s.version = '0.0.1'
  s.licenses = ['MIT']
  s.summary = 'AWS My S3 Buckets SparklePack'
  s.description = 'SparklePack to detect S3 buckets whose "Environment" tag matches the "environment" environment variable.'
  s.authors = ['Greg Swallow']
  s.email = 'gswallow@indigobio.com'
  s.homepage = 'https://github.com/gswallow/sparkle-pack-aws-my-s3-buckets'
  s.files = Dir[ 'lib/sparkleformation/registry/*' ] + %w(sparkle-pack-aws-my-s3-buckets.gemspec lib/sparkle-pack-aws-my-s3-buckets.rb)
  s.add_runtime_dependency 'aws-sdk-core', '~> 2'
end
