require 'sinatra'
require 'octokit'

class GithubAPI

  def self.search(language)
    query = "pull requests welcome in:readme language:#{language}"
    @response = ::Octokit.search_repos(query, page: 1, sort: 'stars')
    @response.items[0..9]
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


