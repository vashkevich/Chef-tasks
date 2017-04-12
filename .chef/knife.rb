# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "admin"
client_key               "#{current_dir}/admin.pem"
#chef_server_url          "https://192.168.33.14/organizations/epam"
chef_server_url          "https://epplkraw0381t1.budapest.epam.com/organizations/epam"
cookbook_path            ["#{current_dir}/../cookbooks"]
