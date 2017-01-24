#
# Cookbook Name:: chef-nodeapp
# Recipe:: express
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

nodejs_npm "npm-install" do
  path "/home/#{user}/nodeapp/nodeapp"
  user "#{user}"
  json true
end

bash "migrate" do
  code "sequelize db:migrate"
  cwd "/home/#{user}/nodeapp/nodeapp"
end