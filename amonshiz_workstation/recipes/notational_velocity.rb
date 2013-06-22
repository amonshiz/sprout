unless File.exists?("/Applications/Notational Velocity.app")

  remote_file "#{Chef::Config[:file_cache_path]}/NotationalVelocity.zip" do
    source "http://notational.net/NotationalVelocity.zip"
    owner node['current_user']
    checksum "301ee466e866b4f665d5d126f4775b3a004f8b95776a75bcf42385a6266b6298"
  end

  execute "unzip Notational Velocity" do
    command "unzip #{Chef::Config[:file_cache_path]}/NotationalVelocity.zip -d #{Chef::Config[:file_cache_path]}/"
    user node['current_user']
  end

  execute "copy Notational Velocity to /Applications" do
    command "mv #{Regexp.escape("#{Chef::Config[:file_cache_path]}/Notational Velocity.app")} #{Regexp.escape("/Applications/Notational Velocity.app")}"
    user node['current_user']
    group "admin"
  end

  ruby_block "test to see if Notational Velocity.app was installed" do
    block do
      raise "Notational Velocity.app was not installed" unless File.exists?("/Applications/Notational Velocity.app")
    end
  end

end



