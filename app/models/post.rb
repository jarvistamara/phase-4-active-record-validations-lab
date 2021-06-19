class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    validate :clickbait

    def clickbait
        accepted_titles = [ "Won't Believe", "Secret",  "Top [number]",  "Guess" ]
        if title
            title_check = accepted_titles.any? {|t| title.include?(t)}
            if !title_check
                errors.add(:title, "need to be clickbait-y")
            end
        end
    end
end
