# frozen_string_literal: true

class ChangeEventDateToDateTime < ActiveRecord::Migration[6.1]
  def change
    change_column(:events, :date, :datetime)
  end
end
