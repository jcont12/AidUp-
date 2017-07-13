require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :events, foreign_key: 'creator_id'

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :hashed_password, presence: true


  def full_name
    self.first_name + ' ' + self.last_name
  end

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email,password)
    @user = User.find_by_email(email)
    return nil if @user == nil
    if @user.password == password
      @user
    else nil
    end
  end
end
