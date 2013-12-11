def whyrun_supported?
  true
end

use_inline_resources

action :git do
  python_virtualenv new_resource.beaver_root do
    interpreter "/usr/bin/python"
    owner new_resource.user
    group new_resource.group
    action :create
  end
  python_pip new_resource.install_uri do
    virtualenv new_resource.beaver_root
    action :install
  end
  new_resource.updated_by_last_action(true)
end
action :install do
  python_virtualenv new_resource.beaver_root do
    owner new_resource.user
    group new_resource.group
    action :create
  end
  python_pip new_resource.install_version do
    virtualenv new_resource.beaver_root
    action :install
  end
  new_resource.updated_by_last_action(true)
end
