namespace :manage_google do
  desc "Removes the duplicate file that was editied in google photos"
  task :remove_dups, [:dir, :test] do |t, args|
    dir   = args[:dir]
    test  = args[:test] ? true : false

    puts "Test: #{test}"
    puts "Searching through: #{dir}..."
    
    people = Hash.new(0)

    puts "Iterate over the files to find duplicate filenames..."
    all_photos = Dir["#{dir}/**/*.jpg"]
    photos_edited = all_photos.select { |file| file[/\d+\-edited.jpg$/i] }
    puts "Photo Dups: #{photos_edited.length}"

    size_of_dups = photos_edited.map{|f| File.size(f)}.inject(0, :+)
    puts "Size of Dups: #{size_of_dups/ 1024000} Megsbytes"

    photos_edited.each_with_index do |ef,i|
      p = ef.gsub(/\-edited/, '')  
      if File.exist?(p)   
        FileUtils.rm(p, force: true) unless test
        puts "#{i} Deleting #{p}"
      end
      all_photos.delete(p)
    end

    json_files= Dir["#{dir}/**/*.json"]
    puts "Json: #{json_files.length}"

    json_files.each_with_index do |f,i|
      dh = {}
      file = File.read(f)
      json = JSON.parse(file)
      pp json
      p = json['people']
      p.map{|n| people[ n['name']]  += 1 } if p.present?

      dh[:title] = json.dig('title')
      dh[:latitude] = json.dig('geoData', 'latitude')
      dh[:longitude] = json.dig('geoData', 'longitude')
      dh[:image_views] = json.dig('imageViews')
      dh[:photo_taken_time] = Time.parse(json.dig('photoTakenTime', 'formatted'))
      dh[:url] = json.dig('url')
      dh[:description] = json.dig('description')
      dh[:device_type] = json.dig('googlePhotosOrigin', 'mobileUpload', 'deviceType')
      dh[:title] = json.dig('title')
      #people[ person ] += 1
      binding.pry
    end
    pp people.sort_by{|k,v| v }.reverse
    mp4s  = Dir["#{dir}/**/*.mp4"]
    puts "Mp4s: #{mp4s.length}"

    binding.pry

    # File.size("Compressed/#{project}.tar.bz2") / 1024000
=begin    
    # Find duplicate filenames
    duplicates = filenames.select { |filename| filenames.count(filename) > 1 }
    
    # Remove duplicate files
    duplicates.each do |duplicate|
      edited_filename = "#{duplicate}-edited"
      FileUtils.rm("#{duplicate}.txt")
      FileUtils.rm("#{edited_filename}.txt")
    end
    
    puts "Duplicate files removed successfully."
=end



  end


end
