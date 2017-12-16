module ChangeOrdersHelper

   def total_unapproved_co_value(project)
      unapproved_change_orders = project.change_orders.where.not(status: "Executed")
      total = 0.0
      unapproved_change_orders.each do |uco|
         total += uco.initial_co_value
      end
      return total
   end

   def total_unapproved_labor_value(project)
      unapproved_change_orders = project.change_orders.where.not(status: "Executed")
      total = 0.0
      unapproved_change_orders.each do |uco|
         total += uco.labor_value
      end
      return total
   end

   def total_approved_co_value(project)
      unapproved_change_orders = project.change_orders.where(status: "Executed")
      total = 0.0
      unapproved_change_orders.each do |uco|
         total += uco.approved_co_value
      end
      return total
   end

   def total_approved_labor_value(project)
      unapproved_change_orders = project.change_orders.where(status: "Executed")
      total = 0.0
      unapproved_change_orders.each do |uco|
         total += uco.labor_value
      end
      return total
   end

end
