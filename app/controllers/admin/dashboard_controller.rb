class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['BASIC_AUTHENTICATE_NAME'], password: ENV['BASIC_AUTHENTICATE_PASSWORD']

  def show
  end
end
