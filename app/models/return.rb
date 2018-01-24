class Return < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :pallets
  accepts_nested_attributes_for :pallets

  def piece_count
   count = 0
   self.pallets.each do |p|
      count += p.piece_count
   end
   return count
end
end
