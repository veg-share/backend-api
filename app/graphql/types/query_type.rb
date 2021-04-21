module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    # include GraphQL::Types::Relay::HasNodeField
    # include GraphQL::Types::Relay::HasNodesField

    #post

    #index
    field :get_all_posts, [Types::PostType], null: false
    def get_all_posts
      Post.all
    end

    #show
    field :get_one_post, PostType, null: true do
      argument :id, ID, required: true
    end
    def get_one_post(id:)
      Post.find(id)
    end


    #user

    #index
    field :get_all_users, [Types::UserType], null: false
    def get_all_users
      User.all
    end

    #show
    field :get_one_user, UserType, null: true do
      argument :id, ID, required: true
    end
    def get_one_user(id:)
      User.find(id)
    end
  end
end
