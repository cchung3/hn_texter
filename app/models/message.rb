class Message < ActiveRecord::Base
  attr_accessible :email, :name, :body
end
