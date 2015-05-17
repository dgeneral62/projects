class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :friends
  has_many :friendships, :through => :friends

  validates :email, presence: true

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "images/missing.png"
  validates_attachment_content_type :photo, :content_type => ['image/jpeg','image/png',/\Aimage\/.*\Z/]


  def valid_for_custom_authentication?(password)
    logger.debug('------------authenticate!---------------')
    gid = self.google
    if gid != nil && gid != '' && user_signed_in?
      return true
    else 
      skip_custom_strategies
    end
  end
  
  def self.from_omniauth(auth)
        logger.debug('------------from_omniauth!---------------')
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
      user.image = auth.info.image
      user.save!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
