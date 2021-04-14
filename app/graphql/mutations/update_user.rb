module Mutations
  class UpdateUser < BaseMutation

    argument :id, type: ID, required: true
    argument :username, type: String, required: false
    argument :city, type: String, required: false
    argument :state, type: String, required: false
    argument :zip_code, type: String, required: false
    argument :profile_image, type: String, required: false

    def resolve(options)
      user = User.find(options[:id])
      username = options[:username] || user.username
      city = options[:city] || user.city
      state = options[:state] || user.state
      zip_code = options[:zip_code] || user.zip_code
      profile_image = options[:profile_image] || user.profile_image

      if user.update(username: username, city: city, state: state, zip_code: zip_code, profile_image: profile_image)
        user
      else
        {errors: user.errors.full_messages}
      end
    end
  end
end
