#Dir[File.dirname() + '../api/*.rb'].each {|file| require file }

#puts __FILE__

#require 'require_all'
require_relative '../api/login'
require 'test/unit'

Login.login('a', 'b')

class AlbumTest < Test::Unit::TestCase 
	include Login

    def test_create_album
      Login.login('falcon_test@163.com', 'test1234')
    end

    def test_delete_album

    end
end