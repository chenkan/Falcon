require "require_all"
require_rel "../framework_util/*.rb"

class Login
  def self.login_from_163(username, password)
    conn = Falcon.create_connection
    rsp = conn.post do |req|
      req.url 'https://reg.163.com/logins.jsp'
      req.params[:username] = username
      req.params[:password] = password
    end
    return rsp
  end
end
