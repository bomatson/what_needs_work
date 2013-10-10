require 'sinatra'
require 'octokit'

class GithubAPI
  attr_accessor :response

  def self.search(query)
    @response = ::Octokit.search_code(query)
  end
end

get '/' do
  haml :index
end

post '/show' do
  @result = GithubAPI.search(params[:query])
  p @result
  haml :show
end


