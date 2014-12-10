class WeeksController < ApplicationController
  def new
  end

  def create
    @week = current_user.weeks.build(week_params)
    if @week.save
      flash[:success]= "Info saved!"
      render 'users/show'
    else
      render 'users/show'
    end
  end

  private

    def week_params
      params.require(:week).permit(:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :virtue)
    end
end
