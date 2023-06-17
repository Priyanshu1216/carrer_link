class Applicant < ApplicationRecord
  has_many :applies
  has_many :jobs, through: :applies, dependent: :destroy
end
