module ChangeOrdersHelper

    def change_order_statuses
      ["Unsubmitted", "Submitted to GC", "Returned - Needs Revision", "Returned - Awaiting Execution", "Executed"]
   end

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
      approved_change_orders = project.change_orders.where(status: "Executed")
      total = 0.0
      approved_change_orders.each do |aco|
         aco.approved_co_value = 0.0 if aco.approved_co_value.nil?
         total += aco.approved_co_value
      end
      return total
   end

   def total_approved_labor_value(project)
      approved_change_orders = project.change_orders.where(status: "Executed")
      total = 0.0
      approved_change_orders.each do |aco|
         total += aco.labor_value
      end
      return total
   end

end
