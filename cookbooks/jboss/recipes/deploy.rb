# Cookbook:: jboss
# Recipe:: deploy.rb
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#

#******* Download test appliction

remote_file "#{node['jboss']['install_folder']}/#{node['jboss']['app_dist_name']}" do
  source node['jboss']['app_repo']
  owner node[:jboss][:jboss_user]
  group node[:jboss][:jboss_group]
  action :create_if_missing
  mode '0755'
end

#******* Deploy application to Jboss

execute 'unzip_test_app' do
  cwd node['jboss']['install_folder']
  user node['jboss']['jb_user']
  group node['jboss']['jb_group']
  command "unzip -o #{node[:jboss][:app_dist_name]} -d #{node[:jboss][:app_deploy_folder]}"
  not_if { ::File.exist?("#{node[:jboss][:app_deploy_folder]}/testweb")}
  notifies :restart, 'service[jboss]', :immediately
end   
