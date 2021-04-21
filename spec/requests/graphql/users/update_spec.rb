require "spec_helper"

describe "User update request", type: :request do
  it "updates specified user with given fields" do
    user = create(:user)
    post '/graphql', params: { query: query(id: user.id) }
          json = JSON.parse(response.body)
          data = json['data']["updateUser"]
          expect(data).to include(
            'city'            => "new city",
            'state'           => "new state",
            'zipCode'         => "new zip",
          )
  end

  def query(id:)
    <<~GQL
    mutation {
      updateUser(
        id: #{id}
        city: "new city"
        state: "new state"
        zipCode: "new zip"
      ) {
        username
        city
        state
        zipCode
      }
    }
    GQL
  end
end
