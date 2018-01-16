#Required for follow_exists method
include ApplicationHelper

#Create admin

admin = User.create(first_name: 'Jeff',
                              last_name: 'Crowley',
                              email: 'jeff@example.com',
                              password: 'changeme',
                              password_confirmation: 'changeme',
                              title: 'Superintendent',
                              region: 'West')
admin.confirm if Rails.env.production?
admin.admin!

#Seed everything

if Rails.env.development?

   titles = ["Asst. Superintendent", "Superintendent", "Field Superintendent", "Sr. Superintendent", "Regional Construction Manager",
               "Crew Trainer", "Other"]
   regions = ["West", "Midwest", "Mid-Atlantic", "North East", "South"]

   20.times do
      User.create(first_name: Faker::Name.first_name,
                        last_name: Faker::Name.last_name,
                        email: Faker::Internet.unique.email,
                        password: 'password',
                        password_confirmation: 'password',
                        title: titles.sample,
                        region: regions.sample)
   end

   users = User.all

   200.times do
      Project.create(name: Faker::Company.name,
                           job_num: Faker::Number.number(6),
                           original_contract_amount: Faker::Number.decimal(5, 2),
                           terr_manager: Faker::Name.name,
                           created_by: users.sample.name)
   end

   projects = Project.all

   600.times do
      user = users.sample
      project = projects.sample
      if follow_exists(user, project) == false
         Follow.create(user_id: users.sample.id,
                              project_id: projects.sample.id)
      else
         redo
      end
   end

   1100.times do
      value = Faker::Number.number(5)
      project = projects.sample
      project.change_orders.create(user_id: users.sample.id,
                                                   co_num: (project.change_orders.count + 1).to_s,
                                                   gc_co_num: Faker::Number.number(4).to_s,
                                                   name: "Change Order #{project.change_orders.count + 1}",
                                                   date_submitted: Faker::Date.between(3.weeks.ago, 1.week.ago),
                                                   date_received: Faker::Date.between(1.week.ago, 1.day.from_now),
                                                   initial_co_value: value,
                                                   labor_value: Faker::Number.number(4),
                                                   approved_co_value: value,
                                                   status: "Executed",
                                                   notes: Faker::StarWars.quote)
   end

   400.times do
      project = projects.sample
      scope_change = ["Yes", "No"]
      project.rfis.create(user_id: users.sample.id,
                                 rfi_num: (project.rfis.count + 1).to_s,
                                 gc_rfi_num: Faker::Number.number(3).to_s,
                                 description: Faker::Lorem.sentence(5),
                                 date_submitted: Faker::Time.between(3.weeks.ago, 1.week.ago),
                                 date_answered: Faker::Time.between(1.week.ago, 1.day.from_now),
                                 scope_change: scope_change.sample,
                                 notes: Faker::Lorem.sentences(4))
   end

   1000.times do
      project = projects.sample
      shippers = ["FedEx Freight", "XPO Logistics", "Conway", "CH Robinson", "Old Dominion"]
      project.returns.create(user_id: users.sample.id,
                                       distro_center: distro_centers.keys.sample,
                                       shipper: shippers.sample,
                                       jobsite_street: Faker::Address.street_address,
                                       jobsite_city: Faker::Address.city,
                                       jobsite_state: Faker::Address.state_abbr,
                                       jobsite_zip: Faker::Address.zip_code,
                                       pallet_count: Faker::Number.between(1,10),
                                       piece_count: Faker::Number.between(1,60))
   end


end
