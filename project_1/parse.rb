#!/usr/bin/env ruby

require 'yaml'

class Animal
  
end

Dir.glob("*.yml").collect{|info| YAML.load_file(info)}.each do |info|
  info['good_apps'].each do |app|
  
#  puts <th>Good Apps</th>
   puts "#{app['name']}"
   puts "#{app['url']}"
   puts "#{app['note']}"


   f = File.new("project2.html", "w+")
   f.puts"<html><body bgcolor='tan'>"
   f.puts"<p>Good Apps</p>"
   f.puts"<table border='1' align='center'>"
   f.puts"<tr><th>Name</th>"
   f.puts"<th>URL</th>"
   f.puts"<th>Notes</th></tr>"
   f.puts"<tr><td>#{app['name']}</td>"
   f.puts"<td>#{app['url']}</td>"
   f.puts"<td>#{app['note']}</td></tr>"
   f.puts"</table>"
   f.puts "</body></html>"
   f.close()


Dir.glob("*.yml").collect{|info| YAML.load_file(info)}.each do |info|
  info['bad_apps'].each do |app|

   puts "#{app['name']}"
   puts "#{app['url']}"
   puts "#{app['note']}"


   f = File.new("project2.html", "w+")
   f.puts"<html><body bgcolor='tan'>"
   f.puts"<p>Bad Apps</p>"
   f.puts"<table border='1' align='center'>"
   f.puts"<tr><th>Name</th>"
   f.puts"<th>URL</th>"
   f.puts"<th>Notes</th></tr>"
   f.puts"<tr><td>#{app['name']}</td>"
   f.puts"<td>#{app['url']}</td>"
   f.puts"<td>#{app['note']}</td></tr>"
   f.puts"</table>"
   f.puts "</body></html>"
   f.close()
end
end
end
end

