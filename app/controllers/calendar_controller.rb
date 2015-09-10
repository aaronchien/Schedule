class CalendarController < ApplicationController
  
  before_filter :require_login

  def show
  	@events = current_user.events
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  private
    def require_login
      unless current_user
        redirect_to login_path
      end
    end

end