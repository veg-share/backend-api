require "rails_helper"

RSpec.describe "User" do
  describe "(happy path)" do
    before do
      @image_file = fixture_file_upload('files/test_image.png', 'image/png')
      @user = User.create(username: "aidenmendez", city: "Denver", state: "CO", zip_code: "80210", password: "password1", password_confirmation: "password1")
    end

    it "can upload a profile image" do
      require 'pry'; binding.pry
    end
  end
end