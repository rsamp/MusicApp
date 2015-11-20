class NotesController < ApplicationController
  before_action :require_submitter!

  def create
    @note = Note.new(note_params)
    # @track = Track.find_by(params[:track_id])
    @note.track_id = params[:track_id]
    @note.user_id = current_user.id
    @note.save!
    redirect_to track_url(params[:track_id])
  end

  def destroy
    @note = Note.find(params[:id])
    @track = @note.track_id
    @note.destroy!
    redirect_to track_url(params[:track_id])
  end

  private

  def note_params
    params.require(:note).permit(:track_id, :user_id, :note_text)
  end

  def require_submitter!
    if current_user.id != @note.user_id
      render text: "Error"
    end
  end
end
