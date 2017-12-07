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
      Follow.create(user_id: users.sample.id,
                           project_id: projects.sample.id)
   end

end
