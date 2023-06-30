class Apply < ApplicationRecord
  paginates_per 5
  belongs_to :job
  belongs_to :applicant, :class_name => "User", foreign_key: 'user_id'
  enum :status, {hold: 0, accepted:1, rejected: 2}
  after_create :send_job_mail


  def send_job_mail
    user = User.find(self.user_id)
    job = self.job
    ConfirmationMailer.with(user: user,job: job).application_email.deliver_now
  end

  def send_accept_mail
    user = User.find(self.user_id)
    job = self.job
    ConfirmationMailer.with(user: user,job: job).accept_application.deliver_now
  end

  def send_reject_mail
    user = User.find(self.user_id)
    job = self.job
    ConfirmationMailer.with(user: user,job: job).reject_application.deliver_now
  end
end
