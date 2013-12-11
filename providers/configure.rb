def whyrun_supported?
  true
end

use_inline_resources

action :create do
  if new_resource.redis_uri.empty?
    log "redis_uri is empty, cannot create"
  else
    template "/etc/beaver.conf" do
      source new_resource.source
      cookbook new_resource.cookbook
      variables({
                  :redis_url => new_resource.redis_uri,
                  :redis_namespace => new_resource.redis_namespace,
                  :logstash_version => new_resource.logstash_version,
                  :files => new_resource.files
                })
      notifies :restart, "runit_service[beaver]", :delayed
    end
  end
  runit_service "beaver" do
    run_template_name "beaver"
    cookbook new_resource.cookbook
    options({
              :beaver_home => "/opt/beaver"
            })
  end
end
action :destroy do
  runit_service "beaver" do
    action :disable
  end
end
