class User::Create < ActiveInteraction::Base
  array(:interests, :skills) { object }
  integer :age
  string :country, :email, :name, :nationality, :patronymic, :surname, :gender

  validate :validate_email_uniqueness
  validates :age, :name, :nationality, :patronymic, :surname, :email, :gender,
    presence: true
  validates :age, inclusion: { in: (1..90)}
  validates :gender, inclusion: { in: %w[male female] }
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP

  def execute
    User.create(params)
  end

  private

  def fullname
    "#{surname} #{name} #{patronymic}"
  end

  def params
    inputs.merge(email: email.downcase, fullname: fullname)
  end

  def validate_email_uniqueness
    errors.add(:email, :not_unique) if User.where(email: email.downcase).exists?
  end
end
