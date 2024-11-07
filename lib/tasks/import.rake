require 'csv'

desc "Import station and bike data"
task initial_import: [:environment] do
  CSV.foreach(("./notes/station-data.csv"), headers: true, col_sep: ",") do |row|
    s = Station.new(identifier: row[0], name: row[1], address: row[6])
    s.save!
  end
  CSV.foreach(("./notes/bike-data.csv"), headers: true, col_sep: ",") do |row|
    b = Bike.new(identifier: row[0], current_station: Station.find_by(identifier: row[1]))
    b.save!
  end
  CSV.foreach(("./notes/user-data.csv"), headers: true, col_sep: ",") do |row|
    u = User.new(identifier: row[0], username: row[1],first: row[2],last: row[3], email: row[4], password: row[5])
    puts(u)
    u.save!
  end
end