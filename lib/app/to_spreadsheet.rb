class Spreadsheet


def ss(hash)

# Creates a session. This will prompt the credential via command line for the
# first time and save it to config.json file for later usages.
# See this document to learn how to create config.json:
# https://github.com/gimite/google-drive-ruby/blob/master/doc/authorization.md
session = GoogleDrive::Session.from_config("config.json")

# First worksheet of
# https://docs.google.com/spreadsheet/ccc?key=pz7XtlQC-PYx-jrVMJErTcg
# Or https://docs.google.com/a/someone.com/spreadsheets/d/pz7XtlQC-PYx-jrVMJErTcg/edit?usp=drive_web
ws = session.spreadsheet_by_key("1lfU2lzX6IRWSoGBZpmJFSAmq4Y0G03VYGbtx680BRb8").worksheets[0]
# session.spreadsheet_by_key("1h6XiCem2mLjbSix4fIm5GcPoHOfwJArWQsgXIt-o6s4").worksheets[0]
# i=1
# hash.each_pair {|k,v|i=i+1 && i=i.to_s && ws[1, i] = k && ws[2, i] = v} 
i=0
hash.each_pair {|k,v| ws["#{i+=1}".to_i, 1] = k} 
i=0
hash.each_pair {|k,v| ws["#{i+=1}".to_i, 2] = v} 
# hash.each
# puts "#{key}:#{value}"
ws.save
puts "https://docs.google.com/spreadsheets/d/1lfU2lzX6IRWSoGBZpmJFSAmq4Y0G03VYGbtx680BRb8/edit#gid=0"



end


end