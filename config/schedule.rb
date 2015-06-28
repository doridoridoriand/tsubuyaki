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

# 朝配信するボット
every 1.day, at: "06:30" do
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k tshirt     -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k shirt      -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k polo-shirt -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k vest       -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k parka      -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k sweat      -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
end

# お昼配信するボット
every 1.day, at: "12:00" do
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k tshirt              -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k shirt               -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k polo-shirt          -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k vest                -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k parka               -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k sweat               -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k outdoor             -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k iPhone-case         -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k sneaker             -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k sandal__WOMEN       -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k swimsuit__WOMEN     -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k one-piece__WOMEN    -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k gaucho-pants__WOMEN -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k hat                 -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k peplum              -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k off-shoulder        -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k linen               -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k bra                 -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k shorts-panties      -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k cardigan            -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
end

# 週末の15時あたりに配信するボット
every :saturday, at: "15:00" do
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k tshirt              -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k shirt               -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k polo-shirt          -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k vest                -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k parka               -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k sweat               -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k outdoor             -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k iPhone-case         -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k sneaker             -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k sandal__WOMEN       -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k swimsuit__WOMEN     -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k one-piece__WOMEN    -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k gaucho-pants__WOMEN -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k hat                 -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k peplum              -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k off-shoulder        -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k linen               -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k bra                 -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k shorts-panties      -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k cardigan            -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
end

every :sunday, at: "15:00" do
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k tshirt              -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k shirt               -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k polo-shirt          -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k vest                -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k parka               -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k sweat               -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k outdoor             -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k iPhone-case         -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k sneaker             -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k sandal__WOMEN       -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k swimsuit__WOMEN     -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k one-piece__WOMEN    -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k gaucho-pants__WOMEN -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k hat                 -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k peplum              -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k off-shoulder        -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k linen               -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k bra                 -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k shorts-panties      -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k cardigan            -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
end

# 夜配信するボット
every 1.day, at: "18:25" do
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k tshirt              -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k shirt               -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k polo-shirt          -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k vest                -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k parka               -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k sweat               -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k outdoor             -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k sandal__WOMEN       -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k swimsuit__WOMEN     -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k one-piece__WOMEN    -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k gaucho-pants__WOMEN -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
end

# 夜の遅い時間帯に配信するボット
every 1.day, at: "21:00" do
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k iPhone-case    -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k sneaker        -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k hat            -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k peplum         -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k off-shoulder   -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k linen          -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k bra            -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k shorts-panties -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k cardigan       -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
end

# follow follower of seed account
bot_keyword_en = %w(tshirt shirt polo-shirt vest parka sweat outdoor iPhone-case sneaker sandal__WOMEN one-piece__WOMEN swimsuit__WOMEN gaucho-pants__WOMEN hat peplum off-shoulder linen bra shorts-panties cardigan)
bot_keyword_en.each do |keyword|
  random_times = []
  (0..22).to_a.each do |hour|
    (0..59).to_a.sample(2).each do |minute|
      random_times << "#{'%02d' % hour}:#{'%02d' % minute}"
    end
  end
  every 1.day, at: random_times do
    command "/home/dorian/Works/tsubuyaki/bin/follow_follower_of_seed_account -k #{keyword} -n 3 -l /home/dorian/Works/tsubuyaki/log/follow_follower_of_seed_account -e"
  end
end

# follow mutual accounts
every :wednesday, at: time do
end

# unfollow not followback account
bot_keyword_en = %w(coatlovers favrica_sns_not_connected_01 favrica_sns_not_connected_02 favrica_sns_not_connected_03 favrica_sns_not_connected_10 favrica_sns_not_connected_11 favrica_sns_not_connected_12 favrica_sns_not_connected_13 favrica_sns_not_connected_14 favrica_sns_not_connected_15 favrica_sns_not_connected_16 favrica_sns_not_connected_17 favrica_sns_not_connected_18 favrica_sns_not_connected_19 favrica_sns_not_connected_20 favrica_sns_not_connected_21 favrica_sns_not_connected_22 favrica_sns_not_connected_23 favrica_sns_not_connected_24 favrica_sns_not_connected_25 favrica_sns_not_connected_26 favrica_sns_not_connected_27 favrica_sns_not_connected_28 favrica_sns_not_connected_29 favrica_sns_not_connected_30 favrica_sns_not_connected_31 favrica_sns_not_connected_32 favrica_sns_not_connected_33 favrica_sns_not_connected_34 favrica_sns_not_connected_35 favrica_sns_not_connected_36 favrica_sns_not_connected_37 favrica_sns_not_connected_38 favrica_sns_not_connected_39 favrica_sns_not_connected_40 favrica_sns_not_connected_41 favrica_sns_not_connected_42 favrica_sns_not_connected_43 favrica_sns_not_connected_44 favrica_sns_not_connected_45 favrica_sns_not_connected_46 favrica_sns_not_connected_47 favrica_sns_not_connected_48 favrica_sns_not_connected_49 favrica_sns_not_connected_50 favrica_sns_not_connected_51 favrica_sns_not_connected_52 favrica_sns_not_connected_53 favrica_sns_not_connected_54 favrica_sns_not_connected_55 favrica_sns_not_connected_56 favrica_sns_not_connected_57 favrica_sns_not_connected_58 favrica_sns_not_connected_59 favrica_sns_not_connected_60 favrica_sns_not_connected_61 favrica_sns_not_connected_62 favrica_sns_not_connected_63 favrica_sns_not_connected_64 favrica_sns_not_connected_65 handbag clutch-bag dress-shoes peplum off-shoulder linen knit cardigan ensemble jersey tanktop tubetop jacket blouson down mountain-parka skirt pants denim)
##bot_keyword_en = %w(tshirt shirt polo-shirt vest parka sweat outdoor iPhone-case sneaker knit cardigan ensemble jersey tanktop tubetop jacket blouson down mountain-parka skirt pants denim sandal__WOMEN pumps boots booties deck-shoes rain-shoes all-in-one one-piece__WOMEN party-dress suit-jacket suit-vest suit-pants suit-skirt setup necktie bra shorts-panties mens-pants necklace pierced-earrings ring swimsuit__WOMEN tote-bag backpack traveling-bag gaucho-pants__WOMEN hat handbag clutch-bag dress-shoes peplum off-shoulder linen favrica_sns_not_connected_01 favrica_sns_not_connected_02 favrica_sns_not_connected_03 favrica_sns_not_connected_10 favrica_sns_not_connected_11 favrica_sns_not_connected_12 favrica_sns_not_connected_13 favrica_sns_not_connected_14 favrica_sns_not_connected_15 favrica_sns_not_connected_16 favrica_sns_not_connected_17 favrica_sns_not_connected_18 favrica_sns_not_connected_19 favrica_sns_not_connected_20 favrica_sns_not_connected_21 favrica_sns_not_connected_22 favrica_sns_not_connected_23 favrica_sns_not_connected_24 favrica_sns_not_connected_25 favrica_sns_not_connected_26 favrica_sns_not_connected_27 favrica_sns_not_connected_28 favrica_sns_not_connected_29 favrica_sns_not_connected_30 favrica_sns_not_connected_31)
bot_keyword_en.each do |keyword|
  random_times = []
  (0..22).to_a.each do |hour|
    (0..59).to_a.sample(7).each do |minute|
      random_times << "#{'%02d' % hour}:#{'%02d' % minute}"
    end
  end
  every 1.day, at: random_times do
    command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k #{keyword} -n 8 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  end
end

# ボット用Goolge Docs更新タスク
every 1.day, at: "23:30" do
  command "/home/dorian/Works/tsubuyaki/bin/post_bot_information_on_gss"
end
