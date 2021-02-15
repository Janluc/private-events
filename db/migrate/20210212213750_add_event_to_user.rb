# frozen_string_literal: true

class AddEventToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :user, index: true, foreign_key: true
  end
end
