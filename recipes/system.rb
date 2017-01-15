#
# Cookbook Name:: chef-nodeapp
# Recipe:: system
#
# Copyright (C) 2016 Chris Allen
#
# All rights reserved - Do Not Redistribute
#

if Dir.exists? "/home/vagrant"
    user = "vagrant"
else
  user = "ubuntu"
end

package "git"

include_recipe "nodejs::npm"
execute "upgrade_npm" do
  command "sudo npm -g install npm@latest"
  action :run
end
nodejs_npm "sails"