# Cookbook:: jboss
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'java_se'

include_recipe 'jboss::install'
include_recipe 'jboss::config'
include_recipe 'jboss::deploy'


