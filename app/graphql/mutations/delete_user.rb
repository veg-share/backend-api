module Mutations
  class DeleteUser < BaseMutation

    argument :id, type: ID, required: true

    def resolve(id:)
      user = User.find(id)
      user.posts.each do |post|
        post.delete
      end
      user.delete
      id
    end
  end
end
