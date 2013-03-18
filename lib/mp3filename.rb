require 'mp3info'

class Mp3Error < StandardError; end;

class Mp3FileName
  VERSION = "1.0.0"

  def initialize(path)
    @path = path
  end

  def change
    Dir["#{@path}/*.mp3"].each do |file|
      Mp3Info.open(file) do |mp3|          
        title = mp3.tag.title
        title ||= ""        
        file_name = title.empty? ? file.gsub(/^\d*_*/,'') : "#{title}.mp3"
        begin
          FileUtils.mv("#{file}", file_name)
          puts "File Name changed to : #{file_name}"
        rescue
          next
        end
      end
    end
  end
end
