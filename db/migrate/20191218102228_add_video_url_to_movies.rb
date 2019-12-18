class AddVideoUrlToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :video_url, :string
  end
end
