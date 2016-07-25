class Pet < ApplicationRecord
belongs_to :owner

  validates :name, presence: {message: "You need to enter your pets name"}
validates :animal, presence: {message: "You need to enter the type of animal, dog or cat!"}
  validates :breed, presence: {message: "You need to enter the type of breed!"}


def self.scrape(animal, breed)

  if (animal == nil) && (breed == nil)
     "Enter your Pet information"
  elsif (animal == "dog")
    @url = "http://www.petmd.com/#{animal}/breeds/c_dg_#{breed.gsub(" ","_")}"
    response= HTTParty.get @url
    dom = Nokogiri::HTML(response.body)
    petchar= dom.css(".vital-stats")
    petinfo = {}
    petinfo[:ranking]= petchar.css(".value")[0].text
    petinfo[:char]= petchar.css(".value")[1].text
    petinfo[:weight]= petchar.css(".value")[2].text
    petinfo
else (animal == "cat")
  @url = "http://www.petmd.com/#{animal}/breeds/c_ct_#{breed.gsub(" ","_")}"
  response= HTTParty.get @url
  dom = Nokogiri::HTML(response.body)
  # catinfo = dom.css('meta[@itemprop = "articleBody"]')
  catinfo = dom.xpath("//div[@itemprop= 'articleBody']").css('p')[5].text




end


end
end
