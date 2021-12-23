class DashboardsController < ApplicationController
  def show
    @user = current_user
    @user.chef = true unless @user.events.empty?
  end
end
