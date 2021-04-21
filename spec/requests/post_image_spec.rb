require "rails_helper"

RSpec.describe "User" do
  describe "(happy path)" do
    before :each do
      @image_file = fixture_file_upload('files/watermelon.jpeg', 'image/jpeg')
      @user = create(:user)
      @post = create(:post)
    end

    it "can upload a profile image" do
      expect(@post.image.attached?).to be false

      put api_v1_post_path(@post), params: { post_id: @post.id, image: @image_file }
      
      @post.reload

      expect(@post.image.attached?).to be true
    end

    it "can update a profile image" do
      # upload initial image
      expect(@post.image.attached?).to be false

      expect {
        put api_v1_post_path(@post), params: { post_id: @post.id, image: @image_file }
      }.to change(ActiveStorage::Attachment, :count).by(1)
      
      @post.reload

      expect(@post.image.attached?).to be true
    end
  end
end