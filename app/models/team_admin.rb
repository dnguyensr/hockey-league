class TeamAdmin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :teams
  has_many :posts

  def full_name
    self.first_name.capitalize + " " + self.last_name.capitalize
  end

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved?
      :not_approved
    else
      super
    end
  end

  def readable_date
    self.created_at.strftime("%B %d, %Y")
  end
end
