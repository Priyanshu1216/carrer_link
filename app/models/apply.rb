class Apply < ApplicationRecord
  belongs_to :job
  belongs_to :applicant, :class_name => "User", foreign_key: 'user_id'
  enum :status, {hold: 0, accepted:1, rejected: 2}
end