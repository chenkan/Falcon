require 'faraday'

conn = Faraday.new

## POST ##
rsp = conn.post do |req|
  req.url 'https://reg.163.com/logins.jsp'
  req.params[:username] = 'falcon_test@163.com'
  req.params[:password] = 'test1234'
end

cookie = rsp.headers['Set-Cookie']
#puts cookie
#puts rsp.status

rsp = conn.post do |req|
  req.url 'http://photo.163.com/photo/falcon_test/dwr/call/plaincall/AlbumBean.create.dwr'
  req.headers['cookie'] = cookie
  req.params['callCount'] = '1'
  req.params['scriptSessionId'] = '${scriptSessionId}187'
  req.params['c0-scriptName'] = 'AlbumBean'
  req.params['c0-methodName'] = 'create'
  req.params['c0-id'] = '0'
  req.params['c0-param0'] = 'string:Hello Faraday'
  req.params['c0-param1'] = 'string:Hello Faraday'
  req.params['c0-param2'] = 'number:0'
  req.params['c0-param3'] = 'string:'
  req.params['c0-param4'] = 'string:'
  req.params['batchId'] = '402560'
end

puts rsp.body
