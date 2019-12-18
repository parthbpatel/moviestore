class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def cart_count
    $redis.scard "cart#{id}"
  end

  def get_cart_movies
    cart_ids = $redis.smembers "cart#{id}"
    Movie.find(cart_ids)
  end               
end
