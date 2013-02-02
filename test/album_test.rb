#require_relative '../api/login'
#require_relative '../api/album'
require 'require_all'
require_all '../api/**/*.rb'
require 'test/unit'

class AlbumTest < Test::Unit::TestCase

  def test_create_album
    cookies = Login.login_from_163('falcon_test@163.com', 'test1234').headers['Set-Cookie']
    test_data = [
        ['name_A', 'desc_A'],
        ['name_B', 'desc_B'],
        ['name_C', 'desc_C']
    ]
    test_data.each do |name, desc|
      rsp = Album.create_album(cookies, 'falcon_test', name, desc)
      assert_match(/id:\d+/, rsp.body)
      assert_match(/name:"#{name}"/, rsp.body)
      assert_match(/desc:"#{desc}"/, rsp.body)
    end
  end

  def test_delete_album
  end

end