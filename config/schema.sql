create table `bot_accounts` (
  `id`                  int(10)      unsigned not null,
  `account_id`          bigint(20)   unsigned,
  `account_screen_name` varchar(255) ,
  `keyword_en`          varchar(255) not null,
  `consumer_key`        varchar(255) not null,
  `consumer_secret`     varchar(255) not null,
  `access_token`        varchar(255) not null,
  `access_token_secret` varchar(255) not null,
  primary key(`id`)
) engine=InnoDB default charset=utf8;

create table `favrica_keywords` (
  `id`         int(10)      unsigned not null,
  `keyword_en` varchar(255) not null,
  `keyword_ja` varchar(255) not null,
  primary key(`id`)
) engine=InnoDB default charset=utf8;

create table `seed_accounts` (
  `id`                  int(10)      unsigned not null,
  `account_screen_name` varchar(255) not null,
  `account_id`          bigint(20)   unsigned,
  primary key(`id`)
) engine=InnoDB default charset=utf8;

create table `bot_account_follow_followers` (
  `id`         int(10)      unsigned not null,
  `keyword_en` varchar(255) not null,
  `friend`     bigint(20)   unsigned,
  `follower`   bigint(20)   unsigned,
  primary key(`id`)
) engine=InnoDB default charset=utf8;

# まだ使うかは保留
create table `bot_rate_limits` (
  `id`         int(10)      unsigned not null,
  `keyword_en` varchar(255) not null,
  `remaining`  int(10)      unsigned,
  `reset_at`   int(10)      unsigned, # APIからの返り値がエポックタイム
  primary key(`id`)
) engine=InnoDB default charset=utf8;

create table 'bot_followers' (
  `id`                  int(10)      unsigned not null,
  `keyword_en`          varchar(255) not null,
  `bot_account_id`      bigint(20)   unsigned,
  `account_id`          bigint(20)   unsigned,
  `account_screen_name` varchar(255),
  primary key(`id`)
) engine=InnoDB default charset=utf8;
