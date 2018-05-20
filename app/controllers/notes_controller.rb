class NotesController < ApplicationController
  before_action :find_note, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  #validates :valid_status
  helper_method :sort_column,  :sort_direction

  def export
    CSV.open("tmp/file.csv", 'wb') do |csv|
      csv << %w(Title Content Created_at Updated_at)
      current_user.notes.ready_for_export.each do |note|
        if note
          csv << [note.title, note.content, note.created_at, note.updated_at]
          note.exported!
        end
      end
    end
    send_file("tmp/file.csv")
  end

  def index
    @notes = Note.where(user_id: current_user)
    @notes = @notes.where(status: params[:status]) if params[:status].present?
    if params[:search].present?
      @notes = @notes.search(params[:search], order: {sort_column => sort_direction})
    else
      @notes = @notes.order("#{sort_column} #{sort_direction}")
    end
  end

  def show

  end

  def new
    @note = current_user.notes.build
  end

  def create
    @note = current_user.notes.build(note_params)

    if @note.save
      redirect_to @note
    else
      render 'new'
    end


  end

  def edit

  end

  def update
    if @note.update(note_params)
      redirect_to @note
    else
      render 'edit'
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_path
  end

  private

  def find_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content,  :status_id)
  end

  def sort_column
    Note.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
