class Job < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :applies, dependent: :destroy
  has_many :applicants, through: :applies, dependent: :destroy
end
