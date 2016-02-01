class WeeksController < ApplicationController
before_filter :init_virtues

  def init_virtues
    virtues = ['Temperance', 'Silence', 'Order', 'Resolution', 'Frugality', 'Industry',
               'Sincerity', 'Justice', 'Moderation', 'Cleanliness', 'Tranquility', 'Chastity','Humility']
    user = current_user
    @virtue =  virtues[current_user.weeks.count % 12]
    aphorisms = ['Eat not to dullness; drink not to elevation.', 'Speak not but what may benefit others or yourself; avoid trifling conversation.', 'Let all your things have their places; let each part of your business have its time.', 'Resolve to perform what you ought; perform without fail what you resolve.', 'Make no expense but to do good to others or yourself; i.e., waste nothing.', "Lose no time; be always employ'd in something useful; cut off all unnecessary actions.", 'Use no hurtful deceit; think innocently and justly and, if you speak, speak accordingly.', 'Wrong none, by doing injuries, or omitting the benefits that are your duty.', 'Avoid Extremes. Forbear resenting Injuries so much as you think they deserve.', 'Tolerate no uncleanness in body, cloaths, or habitation.', 'Be not disturbed at trifles, or at accidents common or unavoidable.', 'Rarely use venery but for health or offspring, never to dullness, weakness, or the injury of your own or another’s peace or reputation.', 'Imitate Jesus and Socrates.']
    @aphorism = aphorisms[current_user.weeks.count % 12]
  end

  def new
    @week = Week.new
  end

  def index
    @weeks = current_user.weeks.all
  end

  def create
    user = current_user
    @week = current_user.weeks.build(week_params)
    if @week.save
      flash[:success]= "Got it!"
      redirect_to new_week_path
    else
      redirect_to new_week_path
    end
  end
  private

    def week_params
      params.require(:week).permit(:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :virtue)
    end
end
