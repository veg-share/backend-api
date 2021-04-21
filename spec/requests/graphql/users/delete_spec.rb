require "spec_helper"

describe "User delete request", type: :request do
  it "deletes the specified user" do
    user = create(:user)
    post '/graphql', params: { query: query(id: user.id) }
          json = JSON.parse(response.body)
          puts user.id
          expect(json["data"]["deleteUser"]).to eq(user.id)

  end

  def query(id:)
    <<~GQL
    mutation {
      deleteUser(
        id: #{id}
      )
    }
    GQL
  end
end
