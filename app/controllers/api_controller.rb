class ApiController < ActionController::Base
	before_action :enable_cors
	before_action :set_default_format

	private

	def set_default_format
    request.format = 'json'
  end

  def enable_cors
		headers['Access-Control-Allow-Origin'] = '*'
  	headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE'
  	headers['Access-Control-Request-Method'] = 'GET, POST, PUT, DELETE'
  end	
end