require "spec_helper"

describe "User create request", type: :request do
  it "creates a new user with specified info" do
    info = {
      username: "sampleUser#{rand()*100}",
      zipCode: "80222",
      city: "Denver",
      state: "CO"
    }
    post '/graphql', params: { query: query(info) }
          json = JSON.parse(response.body)
          puts json
          data = json['data']["createUser"]
          expect(data).to eq(info.transform_keys(&:to_s))
  end

  def query(info)
    <<~GQL
    mutation {
      createUser(
        username: "#{info[:username]}"
        city: "#{info[:city]}"
        state: "#{info[:state]}"
        zipCode: "#{info[:zipCode]}"
        password: "abc123"
        passwordConfirmation: "abc123"
        profileImage: "aaaa"

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
