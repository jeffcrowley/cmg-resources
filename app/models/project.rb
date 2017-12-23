class Project < ApplicationRecord
   has_many :follows, dependent: :destroy
   has_many :users, through: :follows
   has_many :change_orders

   def current_contract
      if self.change_orders.any?
         co_amount = 0.0
         self.change_orders.each do |change_order|
            co_amount += change_order.approved_co_value
         end
         return co_amount + self.original_contract_amount
      else
         return self.original_contract_amount
      end
   end

end
