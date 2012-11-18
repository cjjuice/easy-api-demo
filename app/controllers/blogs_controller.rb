class BlogsController < ApplicationController
  def post_to_api
    if params[:title] 
      json = 'data={"Title": "%s","Text": "%s","Author": {"Name": "%s","Email": "someone@example.com"}, "Tags": ["hack"]}' % [params[:title], params[:text], params[:author]]
      @result = HTTParty.post('http://api.easyapi.co/endpoints/instance/create?blueprintname=blogpost', 
          :body =>  json ,
          :headers => { 'Content-Type' => 'application/x-www-form-urlencoded' } ) 
          
      #render :json => @result           
    end      
  end    
  
  def show
    @response = HTTParty.get('http://api.easyapi.co/endpoints/render?id=2')
    
    #puts @response.body, @response.code, @response.message, @response.headers.inspect

    @response.each do |item|
      puts item
    end
    #@data = JSON.parse response
    
    @data = @response['blogpost']
  end  
end
