# Cookbook:: jboss
# Recipe:: install


#******* download jboss installation package

remote_file "#{node['jboss']['install_folder']}/#{node['jboss']['jb_dist_name']}" do
  source node['jboss']['jb_repo']
  action :create_if_missing
  mode '0755'
end

#******* set up Jboss Application Server

package 'unzip' do
  action :install
end

execute 'unzip_jboss' do
  cwd node['jboss']['install_folder']
  command "unzip #{node[:jboss][:jb_dist_name]}"
  not_if { ::File.directory?("#{node[:jboss][:jboss_home]}")}
end

#******* create jboss group and set home directory

group node['jboss']['jb_group'] do
  action :create
end

#******* create jboss user and set home directory

user node['jboss']['jb_user'] do
  gid node['jboss']['jb_group']
  home "#{node[:jboss][:jboss_home]}"
  system true
  shell '/bin/bash'
  action :create
end

