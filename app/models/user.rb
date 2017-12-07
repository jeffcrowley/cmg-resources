class User < ApplicationRecord
   has_many :follows
   has_many :projects, through: :follows

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

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
