module Api
  class RolesController < ApplicationController
    load_and_authorize_resource class: "User"
  end
end
