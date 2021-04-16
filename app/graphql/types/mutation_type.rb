module Types
  class MutationType < Types::BaseObject
    #create user
    field :create_user, UserType, mutation: Mutations::CreateUser
    field :update_user, UserType, mutation: Mutations::UpdateUser
    field :delete_user, Integer, mutation: Mutations::DeleteUser
  end
end
