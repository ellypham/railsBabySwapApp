class HelloController < ApplicationController
	def view
  	@name = params[:name]
	end

end
