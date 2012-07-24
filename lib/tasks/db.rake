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
end
