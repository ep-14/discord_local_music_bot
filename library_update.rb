sounds_path = "music"

File.open('lib/music.lib', 'w') do |f|
  Dir.chdir(sounds_path)
  f.puts(Dir.glob("*"))
end
