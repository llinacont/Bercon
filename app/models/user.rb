class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  belongs_to :company
  
  has_many :product, :foreign_key => [:user_id]
   
  has_many :client, :foreign_key => [:user_id]
  
  has_and_belongs_to_many :roles
  
  has_and_belongs_to_many :events
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end
  
end
