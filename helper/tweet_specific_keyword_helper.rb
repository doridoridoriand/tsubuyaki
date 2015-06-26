$: << File.expand_path(File.join(__FILE__, '..', '..', 'lib'))
require 'favrica_sns'

module TweetSpecificKeywordHelper
  # TODO:もうちょっと関数の再利用性を高める。てか汚えな
  def tweet_content
    hash = Hash.new {|h, e| h[e] = {}}
    self.each_with_index do |entry, i|
      hash[i][:tweet_description]  = "【#{entry['title']}】#{truncate_description(entry['description'])} #{entry['favrica_url']}"
      hash[i][:tweet_description_with_brand]  = "【#{entry['title']}】#{entry['brand']['name']} #{entry['favrica_url']}"
      hash[i][:image]         = entry['images'].map {|image| image['large_url']}.to_a.uniq
      hash[i][:item_keywords] = item_keywords(entry['id'])
      hash[i][:brand_name]    = entry['brand']['name']
    end
    hash
  end

  def tweet_content_with_direct_link
    hash = Hash.new {|h, e| h[e] = {}}
    self.each_with_index do |entry, i|
      hash[i][:tweet_description]  = "【#{entry['title']}】#{truncate_description(entry['description'])} #{entry['stocks'][0]['item_url']}"
      hash[i][:tweet_description_with_brand]  = "【#{entry['title']}】#{entry['brand']['name']} #{entry['stocks'][0]['item_url']}"
      hash[i][:image]         = entry['images'].map {|image| image['large_url']}.to_a.uniq
      hash[i][:item_keywords] = item_keywords(entry['id'])
      hash[i][:brand_name]    = entry['brand']['name']
    end
    hash
  end

  def hash_tags(source_keyword, item_keywords)
    item_keywords.delete(source_keyword)
    hash_keywords = item_keywords.map {|keyword| keyword = "##{keyword}"}
    if (hash_keywords.count > 1)
      return_array_data = hash_keywords.join(' ')
    else
      return_array_data = hash_keywords[0]
    end
    return_array_data
  end

  def with_gender_adjusted(target_gender)
    counter = 0
    if target_gender
      modified = []
      self.each_with_index do |entry, i|
        #modified_hash[i] = entry if entry['groups'].map {|id| id['name']}.join.include?(target_gender)
        if (entry['groups'].map {|id| id['name']}.join.include?(target_gender))
          modified << entry
          counter += 1
        end
      end
    else
      modified = self
    end
    modified
  end

  private

  def truncate_description(string)
    string[FavricaSns::DESCRIPTION_TRUNCATE[0]..FavricaSns::DESCRIPTION_TRUNCATE[1]] << '…'
  end

  def item_keywords(item_id)
    JSON.parse!(open(URI.encode("#{FavricaSns::FAVRICA_ITEM_ENDPOINT}#{item_id}/keywords")).read).map {|node| node['value']}.to_a
  end
end
