require 'mp3info'

class Mp3Error < StandardError; end;

class Mp3FileName
  VERSION = "1.0.3"

  def initialize(path)
    @path = path
  end

  def change
    Dir["#{@path}/*.mp3"].each do |old_file_name|
      Mp3Info.open(old_file_name) do |mp3|          
        new_file_name = convert_file_name(mp3, old_file_name)
        begin
          FileUtils.mv("#{old_file_name}", "#{@path}/#{new_file_name}.mp3")
          puts "'#{old_file_name.split('/')[-1]}' changed to '#{new_file_name}.mp3'"
        rescue          
          next
        end
      end
    end
  end

  def convert_file_name(mp3, file)
    file_name = mp3.tag.title ? "#{mp3.tag.title}" : file.split('.mp3')[0]
    file_name.gsub(/[\d_\-\[\]]/,'').gsub(/(\w+\.)+\w+/,'').strip
  end
end
