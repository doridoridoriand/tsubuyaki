set :output, "/home/dorian/Works/tsubuyaki/log/crontab.log"
set :environment, :production
env :PATH, ENV['PATH']
job_type :rbenv_rake, %q!eval "$(rbenv init -)"; cd :path && :environment_variable=:environment bundle exec rake :task --silent :output!

# 7分毎に行うタスク用
time = []
(0..23).to_a.each do |hour|
  (0..59).to_a.each do |minute|
    if minute % 7 == 0
      time << "#{'%02d' % hour}:#{'%02d' % minute}"
    end
  end
end

# 9分毎に行うタスク用
time2 = []
(0..23).to_a.each do |hour|
  (0..59).to_a.each do |minute|
    if minute % 9 == 0
      time2 << "#{'%02d' % hour}:#{'%02d' % minute}"
    end
  end
end
# 現状ではあまり:hourと代わり映えしないけど、細かく指定できる方がいいのでこちらで登録。あと夜つぶやいても仕方がない気がするので
# これだとただのスパムボットに成り下がっているので一旦すべて廃止
every 1.day, at: (6..23).to_a.map {|hour| hour = "#{'%02d' % hour}:00"} do
end

# 朝配信するボット
every 1.day, at: "06:30" do
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k tshirt -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k shirt -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k polo-shirt -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k vest -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k parka -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k sweat -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
end

# お昼配信するボット
every 1.day, at: "12:00" do
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k tshirt -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k shirt -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k polo-shirt -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k vest -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k parka -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k sweat -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k outdoor -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k iPhone-case -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k sneaker -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k one-piece -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
end

# 夜配信するボット
every 1.day, at: "18:25" do
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k tshirt -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k shirt -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k polo-shirt -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k vest -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k parka -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k sweat -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k outdoor -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
end

# 夜の遅い時間帯に配信するボット
every 1.day, at: "21:00" do
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k iPhone-case -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k sneaker -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k one-piece -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
end

# follow follower of seed account
every :monday, at: time do
end

# follow mutual accounts
every :wednesday, at: time do
end

# unfollow not followback account
every 1.day, at: time do
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k tshirt -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k shirt -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k polo-shirt -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k vest -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k parka -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k sweat -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k outdoor -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k iPhone-case -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k sneaker -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"

  # またつぶやかせていないが、今後使う予定なのでとりあえずユーザー数を適切にする
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k knit -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k cardigan -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k ensemble -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k jersey -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k tanktop -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k camisole -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k tubetop -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k jacket -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k blouson -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k down -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k mountain-parka -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k skirt -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k pants -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k denim -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k sandal -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k pumps -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
end

every 1.day, at: time2 do
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k boots -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k booties -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k deck-shoes -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k rain-shoes -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k all-in-one -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k one-piece -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k party-dress -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k suit-jacket -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k suit-vest -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k suit-pants -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k suit-skirt -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k setup -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k necktie -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k bra -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k shorts-panties -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k mens-pants -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k necklace -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k pierced-earrings -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k ring -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k swimsuit -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k tote-bag -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k backpack -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k traveling-bag -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
#  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k handbag -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
#  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k clutch-bag -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
#  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k gaucho-pants -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
#  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k dress-shoes -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
#  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k hat -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
#  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k peplum -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
#  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k off-shoulder -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
#  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k linen -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
end
