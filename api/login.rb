require 'faraday'

module Login
	def login(username, password)
		conn = Faraday.new
		rsp = conn.post do |req|
  		req.url 'https://reg.163.com/logins.jsp'
  		req.params[:username] = username
  		req.params[:password] = password
  		return rsp
  	end
  	end
end
