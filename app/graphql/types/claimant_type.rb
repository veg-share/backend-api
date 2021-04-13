module Types
  class ClaimantType < Types::BaseObject
    field :id, ID, null: false
    field :post_id, Integer, null: true
    field :claimant_id, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
