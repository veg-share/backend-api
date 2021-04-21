require "spec_helper"

describe "User index request", type: :request do
  it "returns all users with queried fields" do
    users = create_list(:user, 7)
    post '/graphql', params: { query: query }
          json = JSON.parse(response.body)
          data = json['data']["getAllUsers"][0]
          expect(data).to include(
            'id'              => be_present,
            'username'        => be_present,
            'city'            => be_present,
            'state'           => be_present,
            'zipCode'         => be_present,
          )
  end
end

def query
  <<~GQL
  query {
    getAllUsers {
      id
      username
      city
      state
      zipCode
    }
  }
  GQL
end
