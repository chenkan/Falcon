#require_relative '../api/login'
#require_relative '../api/album'
require 'require_all'
require_all '../../api/**/*.rb'
require 'test/unit'

class AlbumCreate < Test::Unit::TestCase

  #TODO 独立出数据准备与清理
  def test_create_album
    cookie = Login.login_from_163('falcon_test@163.com', 'test1234').headers['Set-Cookie']
    test_data = [
        ['name_A', 'desc_A'],
        ['name_B', 'desc_B'],
        ['name_C', 'desc_C']
    ]
    test_data.each do |name, desc|
      rsp = Album.create_album(cookie, 'falcon_test', name, desc)
      assert_match(/id:\d+/, rsp.body)
      assert_match(/name:"#{name}"/, rsp.body)
      assert_match(/desc:"#{desc}"/, rsp.body)
    end

    album_list = CommonOperation.get_album_list(cookie, 'falcon_test')
    album_list.each do |album_id|
      Album.delete_album(cookie, 'falcon_test', album_id)
    end
  end

end