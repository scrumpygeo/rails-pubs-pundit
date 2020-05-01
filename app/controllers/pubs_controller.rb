class PubsController < ApplicationController
  before_action :set_pub, only: [:show, :edit, :update, :destroy ]

  def index
    @pubs = policy_scope(Pub).order(name: :asc)
  end

  def show
  end

  def new
    @pub = Pub.new
    authorize @pub
  end

  def create
    @pub = Pub.new(pub_params)
    @pub.user = current_user
    authorize @pub
    if @pub.save
      redirect_to pubs_path
    else 
      render :new
    end

  end

  def edit
  end

  def update
    if @pub.update(pub_params)
      redirect_to pub_path(@pub)
    else
      render :edit
    end
  end


  private

  def set_pub
    @pub = Pub.find(params[:id])
    authorize @pub
  end

  def pub_params
    params.require(:pub).permit(:name, :address)
  end

end
