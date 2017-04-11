
remote_file "#{node['exit-task']['deploy_folder']}/#{node['exit-task']['app_dist_name']}" do
  source node['exit-task']['app_repo']
  action :create_if_missing
  mode '0755'
end

yum_package 'unzip' do
  action :install
end

execute 'unzip_test_app' do
  cwd node['exit-task']['deploy_folder']
  command "unzip -j #{node['exit-task']['app_dist_name']}"
  not_if { ::File.directory?("#{node['exit-task']['deploy_folder']}/testweb")}
end

