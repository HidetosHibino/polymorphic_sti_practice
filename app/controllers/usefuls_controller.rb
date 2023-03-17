class UsefulsController < ApplicationController
  def index
    @usefuls = Useful.all
  end

  def new 
    @useful = Sample.find(params[:sample_id]).usefuls.new
  end

  def create
    @useful = Sample.find(params[:sample_id]).usefuls.new(user_id: params[:useful][:user])
    if @useful.save
      redirect_to @useful.sample.word, notice: "Useful was successfully created."
    else
      flash.now[notice] = "Fail creating Useful"
      render :new, status: :unprocessable_entity
    end
  end
end
