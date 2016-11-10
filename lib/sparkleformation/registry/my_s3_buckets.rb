require 'aws-sdk-core'

all_buckets = ::Array.new
my_buckets = ::Array.new
@@s3 = ::Aws::S3::Client.new

all_buckets = @@s3.list_buckets.buckets.map(&:name)

def switch_region(bucket)
  constraint = @@s3.get_bucket_location({:bucket => bucket}).location_constraint
  if constraint.empty?
    @@s3 = ::Aws::S3::Client.new({:region => 'us-east-1'})
  elsif constraint != @@s3.config.region
    @@s3 = ::Aws::S3::Client.new({:region => constraint})
  end
end

SfnRegistry.register(:my_s3_bucket) do |purpose, environment = ENV['environment']|
  found_bucket = ::String.new
  all_buckets.each do |bucket|
    switch_region(bucket)
    tags = @@s3.get_bucket_tagging({:bucket => bucket}).tag_set rescue nil
    next if tags.nil?
    if !tags.find_index { |t| t.key == "Environment" && t.value == environment }.nil?
      if !tags.find_index { |t| t.key == "Purpose" && t.value == purpose }.nil?
        found_bucket << bucket
        break
      end
    end
  end
  found_bucket
end
