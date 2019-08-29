require 'pry'
require 'nokogiri'
# require libraries/modules here

def create_project_hash
  html = File.read('fixtures/kickstarter')
  kickstarter = Nokogiri::HTML(html)
binding.pry

end

create_project_hash

#projects_list > li:nth-child(1)