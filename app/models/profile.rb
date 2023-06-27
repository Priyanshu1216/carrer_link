class Profile < ApplicationRecord
  belongs_to :user
  validates :name, :email, :contact, :dob, :skills, :qualification, :address, presence: true
  validates :name, :skills, length: {minimum: 5}
  validates :contact, length: {:is => 10}
  validates :qualification, length: {minimum: 4}
  validates :address, length: {:in => 5..30}
  validate :date_of_birth

  private

  def date_of_birth
    if dob.present? && dob > 18.years.ago.to_date.today
      errors.add(:dob, "must be at least 18 years ago")
    end
  end
end
