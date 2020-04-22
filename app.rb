require 'bundler'
require 'open-uri'
require 'json'
require 'pp'
require 'csv'
require "google_drive"
# Bundler.require

$:.unshift File.expand_path("./../lib/app", __FILE__)

require 'scrapper'
require 'to_json'
require 'to_csv'
require 'to_spreadsheet'

def hash_merge *hashes
    hashes.inject :merge
end



def choice
    puts "type JS to generating json"
    puts "type CSV to generating csv"
    puts "type SS to generating spreadsheet"
    puts "leave empty to generate all format"
    print ">"
    choice=gets.chomp
    my=Scrapper.new
    my_h=Hash.new
    my_h=hash_merge(*my.perform(my.get_townhall_urls))

    case choice
    when "JS"
        puts "generating JSON"
        js=Json.new
        js.json(my_h)
    
    when "CSV"
        puts "generating CSV"
        csv=Csv.new
        csv.to_csv(my_h)
    
    when "SS"
        puts "generating SPREADSHEET"
        ss=Spreadsheet.new
        ss.ss(my_h)
    else
        puts "You don't make a valide choice, generating all formats"
        puts "generating JSON"
        js=Json.new
        js.json(my_h)
        puts "generating CSV"
        csv=Csv.new
        csv.to_csv(my_h)
        puts "generating SPREADSHEET"
        ss=Spreadsheet.new
        ss.ss(my_h)
    end
end     

choice







