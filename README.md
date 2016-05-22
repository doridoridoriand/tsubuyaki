
[![codebeat badge](https://codebeat.co/badges/5315d533-2735-4801-8f43-e079f77d71d8)](https://codebeat.co/projects/github-com-doridoridoriand-tsubuyaki)

# 実行方法
## `tweet_specific_keyword`
`./bin/tweet_specific_keyword -k キーワード -n 一回の実行でつぶやく回数 [-l logfileの絶対パス(指定しないと標準出力)] [-e --execute]`

# cron更新方法
- `schedule.rb`を編集し終わる
- `bundle exec whenever --update-crontab`を実行してcronを出力&反映
- 反映されているか`crontab -e`でファイルを開いて確認
- 間違っていたりして反映を取り消したい(削除したい)場合は`bundle exec whenever --clear-crontab`

# JSONのentryの性別選択方法
`keyword_en`の末尾に__women,__menと入れることによって、JSONのentryに埋め込まれた性別の分岐させている
