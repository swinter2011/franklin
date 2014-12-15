class WeeksController < ApplicationController
  def new
  end

  def create
    user = current_user
    @week = current_user.weeks.build(week_params)
    if @week.save
      flash[:success]= "Info saved!"
      redirect_to user
    else
      redirect_to user
    end
  end

  private

    def week_params
      params.require(:week).permit(:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :virtue)
    end
end
