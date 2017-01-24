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

# Install node
node.set['nodejs']['install_method'] = 'binary'
node.set['nodejs']['version'] = '6.9.2'
node.set['nodejs']['binary']['checksum'] = '997121460f3b4757907c2d7ff68ebdbf87af92b85bf2d07db5a7cb7aa5dae7d9'
include_recipe "nodejs::npm"

#Install sequelize cli
nodejs_npm "sequelize-cli@2.5.1"
# Add sequelize to path
link '/usr/local/bin/sequelize' do
  to "/usr/local/nodejs-#{node['nodejs']['install_method']}-#{node['nodejs']['version']}/bin/sequelize"
end