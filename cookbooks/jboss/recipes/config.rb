# Cookbook:: jboss
# Recipe:: config.rb
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#

#******* Copy init.d script for making Jboss AS as a service

template "/etc/init.d/jboss" do
  source "jboss_init_script.erb"
  owner "#{node[:jboss][:jb_user]}"
  group "#{node[:jboss][:jb_group]}"
  mode '0755'
  variables({
    :home => node[:jboss][:jboss_home],
    :ip => node[:jboss][:jboss_ip],
    :user => node[:jboss][:jb_user]
})
end

#******* Start Jboss service

service "jboss" do
  supports :start => true, :stop => true, :status => false, :reload => true
  action [:enable, :start]
end

