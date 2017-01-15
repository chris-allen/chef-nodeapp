#
# Cookbook Name:: chef-nodeapp
# Recipe:: sails
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