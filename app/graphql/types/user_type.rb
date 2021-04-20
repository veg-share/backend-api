module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :username, String, null: true
    field :password_digest, String, null: true
    field :city, String, null: true
    field :zip_code, String, null: true
    field :state, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :posts, [Types::PostType], null: false
    def posts
      object.posts
    end

    field :avatar, String, null: true
    def avatar
      Rails.application.routes.url_helpers.rails_blob_path(object.avatar, only_path: true) if object.avatar.attached?
    end
  end
end
