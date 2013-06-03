module BeersHelper

  def belongs_to_user(beer)
    user_signed_in? && beer.user == current_user
  end

end