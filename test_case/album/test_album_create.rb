require_relative '../test_base.rb'

class AlbumCreate < TestBase

  def setup
    @cookie = super('falcon_test@163.com', 'test1234')
    @test_data = [
        ['name_A', 'desc_A'],
        ['name_B', 'desc_B'],
        ['name_C', 'desc_C']
    ]
  end

  def test_album_create
    @test_data.each do |name, desc|
      rsp = Album.create_album(@cookie, 'falcon_test', name, desc)
      assert_match(/id:\d+/, rsp.body)
      assert_match(/name:"#{name}"/, rsp.body)
      assert_match(/desc:"#{desc}"/, rsp.body)
    end
  end

  def teardown
    CommonOperation.delete_all_albums(@cookie, 'falcon_test')
    super
  end

end