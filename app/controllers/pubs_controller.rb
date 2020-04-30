class PubsController < ApplicationController
  before_action :find_pub, only: [:show, :create, :update, :destroy ]

  def index
    @pubs = Pub.all
  end

  def show
  end

  def new
    @pub = Pub.new
  end

  def create
    @pub = Pub.new(pub_params)
    @pub.user = current_user
    if @pub.save
      redirect_to pubs_path
    else 
      render :new
    end

  end


  private

  def find_pub
    @pub = Pub.find(params[:id])
  end

  def pub_params
    params.require(:pub).permit(:name, :address)
  end

end
