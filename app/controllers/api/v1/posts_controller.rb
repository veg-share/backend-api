class Api::V1::PostsController < ApplicationController
  def update
    post = Post.find(params[:id])

    if params[:image]

      post.image.attach(post_params[:image])

      if post.save!
        render json: {"success" => {"message" => "Image updated"}}, status:200
      else
        render json: {"error" => {"message" => "Image not updated"}}, status:400
      end

    else
      render json: {"error" => {"message" => "Image not updated"}}, status:400
    end
  end

  private
    def post_params
      params.permit(:id, :image)
    end
end