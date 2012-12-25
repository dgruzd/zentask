#coding: utf-8
namespace :db do
  desc "Hard development sqlite3 reset && seed"
    task :hard_reset do
      cmd = "rake db:drop && rake db:create && rake db:migrate && rake db:seed"
      puts cmd.gsub('rake','[rake]')
      exec "cd #{Rails.root} && #{cmd}"
    end

  desc "Soft database reset && seed"
    task :soft_reset do
      str = "rake db:migrate VERSION=0 && rake db:migrate && rake db:seed"
      puts str.gsub('rake','[rake]')
      exec str
    end

  desc "Create database config"
    task :init_config do
      app = Rails.application.class.parent_name.downcase
      str = <<EOF
development:
  adapter: postgresql
  encoding: utf8
  database: #{app}_development
  username:
  host: localhost
test:
  adapter: postgresql
  encoding: utf8
  database: #{app}_test
  username:
  host: localhost
production:
  adapter: postgresql
  encoding: utf8
  database: #{app}_production
  username: #{app}
  password: #{app}
  socket: /tmp
EOF
  file = 'config/database.yml'
  puts "[writing] #{file}"
  File.open("#{Rails.root}/#{file}",'w'){|f| f.write(str)}
    end

end
