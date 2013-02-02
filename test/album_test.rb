#Dir[File.dirname() + '../api/*.rb'].each {|file| require file }

#puts __FILE__

require 'require_all'
require_all '../api/*.rb'
#require_relative '../api/login'
#require_relative '../api/album'
require 'test/unit'

#Login.login('a', 'b')

class AlbumTest < Test::Unit::TestCase 
	#include Login

    def test_create_album
      rsp = Login.login('falcon_test@163.com', 'test1234')
      cookis = rsp.headers['Set-Cookie']
      rsp = Album.create_album(cookis, 'falcon_test', 'name', 'desc')
      puts rsp.body
      assert_match(/id:\d+/, rsp.body)
    end

    def test_delete_album

    end
end