class DashboardController < ApplicationController
  before_action :check_active_session, only: [:show]

  def show
    @usuario = Usuario.all
  end
end
