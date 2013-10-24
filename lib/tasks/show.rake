require 'fileutils'
namespace :show do
  desc 'Copy config file to /config/tunnel.yml'
  task :install=>:environment do
    FileUtils.cp File.expand_path("../../config/tunnel.yml", __FILE__), "#{Rails.root}/config/tunnel.yml"
  end

  desc 'Tunnel from your server to your app. Watch /config/tunnel.yml'
  task :current => :environment do
    SSH_TUNNEL = YAML.load_file("#{Rails.root}/config/tunnel.yml" )[Rails.env]
    public_host_username    =  SSH_TUNNEL['public_host_username' ]
    public_host             =  SSH_TUNNEL['public_host' ]
    public_port             =  SSH_TUNNEL['public_port' ]
    local_port              =  SSH_TUNNEL['local_port' ]
    puts "Opening #{public_host}:#{public_port} to 0.0.0.0:#{local_port}"
    exec "ssh -nNT -g -R *:#{public_port}:0.0.0.0:#{local_port} #{public_host_username}@#{public_host}"
  end

end
