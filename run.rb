#!/usr/bin/env ruby

require 'discordrb'
require_relative 'config.rb'

bot = Discordrb::Commands::CommandBot.new token: Config.token, client_id: Config.appid, prefix: Config.prefix

music = Array.new

bot.command(:load) do |event|
  File.open('lib/music.lib', 'r') { |file|
    music = file.readlines
  }
  event.send_message("loading complete")
end

bot.command(:put) do |event|
  music.each do |file|
    event.send_message("#{file}")
  end
end

bot.command(:join) do |event|
  channel = event.user.voice_channel
  next "You're not in any voice channel!" unless channel
  bot.voice_connect(channel)
  event.voice.volume = 0.15
  event.send_message("Connected to voice channel: #{channel.name}")
end

bot.command(:play) do |event|
  music.each do |file|
    bot.game = "#{file}"
    file = "music/#{file}".chomp!
    voice_bot = event.voice
    voice_bot.play_file("#{file}")
  end
end

bot.command(:pause) do |event|
  voice_bot = event.voice
  voice_bot.pause
end

bot.command(:resume) do |event|
  voice_bot = event.voice
  voice_bot.continue
end

bot.command(:shuffle) do |event|
  music = music.shuffle
  event.send_message("shuffle complete!")
end

bot.run
