require "require_all"
require_rel "../framework_util/*.rb"

class Album

	def self.create_album(cookie, username, album_name, album_desc)
    conn = Falcon.create_connection
		rsp = conn.post do |req|
		  req.url "http://photo.163.com/photo/#{username}/dwr/call/plaincall/AlbumBean.create.dwr"
		  req.headers['cookie'] = cookie
		  req.params['callCount'] = '1'
		  req.params['scriptSessionId'] = '${scriptSessionId}187'
		  req.params['c0-scriptName'] = 'AlbumBean'
		  req.params['c0-methodName'] = 'create'
		  req.params['c0-id'] = '0'
		  req.params['c0-param0'] = "string:#{album_name}"
		  req.params['c0-param1'] = "string:#{album_desc}"
		  req.params['c0-param2'] = 'number:0'
		  req.params['c0-param3'] = 'string:'
		  req.params['c0-param4'] = 'string:'
		  req.params['batchId'] = '402560'
		end
  		return rsp
  end

  def self.delete_album(cookie, username, album_id)
    conn = Falcon.create_connection
    rsp = conn.post do |req|
      req.url "http://photo.163.com/photo/#{username}/dwr/call/plaincall/AlbumBean.delete.dwr"
      req.headers['cookie'] = cookie
      req.params['callCount'] = '1'
      req.params['scriptSessionId'] = '${scriptSessionId}187'
      req.params['c0-scriptName'] = 'AlbumBean'
      req.params['c0-methodName'] = 'delete'
      req.params['c0-id'] = '0'
      req.params['c0-param0'] = "number:#{album_id.to_i}"
      req.params['batchId'] = '402560'
    end
    return rsp
  end

end

#TODO 每一个req及rsp都要求自动log