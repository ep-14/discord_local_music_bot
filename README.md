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
$ cd discord_local_music_bot
$ ./init.sh
$ cp example_config.rb config.rb
$ vim config.rb
```

パラメータを適切に変更しサーバにbotを追加した後に、musicディレクトリの中に音声ファイルを配置し次のコマンドを実行する。

```
$ ruby library_update.rb
```

ここまで終わったらあとは起動するだけ。

```
$ ruby run.rb
```

## コマンド

- *join*:
自分がボイスチャンネルに入っている状態でこのコマンドを使うと、現在入っているボイスチャンネルにボットを呼び出す事ができる。

- *load*:
ライブラリに登録されている音楽のリストを読み込む

- *shuffle*:
読み込んだ音楽のリストをシャッフルする

- *pause*:
再生を一時停止する

- *resume*:
一時停止を解除する
