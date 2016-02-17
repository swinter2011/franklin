class Week < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true

  def set_virtue(foo)
    virtues = ['Temperance', 'Silence', 'Order', 'Resolution', 'Frugality', 'Industry',
               'Sincerity', 'Justice', 'Moderation', 'Cleanliness', 'Tranquility', 'Chastity','Humility']
     assign_attributes(:virtue => virtues[foo])
  end
end
