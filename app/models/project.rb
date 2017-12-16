class Project < ApplicationRecord
   has_many :follows, dependent: :destroy
   has_many :users, through: :follows
   has_many :change_orders
end
