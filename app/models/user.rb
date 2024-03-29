class User < ApplicationRecord
  has_many :Posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy


  validates :name, presence: true, :uniqueness => true, :length => { :in => 3..20 }

  validates :email, presence: true, :uniqueness => true
  #validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_format_of :email, :with => /\A([-a-z0-9!\#$%&'*+\/=?^_`{|}~]+\.)*[-a-z0-9!\#$%&'*+\/=?^_`{|}~]+@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i



  validates :password, presence: true
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create #added edit option
  validates_length_of :password, :in => 6..20, :on => :update

  before_save :encrypt_password
  after_save :clear_password



  attr_accessor :password #automatically sets up getters and setters for password



  #encryption of password using BCrypt
  before_save :encrypt_password

  #clear password after it has been stored in database
  after_save :clear_password

  #the following attributes will be accessible during Mass assignment


  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password= BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end













end
