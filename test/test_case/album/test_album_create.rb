#require_relative '../api/login'
#require_relative '../api/album'
require 'require_all'
require_rel '../../../api/**/*.rb' #TODO 路径不优雅不灵活
require 'test/unit'

class AlbumCreate < Test::Unit::TestCase

  def setup
    puts 'setup'
    @cookie = Login.login_from_163('falcon_test@163.com', 'test1234').headers['Set-Cookie']
  end

  def test_create_album
    puts 'test'
    test_data = [
        ['name_A', 'desc_A'],
        ['name_B', 'desc_B'],
        ['name_C', 'desc_C']
    ]
    test_data.each do |name, desc|
      rsp = Album.create_album(@cookie, 'falcon_test', name, desc)
      assert_match(/id:\d+/, rsp.body)
      assert_match(/name:"#{name}"/, rsp.body)
      assert_match(/desc:"#{desc}"/, rsp.body)
    end
  end

  def teardown
    puts 'teardown'
    CommonOperation.delete_all_albums(@cookie, 'falcon_test')
  end

end