class Json
  def json(tempHash)

    File.open("temp.json","w") do |f|
      f.write(tempHash.to_json)
    end
  puts "./temp.json"
  end
end