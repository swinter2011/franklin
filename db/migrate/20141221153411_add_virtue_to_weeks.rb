class AddVirtueToWeeks < ActiveRecord::Migration
  def change
    add_column :weeks, :virtue, :string
  end
end
