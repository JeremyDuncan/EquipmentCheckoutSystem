# lib/tasks/db_seed.rake
namespace :db do
  namespace :seed do
    desc "Load the inventory seed file"
    task :inventory => :environment do
      load(Rails.root.join('db', 'seeds', 'inventory_seed.rb'))
    end

    desc "Load the employee seed file"
    task :employee => :environment do
      load(Rails.root.join('db', 'seeds', 'employee_seed.rb'))
    end
  end
end
