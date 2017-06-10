require 'discordrb'

bot_token = 'MzIxMjUwODM2NTM1ODM2Njcy.DBbTqw.cvF7Fipxb6aBvgXWKRiNM5ldn9Y'
bot_id = 321250836535836672

bot = Discordrb::Commands::CommandBot.new token: bot_token, client_id: bot_id, prefix: '>'

music = []
File.open('lib/music.lib', 'r') {|f|
  music = f.readlines
}

bot.command(:join) do |event|
  channel = event.user.voice_channel
  next "You're not in any voice channel!" unless channel
  bot.voice_connect(channel)
  "Connected to voice channel: #{channel.name}"
end

bot.command(:play) do |event|
  voice_bot = event.voice
  voice_bot.play_file("music/10 Melted Snow (四条貴音ソロVer.).mp3")
end

bot.command(:put_info) do |event|
  i = rand(200)
  puts music[0]
end

bot.run
