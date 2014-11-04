ENV['RACK_ENV'] = 'test'

require 'startup'  # <-- your sinatra app
require 'rspec'
require 'rack/test'

describe 'The Startup App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "returns an answer" do
    get '/?q=f97550c0:%20what%20is%20your%20name'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('Evolve')
  end

  it "can add two numbers" do
    get '/?q=eacba170:%20what%20is%2015%20plus%203'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('18')
  end

  it "can multiply two numbers" do
    get '/?q=b90ae580:%20what%20is%2019%20multiplied%20by%205'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('95')
  end

  it "find the largest number from list" do
    get '/?q=011ecf60:%20which%20of%20the%20following%20numbers%20is%20the%20largest:%20212,%2079,%2064,%20324'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('324')
  end

  it "can find a number that is a square and cube number" do
    skip
    get '/?q=a5a1bfb0:%20which%20of%20the%20following%20numbers%20is%20both%20a%20square%20and%20a%20cube:%20676,%202304,%20975,%20512'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('324')
  end

  it "can find the green animal" do
    get '/?q=11r35f60:%20which%20of%20the%20following%20animals%20is%20green%20is%20th%20most%20popular:%20frog%20monkey%20bear%20tree'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('frog')
  end
end