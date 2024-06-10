namespace :manage_google do
  desc "Removes the duplicate file that was editied in google photos"
  task :remove_dups, [:dir, :test] do |t, args|
    dir   = args[:dir]
    test  = args[:test] ? true : false

    puts "Searching through: #{dir}..."
    # Initialize an array to store the filenames
    
    photo_dups = Dir["#{dir}/**/*-edited.jpg"]
    puts "Photo Dups: #{photo_dups.length}"

    size_of_dups = photo_dups.map{|f| File.size(f)}.inject(0, :+)
    puts "Size of Dups: #{size_of_dups/ 1024000} Megsbytes"

    json  = Dir["#{dir}/**/*.json"]
    puts "Json: {json.length}"

    mp4s  = Dir["#{dir}/**/*.mp4"]
    puts "Mp4s: #{mp4s.length}"

    # Iterate over the files to find duplicate filenames
    photo_dups.each do |file|
      dup_file_path = file.gsub(/\-edited\.jpg/, '.jpg')
      
      
      if File.exist?(dup_file_path)
        puts "#{dup_file_path} exists"
        binding.pry
      end
    end

    # File.size("Compressed/#{project}.tar.bz2") / 1024000
    
    # Find duplicate filenames
    duplicates = filenames.select { |filename| filenames.count(filename) > 1 }
    
    # Remove duplicate files
    duplicates.each do |duplicate|
      edited_filename = "#{duplicate}-edited"
      FileUtils.rm("#{duplicate}.txt")
      FileUtils.rm("#{edited_filename}.txt")
    end
    
    puts "Duplicate files removed successfully."





    binding.pry
  end


end
