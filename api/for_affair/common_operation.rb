require 'require_all'
require_all '../../api/**/*.rb' #TODO 循环require自身？
require 'test/unit'

class CommonOperation

  def self.prepare_an_album_get_its_id(cookie, username)
    rsp = Album.create_album(cookie, username, 'prepare_a_album', 'prepare_a_album')
    return rsp.body[/id:(\d+),lurl/].sub('id:', '').sub(',lurl', '')
    #TODO 使用JSON解析器
  end

  def self.get_album_list(cookie, username)
    rsp = UserSpace.get_user_space(cookie, username)
    cache_url = rsp.body[/cacheFileUrl:".+"/].sub('cacheFileUrl:"', '').sub('"', '')
    conn = Faraday.new
    rsp = conn.get do |req|
      req.url 'http://' + cache_url
    end
    return rsp.body[/var.+='(.+)';/, 1].split(';')
  end

end