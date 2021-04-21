require "rails_helper"

RSpec.describe "User" do
  describe "(happy path)" do
    before :each do
      @image_file = fixture_file_upload('files/watermelon.jpeg', 'image/jpeg')
      create(:user)
      @post = create(:post)
    end

    it "can upload a post image" do
      expect(@post.image.attached?).to be false

      put api_v1_post_path(@post), params: { post_id: @post.id, image: @image_file }
      
      @post.reload

      expect(@post.image.attached?).to be true
    end

    it "can update a post image" do
      # upload initial image
      expect(@post.image.attached?).to be false

      expect {
        put api_v1_post_path(@post), params: { post_id: @post.id, image: @image_file }
      }.to change(ActiveStorage::Attachment, :count).by(1)
      
      @post.reload

      expect(@post.image.attached?).to be true
    end
  end

  describe "(sad path)" do
    before :each do
      # @image_file = fixture_file_upload('files/large_image.jpeg', 'image/jpeg')
      create(:user)
      @post = create(:post)
    end

    it "returns an error" do
      # expect(@post.image).to be_nil

      put api_v1_post_path(@post), params: { post_id: @post.id }
      
      @post.reload
      expect(response.status).to eq(400)
      
      # expect(@post.image).to be_nil
    end
  end
end