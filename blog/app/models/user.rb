class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_create :make_first_user_admin

  def admin?
    return self.administrator
  end

  private
  def make_first_user_admin
    if User.all.length == 0 then
      self.administrator = true
    end
  end
end
