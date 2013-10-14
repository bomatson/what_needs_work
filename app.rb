require 'sinatra'
require 'octokit'

class GithubAPI
  attr_accessor :response

  def self.search(language)
    query = 'pull requests welcome'
    @response = ::Octokit.search_code(query, language: language)
  end
end

get '/' do
  haml :index
end

post '/show' do
  @result = GithubAPI.search(params[:language])
  p @result.data
  haml :show
end


