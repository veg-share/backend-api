require "rails_helper"

RSpec.describe "User" do
  describe "(happy path)" do
    before :each do
      @image_file = fixture_file_upload('files/test_image.png', 'image/png')
      @user = create(:user)
    end

    it "can upload a profile image" do
      expect(@user.avatar.attached?).to be false

      patch user_path(@user), params: { user_id: @user.id, avatar: @image_file }
      
      @user.reload

      expect(@user.avatar.attached?).to be true
    end

    it "can update a profile image" do
      # upload initial image
      expect(@user.avatar.attached?).to be false

      expect {
        patch user_path(@user), params: { user_id: @user.id, avatar: @image_file }
      }.to change(ActiveStorage::Attachment, :count).by(1)
      
      @user.reload

      expect(@user.avatar.attached?).to be true


      # replace image
      @new_image_file = fixture_file_upload('files/new_test_image.jpeg', 'image/jpeg')
      
      patch user_path(@user), params: { user_id: @user.id, avatar: @new_image_file }

      @user.reload
require 'pry'; binding.pry
      expect(@user.avatar.attached?).to be true
    end
  end
end