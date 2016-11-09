class ProfilesController < ApplicationController
  def index
    @profiles = Tupale.fetch_profiles
  end
end
