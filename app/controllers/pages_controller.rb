class PagesController < ApplicationController
	def home
	end
	def search
  	if params[:search].blank?  
    	redirect_to(root_path, alert: "Empty field!") and return  
  	else  
    	@parameter = params[:search].downcase  
    	# @results = Store.all.where("lower(name) LIKE :search", search: @parameter)  
    	@results = Bug.where("lower(bug_title) LIKE :search", search: "%#{@parameter}%")
  	end 
  end
end
