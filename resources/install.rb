actions :install, :uninstall, :git, :pypi

attribute :user, :kind_of => String, :default => "root"
attribute :group, :kind_of => String, :default => "root"
attribute :install_uri, :kind_of => String, :default => "git+git://github.com/josegonzalez/beaver.git#egg=beaver"
attribute :install_version, :kind_of => String, :default => "beaver==28"
attribute :beaver_root, :kind_of => String, :default => "/opt/beaver"

default_action :install

def initialize(*args)
  super
  @action = :install
  @run_context.include_recipe ["build-essential","git","python::pip","python::virtualenv"]
end
