#coding: utf-8
namespace :db do
  desc "Hard development sqlite3 reset && seed"
    task :hard_reset do
      file_name = 'db/development.sqlite3'
      print "[del] #{file_name}"
      begin
      File.delete("#{Rails.root}/#{file_name}")
      print " OK\n"
      rescue
      print " FAIL\n"
      end
      puts "[rake] db:migrate && [rake] db:seed"
      exec "cd #{Rails.root} && rake db:migrate && rake db:seed"
    end

  desc "Soft database reset && seed"
    task :soft_reset do
      str = "rake db:migrate VERSION=0 && rake db:migrate && rake db:seed"
      puts str.gsub('rake','[rake]')
      exec str
    end
end
