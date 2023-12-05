class UserDto
    include ActiveModel::Model
  
    attr_accessor :email, :password, :confirm_password
  
    validates :email, presence: true
    validates :password, presence: true
    validates :confirm_password, presence: true
end