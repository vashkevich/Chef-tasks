#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


yum_package 'httpd' do
  action :install
end

template "#{node['exit-task']['apache_conf']}" do
  source "httpd.erb"
  owner 'apache'
  group 'apache'
  mode '0755'
  not_if { ::File.exist?("#{node['exit-task']['apache_conf']}")}
end

service "httpd" do
  supports :start => true, :stop => true, :status => false, :reload => true
  action [:enable, :start]
end

