require 'require_all'
require_rel '../api_for_*/*.rb'
require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use!

class TestBase < MiniTest::Unit::TestCase

  def setup(username, password)
    puts "setup..."
    return Login.login_from_163(username, password).headers['Set-Cookie']
  end

  def teardown
    puts "teardown..."
  end

end