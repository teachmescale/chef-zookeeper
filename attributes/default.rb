default[:zookeeper][:cluster_name] = "default"

# ZK defaults
default[:zookeeper][:user] = "zookeeper"
default[:zookeeper][:group] = "zookeeper"
default[:zookeeper][:myid] = 0
default[:zookeeper][:tick_time] = 2000
default[:zookeeper][:init_limit] = 10
default[:zookeeper][:sync_limit] = 5
default[:zookeeper][:client_port] = 2181
default[:zookeeper][:peer_port] = 2888
default[:zookeeper][:leader_port] = 3888

default[:zookeeper][:data_dir] = "/var/lib/zookeeper/data"
default[:zookeeper][:version] = "3.4.5"

default[:zookeeper][:autorun_ebs_volume_recipe] = false

default[:zookeeper][:ebs_vol_dev] = "/dev/sdp"
default[:zookeeper][:ebs_vol_size] = 10

default[:zookeeper][:search_cluster_servers] = not Chef::Config.solo or node.recipes.include?("chef-solo-search")
default[:zookeeper][:auto_add_current_node] = node.role?("zookeeper")
# ZK Cluster defaults
default[:zookeeper][:cluster_servers] = [{
  :name => node[:hostname],
  :zookeeper => { 
    :ipaddress => 'localhost',
    :fqdn => node[:fqdn], 
    :peer_port => node[:zookeeper][:peer_port],
    :leader_port => node[:zookeeper][:leader_port]
  }
}] 
