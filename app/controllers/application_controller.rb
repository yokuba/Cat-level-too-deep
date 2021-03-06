class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :has_voted?, :get_vote, :vote_count

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def get_vote(votable)
    Vote.where(user_id: current_user.id, votable_id: votable.id).first
  end

  def has_voted?(votable)
    logged_in? && get_vote(votable)
    # Vote.where(user_id: current_user.id, votable_id: votable.id).count != 0
  end

  def vote_count(votable)
    upvotes = Vote.where(votable_id: votable.id, up_vote: true).count
    downvotes = Vote.where(votable_id: votable.id, up_vote: false).count
    upvotes - downvotes
  end

  def render_404
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
      format.all { render nothing: true, status: 404 }
    end
  end
end

