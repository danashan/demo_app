#!/usr/bin/env ruby

require 'yaml'

#create html file
f = File.new("app_reviews.html", "w+")

f.puts"<html><body bgcolor='wheat';font-family='helvetica';font-color='red' >"
f.puts"<p><h2>Good Apps</h2></p>"
# good apps table
f.puts"<table border='2' align='center' >"
f.puts"<tr><th>Name</th>"
f.puts"<th>URL</th>"
f.puts"<th>Notes</th></tr>"

#loop through good apps
Dir.glob("*.yml").collect{|info| YAML.load_file(info)}.each do |info|
  info['good_apps'].each do |app|

# for each, fill these in  
   puts "#{app['name']}"
   puts "#{app['url']}"
   puts "#{app['note']}"

   f.puts"<tr><td>#{app['name']}</td>"
   f.puts"<td>#{app['url']}</td>"
   f.puts"<td>#{app['note']}</td></tr>"

# end of good apps table
#f.puts"</table>"

end  # end of good apps loop
#f.puts"</table>"
end
f.puts"</table>"
#bad apps table
f.puts"<p><h2>Bad Apps</h2></p>"
f.puts"<table border='2' align='center'>"
f.puts"<tr><th>Name</th>"
f.puts"<th>URL</th>"
f.puts"<th>Notes</th></tr>"

Dir.glob("*.yml").collect{|info| YAML.load_file(info)}.each do |info|
  info['bad_apps'].each do |app|

   puts "#{app['name']}"
   puts "#{app['url']}"
   puts "#{app['note']}"

   f.puts"<tr><td>#{app['name']}</td>"
   f.puts"<td>#{app['url']}</td>"
   f.puts"<td>#{app['note']}</td></tr>"

end # end bad apps loop


f.puts "</body></html>"


end
f.puts"</table>"
   f.close()
