require "rails_helper"

RSpec.describe "User" do
  describe "(happy path)" do
    before :each do
      @image_file = fixture_file_upload('files/test_image.png', 'image/png')
      @user = create(:user)
    end

    it "can upload a profile image" do
      expect(@user.avatar.attached?).to be false

      put api_v1_user_path(@user), params: { user_id: @user.id, avatar: @image_file }
      
      @user.reload

      expect(@user.avatar.attached?).to be true
    end

    it "can update a profile image" do
      # upload initial image
      expect(@user.avatar.attached?).to be false
      
      @user.reload

      expect {
        put api_v1_user_path(@user), params: { user_id: @user.id, avatar: @image_file }
      }.to change(ActiveStorage::Attachment, :count).by(1)
      

      expect(@user.avatar.attached?).to be true
    end
  end

  describe "(sad path)" do
    before :each do
      @user = create(:user)
    end

    it "returns an error" do
      put api_v1_user_path(@user), params: { user_id: @user.id }
      
      @user.reload
      expect(response.status).to eq(400)
    end
  end
end