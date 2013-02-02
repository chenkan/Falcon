require 'require_all'
require_all '../api/**/*.rb' #TODO 循环require自身？
require 'test/unit'

class CommonOperation

  def self.prepare_an_album_get_its_id(cookie, username)
    rsp = Album.create_album(cookie, username, 'prepare_a_album', 'prepare_a_album')
    return rsp.body[/id:(\d+),lurl/].sub('id:', '').sub(',lurl', '')
    #TODO 使用JSON解析器
  end

end