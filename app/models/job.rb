class Job < ApplicationRecord
  paginates_per 5
  belongs_to :category
  belongs_to :user
  has_many :applies, dependent: :destroy
  has_many :applicants, through: :applies, dependent: :destroy
  validates :title, :description, :salary, :experience, :location,:skillset, presence: true
  validates :title, :description, :location,:skillset, length: {minimum: 10, message: "must be atleast 10 character long"}
end
