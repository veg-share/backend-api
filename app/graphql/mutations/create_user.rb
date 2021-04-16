module Mutations
  class CreateUser < BaseMutation

    argument :username, type: String, required: true
    argument :city, type: String, required: true
    argument :state, type: String, required: true
    argument :zip_code, type: String, required: true
    argument :profile_image, type: String, required: true
    argument :password, type: String, required: true
    argument :password_confirmation, type: String, required: true

    def resolve(username:, city:, state:, zip_code:, profile_image:, password:, password_confirmation:)
      user = User.new(username: username, city: city, state: state, zip_code: zip_code, profile_image: profile_image, password: password, password_confirmation: password_confirmation)
      if user.save
        user
      else
        {errors: user.errors.full_messages}
      end
    end
  end
end
