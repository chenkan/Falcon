require 'faraday'

class UserSpace

  def self.get_user_space(cookie, username)
    conn = Faraday.new
    rsp = conn.post do |req|
      req.url "http://photo.163.com/photo/#{username}/dwr/call/plaincall/UserSpaceBean.getUserSpace.dwr"
      req.headers['cookie'] = cookie
      req.params['callCount'] = '1'
      req.params['scriptSessionId'] = '${scriptSessionId}187'
      req.params['c0-scriptName'] = 'UserSpaceBean'
      req.params['c0-methodName'] = 'getUserSpace'
      req.params['c0-id'] = '0'
      req.params['c0-param0'] = "string:#{username}"
      req.params['batchId'] = '402560'
    end
    return rsp
  end

end

#TODO 每一个req及rsp都要求自动log