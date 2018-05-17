require 'csv'

CSV.open("tmp/file.csv", 'wb') do |csv|
  csv << %w(Title Content Created_at Updated_at)
  note.each do |line|
    csv << line
  end
end