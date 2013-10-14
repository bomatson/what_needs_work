require './app'
require 'rspec'
require 'rack/test'

describe GithubAPI do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe '.search' do
    subject { GithubAPI.search('ruby') }

    it 'searches for open pull requests by language' do
      expect(subject).to eq 1
    end
  end
end
