class ApiV1::MessagesController <  ApiController
	
	def index
		@messages = Message.all
		#	response.headers['Content-Type_example_test'] = 'hidden secret'
		request.format = 'json'
	end	

end
