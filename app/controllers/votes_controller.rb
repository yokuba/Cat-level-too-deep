class VotesController < ApplicationController

  def create
    @vote = Vote.new(vote_params)
    if @vote.save && @vote.votable_type == "question"
      redirect_to questions_path
    elsif @vote.save && @vote.votable_type == "answer"
      redirect_to question_path(id: Answer.find(@vote.votable_id).question.id)
    else
      render :index
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:up_vote, :votable_id, :votable_type, :user_id )
  end

end
