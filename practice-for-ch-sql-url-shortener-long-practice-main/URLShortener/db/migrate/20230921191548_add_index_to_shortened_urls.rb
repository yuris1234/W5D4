class AddIndexToShortenedUrls < ActiveRecord::Migration[7.0]
  def change
    add_index :shortened_urls, :email, unique: :true 
  end
end
