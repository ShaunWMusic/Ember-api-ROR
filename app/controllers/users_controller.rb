class UsersController < ApplicationController
  before_action :authenticate, only: [:show_current]

  def show_current
    resource_serializer = JSONAPI::ResourceSerializer.new(UserResource)
    json = resource_serializer.serialize_to_hash(UserResource.new(@current_user, nil))

    render json: json
  end
end
