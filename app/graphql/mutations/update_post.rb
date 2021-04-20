module Mutations
  class UpdatePost < BaseMutation

    argument :id, type: ID, required: true
    argument :title, type: String, required: false
    argument :description, type: String, required: false


    def resolve(options)
      post = Post.find(options[:id])
      title = options[:title] || post.title
      description = options[:description] || post.description

      if post.update(title: title, description: description)
        post
      else
        {errors: post.errors.full_messages}
      end
    end
  end
end
