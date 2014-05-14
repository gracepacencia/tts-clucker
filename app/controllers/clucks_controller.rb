class ClucksController < ApplicationController
before_action :set_cluck, only: [:show, :edit, :update, :destroy]
  # require 'Cluck_helper.rb'

  
  def new
      @cluck = Cluck.new
      # cluckhelper = Cluck_helper.new
      # @cluck = cluckhelper.createEmptyCluck
      
    end

  def index
      @clucks = Cluck.all
      # cluckhelper = Cluck_helper.new    
      # @clucks = cluckhelper.getAllClucks
      
  end

  def show  
 	end

 	def edit
 	end


 	def create
   	 @cluck = Cluck.new(cluck_params)

    respond_to do |format|
    if @cluck.save
        format.html { redirect_to @cluck, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cluck }
    else
        format.html { render action: 'new' }
        format.json { render json: @cluck.errors, status: :unprocessable_entity }
   	   end
   	end
end

  def update
    respond_to do |format|
      if @cluck.update(cluck_params)
        format.html { redirect_to @cluck, notice: 'Cluck was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cluck.errors, status: :unprocessable_entity }
      end
    end
  end
  

  def destroy
    @cluck.destroy
    respond_to do |format|
      format.html { redirect_to clucks_url }
      format.json { head :no_content }
    end
  end

  private

    def set_cluck
      @cluck = Cluck.find(params[:id])
      # # cluckhelper = Cluck_helper.new
      # p params[:id]
      # @cluck = cluckhelper.findCluck(params[:id])
    end


    def cluck_params
      params.require(:cluck).permit(:userid,:username, :body, :posted_date, :starred)
    end

  end