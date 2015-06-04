create table `bot_accounts` (
  `id`                  int(10)      unsigned not null,
  `account_id`          int(10)      unsigned not null,
  `keyword_en`          varchar(255) unsigned not null,
  `account_screen_name` varchar(255) unsigned,
  `consumer_key`        varchar(255) not null,
  `consumer_secret`     varchar(255) not null,
  `access_token`        varchar(255) not null,
  `access_token_secret` varchar(255) not null,
  primary key(`id`),
  index(`keyword_en`)
) engine=InnoDB default charset=utf8;

create table `keywords` (
  `id`         int(10)      unsigned not null,
  `keyword_en` varchar(255) unsigned not null,
  `keyword_ja` varchar(255) unsigned not null,
  primary key(`id`),
  index(`keyword_en`)
) engine=InnoDB default charset=utf8;

create table `seed_accounts` (
  `id`                  int(10)      unsigned not null,
  `account_screen_name` varchar(255) not null,
  `account_id`          bigint(20)   unsigned,
  primary key(`id`)
) engine=InnoDB default charset=utf8;
