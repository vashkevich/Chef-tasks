
#yum_package 'java' do
#  action :install
#end

yum_package 'tomcat' do
  action :install
end

service "tomcat" do
  supports :start => true, :stop => true, :status => false, :reload => true
  action [:enable, :start]
end

