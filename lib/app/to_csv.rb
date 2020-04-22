class Csv
    def to_csv(hash)
        CSV.open("data.csv", "wb") {|csv| hash.to_a.each {|elem| csv << elem} }
        puts "./data.csv"
    end
    
end