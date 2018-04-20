class ReviewResource < JSONAPI::Resource
  attributes :user, :body, :created_at
  has_one :book
end
