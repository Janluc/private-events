class EventUsersController < ApplicationController
  belongs_to :user
  belongs_to :event
end
