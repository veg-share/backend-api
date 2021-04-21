module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: true
    field :tags, String, null: true
    field :title, String, null: true
    field :description, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :user, Types::UserType, null: false
    def user
      object.user
    end

    field :image, String, null: true
    def image
      Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true) if object.image.attached?
    end
  end
end
