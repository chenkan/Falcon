require 'require_all'
require_rel '../api_for_interface/*.rb'
require 'test/unit'

class CommonOperation

  def self.prepare_an_album_get_its_id(cookie, username)
    rsp = Album.create_album(cookie, username, 'prepare_a_album', 'prepare_a_album')
    return rsp.body[/id:(\d+),lurl/, 1]
    #TODO 尝试使用JSON解析器
  end

  def self.get_album_list(cookie, username)
    rsp = UserSpace.get_user_space(cookie, username)
    cache_url = rsp.body[/cacheFileUrl:"(.+)"/, 1]
    conn = Faraday.new
    rsp = conn.get do |req|
      req.url 'http://' + cache_url
    end
    return rsp.body.scan(/id:(\d{1,12}),name/).map { |x| x[0] } # string.scan is powerful
  end

  def self.delete_all_albums(cookie, username)
    album_list = CommonOperation.get_album_list(cookie, username)
    album_list.each do |album_id|
      Album.delete_album(cookie, username, album_id)
    end
  end

end