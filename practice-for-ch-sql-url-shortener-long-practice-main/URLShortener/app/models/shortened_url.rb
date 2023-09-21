class ShortenedUrl < ApplicationRecord 
    after_initialize :generate_short_url

    validates :short_url, presence: true, uniqueness: true 

    def self.random_code
        exists = false
        until exists
            random = SecureRandom.urlsafe_base64
            if !self.exists?(short_url: random)
                return random 
                exists true 
            end
        end 
    end

    belongs_to(
        :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User
    )

    has_many
        :visits 
        primary_key :id 
        foreign_key :shortened_url_id 
        class_name :Visit 




    has_many :visited_users, Proc.new { distinct }, through: :visits, source: :user

    def num_clicks
        
    end

    def num_uniques
        self.visited_users.select {|}
    end

    def num_recent_uniques
        SELECT COUNT(*) FROM visits WHERE 10.minutes.ago
    end

    private

    def generate_short_url
        self.short_url = ShortenedUrl.random_code
    end
end 