require 'zentask'
require 'rails'
module Zentask
class Railtie < Rails::Railtie
    railtie_name :zentask
    rake_tasks do
      load "tasks/db.rake"
#      Dir["tasks/*.rake"].each { |ext| load ext }
    end
  end
end
