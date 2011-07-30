task :default => [:rocco]

desc 'Rocco yo'
task :rocco do
  puts "Rocco'ing your API dir"
  `rm -r API`
  `mkdir API`
  
  #copy in Header files
  Dir.foreach("../../iphone/WibbleQuest/WibbleQuest/") do |f| 
      `cp ../../iphone/WibbleQuest/WibbleQuest/#{f} API` if f.end_with? ".h"
  end
  
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
