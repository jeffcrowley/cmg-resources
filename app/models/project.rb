class Project < ApplicationRecord
   has_many :follows, dependent: :destroy
   has_many :users, through: :follows
end
