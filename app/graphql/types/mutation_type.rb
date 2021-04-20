module Types
  class MutationType < Types::BaseObject
    field :create_user, UserType, mutation: Mutations::CreateUser
    field :update_user, UserType, mutation: Mutations::UpdateUser
    field :delete_user, Integer, mutation: Mutations::DeleteUser

    field :create_post, PostType, mutation: Mutations::CreatePost
    field :update_post, PostType, mutation: Mutations::UpdatePost
    field :delete_post, Integer, mutation: Mutations::DeletePost
  end
end
