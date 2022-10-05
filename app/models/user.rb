class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts , dependent: :destroy
  has_many :comments , dependent: :destroy
  

  enum status: [
    :pending,
    :active,
    :inactive
]
after_initialize :set_default_status, :if => :new_record?

  def set_default_status
    self.status ||= :pending
  end
  enum role: [
    :user,
    :admin
  ]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end


  def active_for_authentication?
    super && self.active?
  end
  
end
