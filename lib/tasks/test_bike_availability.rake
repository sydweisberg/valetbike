desc "Set bike status for testing purposes only"
task test_bike_avail: [:environment] do
  Bike.where(id.even?).each do |b|
    b.update(status: "available")
    b.save!
  end
  Bike.where(id.odd).each do |b|
    b.update(status: "service")
    b.save!
  end
  Bike.where(id>9000).each do |b|
    b.update(status: "charging")
    b.save!
  end

end
