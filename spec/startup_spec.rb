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
    expect(last_response.body).to eq('')
  end

  it "can find a prime number" do
    get '/?q=c7b2fa20:%20which%20of%20the%20following%20numbers%20are%20primes:%20167,%20989,%20433,%20271'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('167, 433, 271')
  end

  it "can find the green animal" do
    get '/?q=11r35f60:%20which%20of%20the%20following%20animals%20is%20green%20is%20th%20most%20popular:%20frog%20monkey%20bear%20tree'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('frog')
  end

  it "can state the city where the Eiffel Tower is" do
    get '/?q=18b55f30:%20which%20city%20is%20the%20Eiffel%20tower%20in'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('Paris')
  end

  it "states which currency was used in Spain before the Euro" do
    get '/?q=baccc930:%20what%20currency%20did%20Spain%20use%20before%20the%20Euro'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('Peseta')
  end

  it "states what colour a banana is" do
    get '?q=b94c41f0:%20what%20colour%20is%20a%20banana'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('yellow')
  end

  it "can find a number in the fibonacci sequence" do
    get '/?q=a46ae300:%20what%20is%20the%2010th%20number%20in%20the%20Fibonacci%20sequence'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('55')
  end
end