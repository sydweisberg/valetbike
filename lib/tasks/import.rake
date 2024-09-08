require 'csv'

desc "Import station and bike data"
task initial_import: [:environment] do
  CSV.foreach(("./notes/station-data.csv"), headers: true, col_sep: ",") do |row|
    Station.new(identifier: row[0], name: row[1], address: row[6])
  end
  CSV.foreach(("./notes/bike-data.csv"), headers: true, col_sep: ",") do |row|
    Bike.new(identifier: row[0], current_station: Station.find_by(identifier: row[1]))
  end
end
