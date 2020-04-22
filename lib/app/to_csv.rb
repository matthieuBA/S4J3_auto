class Csv
    def to_csv(hash)
        CSV.open("db/email.csv", "wb") {|csv| hash.to_a.each {|elem| csv << elem} }
        puts "./db/email.csv"
    end
    
end