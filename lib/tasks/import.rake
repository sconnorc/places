require 'csv'

namespace :csv do

  desc "Import CSV Data"
  task :import_stuff => :environment do

    csv_file_path = 'db/landmarks.csv'

    CSV.foreach(csv_file_path) do |row|
      row = Landmark.create!({
        :longitude => row[0],
        :latitude => row[1],
        :name => row[2],
        :description => row[3],        
      })
      puts "Row added!"
    end
  end
end