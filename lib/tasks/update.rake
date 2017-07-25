namespace :update do
  desc 'Load a list of zipcodes'
  task :locations => :environment do
    Location.update_all
  end
end
