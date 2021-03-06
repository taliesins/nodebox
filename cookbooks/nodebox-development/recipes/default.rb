# Use shared apt-get
include_recipe "apt-get"

# keep up to date
apt_update = execute "update apt" do
  user "root"
  command "apt-get update"
  action :nothing
end
apt_update.run_action(:run)

# install our required packages modules
node[:packages].each do | pkg |
  install_package = package pkg do
    action :nothing
  end
  install_package.run_action(:install)
end

include_recipe "zeromq"

# Setup Riak
# include_recipe "riak-search"

# no webserver! node will listen on port 80. As root! Hence, development.
include_recipe "nodejs"
include_recipe "nodejs::npm"

# install our required npm modules
node[:node_modules].each do | node_module |
  node_module_version = '@'
  execute "npm install #{node_module}" do
    command  "sudo npm_g install #{node_module} | grep '#{node_module}#{node_module_version}'"
    not_if "sudo npm_g ls | grep ' #{node_module}#{node_module_version}'"
  end
end

nodebox_config_link = bash "Create a shared symbolic link for nodebox.json" do
	user "root"
	cwd "/tmp"
	code <<-EOH
	if [ -d "/var/www/web/nodebox.json" ]; then 
		if [ -L "/var/www/web/nodebox.json" ]; then
			exit 0
		else
			sudo rm -rf /var/www/web/nodebox.json
			sudo ln -s /vagrant/nodebox.json /var/www/web/nodebox.json
		fi
	fi
	
	exit 0
	EOH
end
nodebox_config_link.run_action(:run)

include_recipe "nodejs-application"



