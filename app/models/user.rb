class User < ApplicationRecord
  after_initialize :default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :jobs, dependent: :destroy

  def default_role
    self.role ||= :applicant
  end

  enum  :role, applicant: 'applicant', client: 'client', suffix: true
end
