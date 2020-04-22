class Json
  def json(tempHash)

    File.open("db/email.json","w") do |f|
      f.write(tempHash.to_json)
    end
  puts "./db/email.json"
  end
end