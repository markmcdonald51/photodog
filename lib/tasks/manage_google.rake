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

    # Check for a duplicate using the path
    md5_photos = {}
    all_photos.each do |photo_path|
      #h = { filename: 'name', hash: Digest::MD5.file(photo_path).hexdigest  }
      md5_photos[Digest::MD5.file(photo_path).hexdigest] = photo_path
    end

    
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
      device_type = json.dig('googlePhotosOrigin', 'mobileUpload', 'deviceType')
      #people[ person ] += 1
      photo = Attachment::Photo.create!(dh)

      # Remove the .jpeg.json to locate the actual location in the 
      # app_photos array
      photo_file_name = File.basename(f, '.*')
      photo_file_name = File.basename(photo_file_name, '.*')

      photo.device = Device.find_or_create_by(name: device_type.downcase) if device_type.present?

      #dh[:title]
      photo_path = all_photos_hash[photo_file_name]

      if  photo_path.blank?
        #binding.pry 
        puts "#{photo_path} not in hash!"
        next
      end  
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


  desc "Find Duplicate Files"
  task :find_dups, [:dir, :test] => :environment do |t, args|
    dir   = args[:dir]
    test  = args[:test] ? true : false

    files = Pathname(dir).glob("**/*").reject(&:directory?)
    ffmpeg_metadata = %w(
    duration bitrate size video_stream video_codec colorspace resolution 
    width height frame_rate audio_stream audio_codec audio_sample_rate audio_channels)
    movies_meta_data_ary = []
    files.each_with_index do |f, i|
      puts "Starting #{f}".red
      movie = FFMPEG::Movie.new(f.to_s)
      movies_meta_data_ary <<  ffmpeg_metadata.inject({}){|hash,item| 
        hash[:filepath] ||= f
        hash[item.to_sym] = movie.send(item)
        hash
      }
      #Digest::MD5.hexdigest(movies_meta_data_ary.first.to_json ) 
    end
    #d = files.map.with_index {|f, i| puts "%i / %i" % [i, files.size] if i % 1000 == 12;  [f, Digest::MD5.file(f)] }.group_by(&:last).select {|a,v| v.size > 1 }
    #movies_meta_data_ary.first[:filepath].basename.to_s
    
    movies_meta_data_ary.each_with_index do |h, i| 
      m = h[:filepath].basename.to_s.match(/^(.*)\-([\w]+)\.(.*)$/)
      file_name, view_id, suffix = m[1..3]
      puts "view_id: #{view_id}".red.underline
      title_array = file_name.split   
      binding.pry
    end
    binding.pry
  end

end
