require './app'
require 'rspec'
require 'rack/test'

describe GithubAPI do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe '.search' do
    let(:language) { 'ruby' }

    subject { GithubAPI.search(language) }

    it 'returns a list of 10 repos' do
      expect(subject.count).to eq 10
    end
  end
end
