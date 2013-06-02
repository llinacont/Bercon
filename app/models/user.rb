require 'role_model'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  belongs_to :company
  
  has_many :product, :foreign_key => [:user_id]
   
  has_many :client, :foreign_key => [:user_id]
  
  after_create :notify
  
  has_and_belongs_to_many :roles
  
  has_many :events
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  include RoleModel
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :company_id, :roles, :roles_mask, :name, :last_name
  
  # optionally set the integer attribute to store the roles in,
  # :roles_mask is the default
  roles_attribute :roles_mask
 
  # declare the valid roles -- do not change the order if you add more
  # roles later, always append them at the end!
  roles :admin, :seller, :dealer

  def complete_name
      name = self.name "" + self.last_name
      return name
  end
  
  def notify
     UserMailer.welcome_email(self).deliver
  end
end
