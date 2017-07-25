namespace :load do
  desc 'Load a list of zipcodes'
  task :zipcodes, [:file] => :environment do |t, args|
    puts "Usage: #{ARGV[0]}[filename]" && return if ARGV.length == 1
    
    for line in File.readlines(args[:file])
      Location.find_or_create_by({ zipcode: line })
    end
  end
end
