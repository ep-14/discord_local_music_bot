#!/usr/bin/env ruby

require 'discordrb'
require_relative 'config/config.rb'

# -------------------------------------------
# Initialize
# -------------------------------------------

bot = Discordrb::Commands::CommandBot.new token: Config.token, client_id: Config.appid, prefix: Config.prefix
music = Array.new

# -------------------------------------------
# Commands
# -------------------------------------------

# HELPコマンド
bot.command(:help) do |event|
  text = ''
  File.open('docs/help_command', 'r') { |file|
    file.each_line do |tmp|
      text = text + tmp
    end
  }
  event.send_message("#{text}")
end

# ライブラリを読み込み
bot.command(:load) do |event|
  sounds_path = "music"
  File.open('lib/music.lib', 'w') { |file|
    Dir.chdir(sounds_path)
    file.puts(Dir.glob("*"))
  }

  Dir.chdir("../")

  File.open('lib/music.lib', 'r') { |file|
    music = file.readlines
  }
  event.send_message("Library loading complete.")
end

=begin
現在よみこまれている音楽のリストを出力するコマンド。
今はテキストチャンネルに直接書き出すように実装されているが、
負荷が大きいためテキストファイルなどの形式で出力するように変更する予定。
=end
bot.command(:list) do |event|
  music.each do |file|
    event.send_message("#{file}")
  end
end

# botをヴォイスチャンネルに参加させる
bot.command(:join) do |event|
  channel = event.user.voice_channel
  next "You're not in any voice channel!" unless channel
  bot.voice_connect(channel)
  event.voice.volume = 0.15
  event.send_message("Connected to voice channel: #{channel.name}")
end

# 音楽を再生する
bot.command(:play) do |event|
  music.each do |file|
    bot.game = "#{file}"
    file = "music/#{file}".chomp!
    voice_bot = event.voice
    voice_bot.play_file("#{file}")
  end
end

# 一時停止
bot.command(:pause) do |event|
  voice_bot = event.voice
  voice_bot.pause
end

# 一時停止から復帰
bot.command(:resume) do |event|
  voice_bot = event.voice
  voice_bot.continue
end

# 音楽リストをシャッフル
bot.command(:shuffle) do |event|
  music = music.shuffle
  event.send_message("shuffle complete!")
end

bot.run
