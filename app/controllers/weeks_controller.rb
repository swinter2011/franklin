class WeeksController < ApplicationController

  def new
    @week = Week.new
    user = current_user
    @week.set_virtue(current_user.weeks.count % 12)
    @virtue = @week.virtue
  end

  def index
    @weeks = current_user.weeks.all.paginate(page: params[:page], per_page: 13)

  end

  def create
    user = current_user
    @week = current_user.weeks.build(week_params)
    @week.set_virtue(current_user.weeks.count % 12)
    @virtue = @week.virtue
    if @week.save
      flash[:success]= "Got it!"
      redirect_to new_week_path
    else
      redirect_to new_week_path
    end
  end

  def edit
  @week = Week.find(params[:id])

  end

  def update
  end
  private

    def week_params
      params.require(:week).permit(:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :virtue)
    end
end
