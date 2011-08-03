task :default => [:rocco]

desc 'Rocco yo'
task :rocco do
  puts "Rocco'ing your API dir"
  `rm -r API`
  `mkdir API`
  
  js = "var classes = [";
  
  #copy in Header files
  Dir.foreach("../../iphone/WibbleQuest/WibbleQuest/core/") do |f| 
      if f.end_with? ".h"
        `cp ../../iphone/WibbleQuest/WibbleQuest/core/#{f} API`
        js += '"' + f[0..-3] + '",'
      end
  end
  
  Dir.foreach("../../iphone/WibbleQuest/WibbleQuest/objects/") do |f| 
      if f.end_with? ".h"
        `cp ../../iphone/WibbleQuest/WibbleQuest/objects/#{f} API`
        js += '"' + f[0..-3] + '",'
      end
  end
  
  
  #put in a list of all classes
  js += "''];"
  json = File.new("API/files.js", "w");
  json.write js
  json.close
  
  #copy in Header files
  Dir.foreach("API") do |f| 
    if f.end_with? ".h"
  #    puts "rocco API/#{ f } -l objc -t _layouts/api.mustache"
      puts f
      `rocco API/#{ f } -l objc -t _layouts/api.mustache`
    end
  end
  
  #remove unused h files
  Dir.foreach("API") do |f| 
    `rm API/#{f}` if f.end_with? ".h"
  end
  
  puts "done."
end
