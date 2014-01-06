
sip_version = node['python-sip']['version']
sip_cache_file = "#{Chef::Config[:file_cache_path]}/sip-#{sip_version}.tar.gz"
sip_unpack_path = "#{Chef::Config[:file_cache_path]}/sip-#{sip_version}"

include_recipe "build-essential"

if node['python-sip']['python_version'].to_s == "2"
  package "python-dev"
else
  package "python#{node['python-sip']['python_version']}-dev"
end


# only run this if the version doesn't match
installed_sip_version = `"#{node['python-sip']['python_cmd']}" -c "import sip; print(sip.SIP_VERSION_STR)" 2>&1`.strip

if $?.exitstatus != 0 or installed_sip_version != sip_version

  remote_file sip_cache_file do
    source node['python-sip']['uri']
    mode "0644"
    not_if { ::File.exists?(sip_cache_file) }
  end
  
  execute "unpack sip #{sip_version}" do
    command "tar -xzvf \"#{sip_cache_file}\""
    cwd "#{Chef::Config[:file_cache_path]}"
  end
  
  execute "configure sip #{sip_version}" do
    command "\"#{node['python-sip']['python_cmd']}\" \"#{sip_unpack_path}/configure.py\""
    cwd sip_unpack_path
  end
  
  execute "install sip #{sip_version}" do
    command "make && make install"
    cwd sip_unpack_path
  end

end
