require 'mp3info'

class Mp3Error < StandardError; end;

class Mp3FileName
  VERSION = "1.0.0"

  def initialize(path)
    @path = path
  end

  def change
    begin
      Dir["#{@path}/*.mp3"].each do |file|
        Mp3Info.open(file) do |mp3|
          title = mp3.tag.title.strip
          title.empty? ? file.gsub!(/^\d*_*/,'') : FileUtils.mv("#{file}", "#{title}.mp3")
          puts "Title changed to : #{title == file ? file : title}"
        end
      end
    rescue
      #raise Mp3Error, "An Unknown error has occured..."
    end
  end
end
