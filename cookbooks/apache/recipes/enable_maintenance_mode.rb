template "/etc/httpd/conf/httpd.conf" do
  source "httpd.erb"
  owner "apache"
  group "apache"
  mode '0755'
  variables({

})
end

