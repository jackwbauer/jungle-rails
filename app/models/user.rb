class User < ActiveRecord::Base

    has_secure_password

    has_many :reviews

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, case_sensitive: false
    validates :password, presence: true
    validates :password_confirmation, presence: true

    validates_uniqueness_of :email, :case_sensitive => false

    def authenticate_with_credentials(email, password)
        email.strip!
        user = User.find_by(email: email.downcase)
        if(user && user.authenticate(password))
            user
        else
            nil
        end
    end
end
