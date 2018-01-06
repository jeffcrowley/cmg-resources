class Project < ApplicationRecord
   has_many :follows, dependent: :destroy
   has_many :users, through: :follows
   has_many :change_orders
   has_many :rfis
   has_many :returns

   def approved_change_order_total
      co_amount = 0.0
      if self.change_orders.any?
         self.change_orders.each do |change_order|
            co_amount += change_order.approved_co_value
         end
      end
      return co_amount
   end


   def current_contract
      self.original_contract_amount + self.approved_change_order_total
   end

end
