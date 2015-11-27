class User < ActiveRecord::Base
  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/
  
  acts_as_liker
  extend FriendlyId
  
  friendly_id :slug_candidates, use: :slugged
  
  def slug_candidates
    [ [:first_name, :last_name]]
  end
  
  def self.find(user)
    friendly.find(user)
  end  

  devise :database_authenticatable, :registerable,# :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update
  validates_presence_of :email
  
  has_many :pins , dependent: :destroy
  has_many :blogs , dependent: :destroy 
  has_many :prettylinks , dependent: :destroy 
  has_many :messages , dependent: :destroy
  has_many :games , dependent: :destroy  
  
  def fullname
    "#{first_name} #{last_name}"
  end
  
  def self.find_for_oauth(auth, signed_in_resource = nil)

    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user

    if user.nil?

      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(:email => email).first if email
      if user.nil?
        user = User.new(
          first_name: auth.extra.raw_info.name,
          #username: auth.info.nickname || auth.uid,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0,20]
        )
        user.save!
      end
    end

    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end
end
