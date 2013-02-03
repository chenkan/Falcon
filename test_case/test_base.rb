require 'require_all'
require_rel '../api_for_*/*.rb'
require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use!

class TestBase < MiniTest::Unit::TestCase

  def setup
    puts "setup..."
    @cookie = Login.login_from_163('falcon_test@163.com', 'test1234').headers['Set-Cookie']
    #TODO 抽取测试账号
  end

  def teardown
    puts "teardown..."
  end

end