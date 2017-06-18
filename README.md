# discord_local_music_bot

ローカルに保存されている音楽をディスコードのボイスチャンネルに流すためのBotです。

## 開発環境

CentOS7.3  
ruby2.3.3  
discordrb  
libsodium-1.0.10 [link](https://download.libsodium.org/libsodium/releases/)  
opus-1.1.5 [link](https://www.opus-codec.org/downloads/)  
ffmpeg-2.6.8  

## 使い方

```
$ git clone https://github.com/kanajp/discord_local_music_bot
$ cd discord_local_music_bot/config
$ cp example_config.rb config.rb
$ vim config.rb
```

パラメータを適切に変更しサーバにbotを追加した後に、musicディレクトリの中に音声ファイルを配置し次のコマンドを実行する。

ここまで終わったらあとは起動するだけ。

```
$ ruby run.rb
```

Botが起動したらDiscordのチャット欄に[prefix]helpと打ち込むとコマンドのリストが表示される。
prefixはデフォルトから変更していなければ'>'に設定されているので、>helpと入力する。
