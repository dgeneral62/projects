class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :custom_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
  def valid_for_custom_authentication?(password)
    logger.debug('------------authenticate!---------------')
    gid = self.google
    uname = self.email
    record = User.where()
    if gid != nil && gid != ''
      return true
    else 
      skip_custom_strategies
    end
  end
end
