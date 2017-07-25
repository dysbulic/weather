namespace :load do
  desc 'Load a list of zipcodes'
  task :zipcodes, [:file] => :environment do |t, args|
    if ! args[:file]
      puts "Usage: #{ARGV[0]}[filename]"
    else
      for line in File.readlines(args[:file])
        if match = line.match(/^\s*(\d+-?\d*)/)
          Location.find_or_create_by({ zipcode: match[1] })
        else
          STDERR.puts "Unknown line format: #{line.dump}"
        end
      end
    end
  end
end
