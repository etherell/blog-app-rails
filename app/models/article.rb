class Article < ApplicationRecord
	has_many :comments, dependent: :destroy # Связывание статьи с комментариями
	validates :title, presence: true, length: { minimum: 5 } # Валидация минимальной длины для заголовка статьи
	validates :text, presence: true, length: { maximum: 255 } # Масимальная длинна сообщения до 255 символов
end
