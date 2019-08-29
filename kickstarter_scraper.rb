require 'pry'
require 'nokogiri'
# require libraries/modules here

def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  projects = {}

  # Iterate through the entire projects hash of scraped material
  kickstarter.css("li.project.grid_4").each do |project|
    # THIS IS TOO BIG  projects[project] = {}
    # Start the iteration with the title to work with asmaller data set.
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {
      :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
      :description => project.css("p.bbcard_blurb").text,
      :location => project.css("ul.project-meta li").text.gsub("\n", ""),
      :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i
    }
  end

  

projects
# binding.pry

end

create_project_hash
# projects: kickstarter.css("li.project.grid_4")
# title: project.css("h2.bbcard_name strong a").text
# image: project.css("div.project-thumbnail a img").attribute("src").value
# description: project.css("p.bbcard_blurb").text
# location: project.css("ul.project-meta li").text.gsub("\n", "")
# funded: project.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i