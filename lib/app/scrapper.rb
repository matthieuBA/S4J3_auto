class Scrapper


    
def get_townhall_email(townhall_url)
    tab_out=[]
    page = Nokogiri::HTML(open(townhall_url))
    str="/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]"
    value=page.xpath(str).text
    str="html/body/div/main/section[1]/div/div/div/h1"
    key=page.xpath(str).text
    h=Hash.new
    h[key]=value
    # pp page.xpath(str).text
    # pp page.xpath(str).text
    tab_out << h
    return h
end

def get_townhall_urls
    tab=[]
    page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
    page.css(".lientxt").collect(&:text).each do |element|
        str=""
        str+="https://www.annuaire-des-mairies.com/95/"
        element.gsub!(" ", "-")
        str+=element.downcase
        str+=".html"
        tab << str
    end
return tab
end

def perform(tab)
    # out=Hash.new
    out=[]
    tab.each do |element|
         out << get_townhall_email(element)
        
    end
    return out
end



# perform(get_townhall_urls,tab_out)

end