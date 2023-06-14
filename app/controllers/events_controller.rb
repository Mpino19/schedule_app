class EventsController < ApplicationController
  def index
    @events=Event.all
  end

  def new
    @event=Event.new
  end

  def create
    @event = Event.new(params.require(:event).permit(:name, :start_at, :finish_at, :all_day, :memo))
    if @event.save
      flash[:notice] = "予定を追加しました"
      redirect_to :events
    else
      render "new"
    end
  end

  def show
    @event=Event.find(params[:id])
  end

  def edit
    @event=Event.find(params[:id])
  end

  def update
    @event=Event.find(params[:id])
    if @event.update(params.require(:event).permit(:name, :start_at, :finish_at, :all_day, :memo))
      flash[:notice] = "予定を編集しました"
      redirect_to :events
    else
      render "edit"
    end
  end

  def destroy
    @event=Event.find(params[:id])
    @event.destroy
    flash[:notice] = "予定を削除しました"
    redirect_to :events
  end

end
