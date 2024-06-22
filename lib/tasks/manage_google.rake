namespace :manage_google do
  desc "Removes the duplicate file that was editied in google photos"
  task :remove_dups, [:dir, :test] => :environment do |t, args|
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
      photos_edited.delete_at(i)
    end

    all_photos_hash = {}
    all_photos.each do |p|
      photo_file_name = File.basename(p, '.*')
      photo_file_name = File.basename(photo_file_name, '.*')
      photo_file_name.delete!('-edited')
      all_photos_hash[photo_file_name] = p
    end

    json_files= Dir["#{dir}/**/*.json"]
    puts "Json: #{json_files.length}"

    json_files.each_with_index do |f,i|
      next if f =~ /metadata.json$/
      dh = {}
      file = File.read(f)
      json = JSON.parse(file)
      pp json
      p = json['people']
      p.map{|n| people[ n['name']]  += 1 } if p.present?

      dh[:user] = User.first
      dh[:title] = json.dig('title')
      dh[:latitude] = json.dig('geoData', 'latitude')
      dh[:longitude] = json.dig('geoData', 'longitude')
      dh[:altitude] = json.dig('geoData', 'altitude')
      dh[:image_views] = json.dig('imageViews')
      dh[:photo_taken_time] = Time.parse(json.dig('photoTakenTime', 'formatted')) unless json.dig('photoTakenTime', 'formatted').blank?
      dh[:url] = json.dig('url')
      dh[:description] = json.dig('description')
      dh[:device_type] = json.dig('googlePhotosOrigin', 'mobileUpload', 'deviceType')
      #people[ person ] += 1
      photo = Photo.create!(dh)

      # Remove the .jpeg.json to locate the actual location in the 
      # app_photos array
      photo_file_name = File.basename(f, '.*')
      photo_file_name = File.basename(photo_file_name, '.*')


      #dh[:title]
      photo_path = all_photos_hash[photo_file_name]
      binding.pry unless photo_path.present?
      photo.image.attach(io: File.open(photo_path), filename: dh[:title])
    
    end
    pp people.sort_by{|k,v| v }.reverse
    mp4s  = Dir["#{dir}/**/*.mp4"]
    puts "Mp4s: #{mp4s.length}"



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
