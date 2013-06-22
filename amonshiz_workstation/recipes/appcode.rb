dmg_package node["appcode_name"] do
	source node["appcode_download_uri"]
	checksum node["appcode_md5_checksum"]
	owner node['current_user']
	action :install
end