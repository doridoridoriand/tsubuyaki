require 'active_record'
require 'twitter'
require 'cache_local'
require 'yaml'
require 'optparse'
require 'logger'
require 'json'
require 'open-uri'
require 'uri'
require 'bot_account'
require 'seed_account'
require 'favrica_keyword'
require 'bot_account_follow_follower'

db_config = YAML.load_file(File.expand_path(File.join(__FILE__, '..', '..', 'config', 'database.yml')))
ActiveRecord::Base.establish_connection(db_config['db']['production'])

module FavricaSns
  CACHE_DIR = File.expand_path(File.join(__FILE__, '..', '..', 'tmp', 'cache'))
  LOG_DIR = File.expand_path(File.join(__FILE__, '..', '..', 'log'))
  FAVRICA_SEARCH_URL_ENDPOINT = 'https://favrica.net/api/v3/items/search?text='
  FAVRICA_ITEM_ENDPOINT = FAVRICA_SEARCH_URL_ENDPOINT.split('search')[0]
  DESCRIPTION_TRUNCATE = [0, 30]
  CREDENTIAL_STORE_FILE = '../tmp/credential-oauth2.json'
  OAUTH_SOURCE_FILE = '../config/client_secrets.json'
end
