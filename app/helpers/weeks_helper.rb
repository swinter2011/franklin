module WeeksHelper

  def provide_aphorism(foo)
    aphorisms = ['Eat not to dullness; drink not to elevation.', 'Speak not but what may benefit others or yourself; avoid trifling conversation.', 'Let all your things have their places; let each part of your business have its time.', 'Resolve to perform what you ought; perform without fail what you resolve.', 'Make no expense but to do good to others or yourself; i.e., waste nothing.', "Lose no time; be always employ'd in something useful; cut off all unnecessary actions.", 'Use no hurtful deceit; think innocently and justly and, if you speak, speak accordingly.', 'Wrong none, by doing injuries, or omitting the benefits that are your duty.', 'Avoid Extremes. Forbear resenting Injuries so much as you think they deserve.', 'Tolerate no uncleanness in body, cloaths, or habitation.', 'Be not disturbed at trifles, or at accidents common or unavoidable.', 'Rarely use venery but for health or offspring, never to dullness, weakness, or the injury of your own or another’s peace or reputation.', 'Imitate Jesus and Socrates.']
    aphorisms[foo % 13]
  end
end
