class User < ApplicationRecord
  has_secure_password  # Enables password encryption
end
