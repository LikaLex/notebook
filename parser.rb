require 'csv'

CSV.open("tmp/file.csv", 'wb') do |csv|
  csv << %w(Title Content Created_at Updated_at)
  note.each do |line|
    if note.status.id == 2
      csv << line
      note.status.id = 3
    end


  end
end