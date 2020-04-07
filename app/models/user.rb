class User < ApplicationRecord
	before_save { self.email = email.downcase } # Перевод в нижний регистр почты
	validates :name,  presence: true, length: { maximum: 50 } # Ограничение имени 50 символами
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  # Запись в переменную регулярки для почты
	validates :email, presence: true, length: { maximum: 255 }, # Ограничение почты 255 симолами
	                  format: { with: VALID_EMAIL_REGEX },  # Серка почты с регуляркой
	                  uniqueness: { case_sensitive: false } # Нечувствительность почты к регистру

	has_secure_password 
	validates :password, presence: true, length: { minimum: 6 } # Пароль от 6 символов 
end
