#
# Cookbook:: exit-task
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'java'

include_recipe 'exit-task::install_tomcat'
include_recipe 'apache'
include_recipe 'exit-task::deploy'

