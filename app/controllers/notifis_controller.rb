class NotifisController < ApplicationController
  before_action :set_notifi, only: [:show, :edit, :update, :destroy]

  def index
    @notifis = Notifi.all
    @notifi = Notifi.new
  end

  def new
    @notifi = Notifi.new
  end

  def show
  end

  def edit
  end

  def create
    @notifi = Notifi.new(notifi_params)

    respond_to do |format|
      if @notifi.save
        format.html { redirect_to @notifi, notice: 'Thank You.' }
        format.json { render :show, status: :created, location: @notifi }
      else
        format.html { render :index }
        format.json { render json: @notifi.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @notifi.update(notifi_params)
        format.html { redirect_to @notifi, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @notifi }
      else
        format.html { render :edit }
        format.json { render json: @notifi.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @notifi.destroy
    respond_to do |format|
      format.html { redirect_to notifis_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_notifi
    @notifi = Notifi.find(params[:id])
  end

  def notifi_params
    params.require(:notifi).permit(:description, :category_id, :email, :cost, :deadline)
  end
end
