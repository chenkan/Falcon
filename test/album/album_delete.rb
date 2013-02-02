require 'require_all'
require_all '../api/**/*.rb'
require 'test/unit'

class AlbumDelete < Test::Unit::TestCase

  def test_delete_album
    cookie = Login.login_from_163('falcon_test@163.com', 'test1234').headers['Set-Cookie']
    test_data = [
        CommonOperation.prepare_an_album_get_its_id(cookie, 'falcon_test'),
    ]
    test_data.each do |album_id|
      rsp = Album.delete_album(cookie, 'falcon_test', album_id)
      assert_match(/true/, rsp.body)
      #TODO more assert
    end
  end

end