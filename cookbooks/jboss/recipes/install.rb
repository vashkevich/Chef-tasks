# Cookbook:: jboss
# Recipe:: install


#******* create jboss user, group and set home directory

user node['jboss']['jb_user'] do
  gid node['jboss']['jb_group']
  home "#{node['jboss']['jboss_home']}"
  system true
  shell '/bin/bash'
  action :create
end

#******* download jboss installation package

remote_file "#{node['jboss']['install_folder']}/#{node['jboss']['jb_dist_name']}" do
  source node['jboss']['jb_repo']
  owner node[:jboss][:jboss_user]
  group node[:jboss][:jboss_group]
  action :create_if_missing
  mode '0755'
end

#******* set up Jboss Application Server

execute 'unzip_jboss' do
  cwd node['jboss']['install_folder']
  command "unzip #{node[:jboss][:jb_dist_name]}"
#  owner node[:jboss][:jb_user]
#  group node[:jboss][:jb_group]
  not_if { ::File.directory?("#{node[:jboss][:jboss_home]}")}
end


