module Mutations
  class DeletePost < BaseMutation

    argument :id, type: ID, required: true

    def resolve(id:)
      post = Post.find(id)
      post.delete
      id
    end
  end
end
