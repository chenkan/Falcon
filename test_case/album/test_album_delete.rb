require_relative '../test_base.rb'

class AlbumDelete < TestBase

  def setup
    super
    @test_data = [
        CommonOperation.prepare_an_album_get_its_id(@cookie, 'falcon_test'),
    ]
  end

  def test_album_delete
    @test_data.each do |album_id|
      rsp = Album.delete_album(@cookie, 'falcon_test', album_id)
      assert_match(/true/, rsp.body) #TODO why `1 tests, 2 assertions`?
    end
  end

  def teardown
    super
  end

end