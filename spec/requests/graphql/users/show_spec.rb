require "spec_helper"

describe "User show request", type: :request do
  it "returns a single user with queried fields" do
    user = create(:user)
    post '/graphql', params: { query: query(id: user.id) }
          json = JSON.parse(response.body)
          data = json['data']["getOneUser"]
          expect(data).to include(
            'username'        => be_present,
            'city'            => be_present,
            'state'           => be_present,
            'zipCode'         => be_present,
          )
  end

  def query(id:)
    <<~GQL
    query {
      getOneUser(id: #{id}) {
        username
        city
        state
        zipCode
      }
    }
    GQL
  end
end
