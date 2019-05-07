class User < ApplicationRecord
    validates :password, length: {minimum: 6, allow_nil: true}
    validates :username, :password_digest, :session_token, presence: true
    after_initialize :ensure_token

    attr_reader :password

    has_many :posts,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: 'Post'

    has_many :subs,
        primary_key: :id,
        foreign_key: :moderator_id,
        class_name: 'Sub'

    def self.find_by_credentials(user_name, password)
        user = User.find_by(username: user_name)
        if user && user.is_password?(password)
            return user
        end
        nil
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def self.generate_token
        SecureRandom.urlsafe_base64
    end

    def ensure_token
        self.session_token ||= User.generate_token
    end

    def reset_token!
        self.session_token = self.class.generate_token
        self.save!
        self.session_token
    end
end