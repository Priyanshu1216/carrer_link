class User < ApplicationRecord
  after_initialize :default_role
  after_create :welcome_email
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :jobs, dependent: :destroy
  has_many :applies, dependent: :destroy
  has_many :applicants, through: :applies, dependent: :destroy
  has_one :profile, dependent: :destroy
  validates :name, presence: true
  
  def default_role
    self.role ||= :applicant
  end

  enum  :role, applicant: 'applicant', client: 'client', suffix: true

  def welcome_email
    ConfirmationMailer.welcome_email(self).deliver_now
  end
end
