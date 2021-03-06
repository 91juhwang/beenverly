class Url < ActiveRecord::Base
  has_many :user_urls
  has_many :users, through: :user_urls

  def self.url_to_external(text)
    /\Ahttp(s)?:\/\//.match(text) ? text : text.gsub(/\A(http(s)?:\/\/)?(www\.)?(.*)/,"http\\2://www.\\4")
  end

  def self.update_access_count(found_url)
    found_url.access_count + 1
  end
end