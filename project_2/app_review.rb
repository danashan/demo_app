#!/usr/bin/env ruby

require 'yaml'

if ARGV.size != 1
  puts "Usage: app_review.rb <outputfile>"
else
  inputfile = ARGV[0]
  outputfile = ARGV[1]
 # puts "Input file: #{@app_review}"
  #puts "Output file: #{@app_reviews}"
  
#create html file
f = File.new("app_reviews.html", "w+")

f.puts"<html><body bgcolor='#989f89' >"
f.puts"<head>"
f.puts"</head>"
f.puts"<p><h2>Good Apps</h2></p>"
# good apps table
f.puts"<table border='2'; align='center'; bgcolor='#c4bd9c'; >"
f.puts"<tr><th><h3>Name</h3></th>"
f.puts"<th><h3>URL</h3></th>"
f.puts"<th><h3>Notes</h3></th></tr>"

#loop through good apps
apps =Dir.glob("*.yml").collect{|info| YAML.load_file(info)}.each do |info|
  info['good_apps'].each do |app|
#apps.sort_by{['name']}.uniq.each do |info|

# for each, fill these in  
 #  puts "#{app['name']}"
  # puts "#{app['url']}"
   #puts "#{app['note']}"

   f.puts"<tr><td>#{app['name']}</td>"
   f.puts"<td>#{app['url']}</td>"
   f.puts"<td>#{app['note']}</td></tr>"


end  # end of good apps loop

end
f.puts"</table>"
#bad apps table
f.puts"<p><h2>Bad Apps</h2></p>"
f.puts"<table border='2' align='center' bgcolor='#c4bd9c'>"
f.puts"<tr><th><h3>Name</h3></th>"
f.puts"<th><h3>URL</h3></th>"
f.puts"<th><h3>Notes</h3></th></tr>"

Dir.glob("*.yml").collect{|info| YAML.load_file(info)}.each do |info|
  info['bad_apps'].each do |app|

#   puts "#{app['name']}"
 #  puts "#{app['url']}"
  # puts "#{app['note']}"

   f.puts"<tr><td>#{app['name']}</td>"
   f.puts"<td>#{app['url']}</td>"
   f.puts"<td>#{app['note']}</td></tr>"

end # end bad apps loop


f.puts "</body></html>"
#puts "Generated app_reviews.html"

end
f.puts"</table>"
   f.close()
   puts "Generated app_reviews.html"
end