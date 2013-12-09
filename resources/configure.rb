actions :create, :destroy

attribute :redis_uri, :kind_of => String, :default => String.new
# URI of where Redis is listening for logstash
attribute :beaver_home, :kind_of => String, :default => "/opt/beaver"
# Home directory where beaver is installed
attribute :redis_namespace, :kind_of => String, :default => "logstash:beaver"
# Namespace to send the logs to in redis
attribute :files, :kind_of => Array
# Array of all the files to be read
attribute :source, :kind_of => String, :default => "beaver.conf.erb"
# Sometimes you want to specify a different ERB template to generate the beaver configuration
attribute :cookbook, :kind_of => String, :default => "beaver"
# Sometimes you want to specify an ERB template in a different cookbook
attribute :logstash_version, :kind_of => Fixnum, :default => 0
# Defaults to 0; assuming you are not running logstash > 1.2

default_action :nothing

def initialize(*args)
  super
  @action = :nothing
  @run_context.include_recipe ["runit"]
end
