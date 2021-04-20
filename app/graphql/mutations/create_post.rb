module Mutations
  class CreatePost < BaseMutation

    argument :user_id, type: String, required: true
    argument :tags, String, required: true
    argument :title, String, required: true
    argument :description, String, required: true

    def resolve(user_id:, tags:, title:, description:)
      user = User.find(user_id)
      post = Post.new(user: user, tags: tags, title: title, description: description)
      if post.save
        post
      else
        {errors: post.errors.full_messages}
      end
    end
  end
end
