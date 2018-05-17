class NotesController < ApplicationController
  before_action :find_note, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  #validates :valid_status
  helper_method :sort_column,  :sort_direction




  def search
  end

  def index

    @notes = Note.where(user_id: current_user)
    if params[:status].present?
      @status_id = Status.find_by(name: params[:status]).id
      @notes = Note.where(status_id: @status_id).order('created_at DESC')
    end
    @notes = @notes.search(params[:search]) if params[:search].present?
    @notes= @notes.order(sort_column + " " + sort_direction)
    #@notes = @notes.order(params[:sort_field] => params[:sort_direction] || :desc) if params[:sort_field].present?
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
    Note.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end


  #def valid_status

   # if note.status.id == 3
    #  error.add()
   # end


  #end




end
