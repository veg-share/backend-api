class Api::V1::PostsController < ApplicationController
  def update
    post = Post.find(params[:id])

    begin
      post.image.attach(post_params[:image])
      post.save!
      render json: {"success" => {"message" => "Image updated"}}, status:200
    rescue
        render json: {"error" => {"message" => "Image not updated"}}, status:400
    end
  end

  private
    def post_params
      params.permit(:id, :image)
    end
end