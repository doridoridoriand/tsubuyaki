require 'active_record'
require 'twitter'
require 'cache_local'
require 'yaml'
require 'optparse'
require 'logger'
require 'json'
require 'open-uri'
require 'uri'
require 'selenium-webdriver'
require 'headless'
require 'google/api_client'
require 'google/api_client/client_secrets'
require 'google/api_client/auth/file_storage'
require 'google/api_client/auth/installed_app'
require 'google_drive'
require 'bot_account'
require 'seed_account'
require 'favrica_keyword'
require 'bot_account_follow_follower'
require 'bot_follower'

db_config = YAML.load_file(File.expand_path(File.join(__FILE__, '..', '..', 'config', 'database.yml')))
ActiveRecord::Base.establish_connection(db_config['db']['production'])

module FavricaSns
  CACHE_DIR                   = File.expand_path(File.join(__FILE__, '..', '..', 'tmp', 'cache'))
  LOG_DIR                     = File.expand_path(File.join(__FILE__, '..', '..', 'log'))
  FAVRICA_SEARCH_URL_ENDPOINT = 'https://favrica.net/api/v3/items/search?text='
  FAVRICA_ITEM_ENDPOINT       = FAVRICA_SEARCH_URL_ENDPOINT.split('search')[0]
  DESCRIPTION_TRUNCATE        = [0, 30]
  CREDENTIAL_STORE_FILE       = '../tmp/credential-oauth2.json'
  OAUTH_SOURCE_FILE           = '../config/client_secrets.json'
  SCREENSHOT_SAVE_PLACE       = '/home/vagrant/dev/'
  PINTEREST_ID                = 'メールアドレス'
  PINTEREST_PASS              = 'パスワード'
  PINTEREST_LANDING_PAGE      = 'https://jp.pinterest.com/login/?referrer=home_page'
  PINTEREST_PINIT_URL         = 'https://jp.pinterest.com/pin/create/button/?url='
end
