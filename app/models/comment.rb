class Comment < ApplicationRecord
  	belongs_to :article # Связывание комментария с article
	validates :body, presence: true, length: { maximum: 150 } # Валидация минимальной длины для заголовка статьи
end
