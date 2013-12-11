#
# Cookbook Name:: beaver_test
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

beaver_install node.hostname do
  action :git
end

whattowatch=Array.new
whattowatch << { "path" => "/var/log/syslog", "type" => "syslog", "format" => "plain" }

beaver_configure node.hostname do
  action :create
  redis_uri "127.0.0.1:6379/0"
  redis_namespace "syslog:logstash"
  files(whattowatch)
end
