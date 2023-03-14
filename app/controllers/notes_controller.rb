class NotesController < ApplicationController
  before_action :set_notable, only: %i[new create]

  def index 
    @notes = Note.all
    @user_notes = Note.where(notable_type: "User")
    @word_notes = Note.where(notable_type: "Word")
  end

  def new
    @note = Note.new
  end

  def create
    @note = @notable.notes.new(note_params)
    if @note.save
      redirect_to @notable, notice: "Note was successfully created."
    else
      redirect_to new_polymorphic_url([@notable, @note]), notice: "failed creating Note."
    end
  end

  def show
    @note = Note.find(params[:id])
  end

  private

  def note_params
    params.require(:note).permit(:body)
  end

  # @notableの生成は各controllerでオーバーライドして行う
  def set_notable
    raise NotImplementedError
  end
end
