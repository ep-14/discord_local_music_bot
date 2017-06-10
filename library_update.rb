File.open('lib/music.lib', 'w') do |f|
    f.puts(Dir.glob("music/*.mp3"))
end
