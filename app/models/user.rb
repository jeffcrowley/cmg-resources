class User < ApplicationRecord
   has_many :follows, dependent: :destroy
   has_many :projects, through: :follows
   has_many :change_orders
   has_many :rfis
   has_many :returns
   has_many :history_events

   enum role: [:user, :admin]
   after_initialize :set_default_role, if: :new_record?
   after_create :skip_conf!

   def skip_conf!
      self.confirm if Rails.env.development?
   end

   def set_default_role
      self.role ||= :user
   end

   def name
      [first_name, last_name].compact.join(' ')
   end

   #follows project (see change order log app and Hartl micropost tutorial)
   def follow(project)
      Follow.create(user_id: self.id, project_id: project.id)
      new_follow = self.follows.find_by(project_id: project.id)
      project.history_events.create(user_id: self.id, project_id: project.id, description: "#{self.name} started following project #{project.job_num} - #{project.name} (#{new_follow.created_at.strftime('%D')}.)")
   end

   #unfollows project
   def unfollow(project)
      follow = self.follows.find_by(project_id: project.id)
      project.history_events.create(user_id: self.id, project_id: project.id, description: "#{self.name} stopped following project #{project.job_num} - #{project.name} (#{Time.now.strftime('%D')}.)")
      follow.destroy
   end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
