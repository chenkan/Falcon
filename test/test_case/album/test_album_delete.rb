require 'require_all'
require_all '../../api/**/*.rb'
require 'test/unit'

class AlbumDelete < Test::Unit::TestCase

  def setup
    puts 'setup'
    @cookie = Login.login_from_163('falcon_test@163.com', 'test1234').headers['Set-Cookie']
  end

  def test_delete_album
    puts 'test'
    test_data = [
        CommonOperation.prepare_an_album_get_its_id(@cookie, 'falcon_test'),
    ]
    test_data.each do |album_id|
      rsp = Album.delete_album(@cookie, 'falcon_test', album_id)
      assert_match(/true/, rsp.body) #TODO why `1 tests, 2 assertions`?
      #TODO more assert
    end
  end

  def teardown
    puts 'teardown'
  end

end