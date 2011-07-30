task :default => [:rocco]

desc 'Rocco yo'
task :rocco do
  puts "Rocco'ing your API dir"
  `rm -r API`
  `mkdir API`
  
  js = "var classes = [";
  
  #copy in Header files
  Dir.foreach("../../iphone/WibbleQuest/WibbleQuest/") do |f| 
      if f.end_with? ".h"
        `cp ../../iphone/WibbleQuest/WibbleQuest/#{f} API`
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
      puts f
      `rocco API/#{ f } -l objc -c "//"`
    end
  end
  
  #remove unused h files
  Dir.foreach("API") do |f| 
    `rm API/#{f}` if f.end_with? ".h"
  end
  
  puts "done."
end
