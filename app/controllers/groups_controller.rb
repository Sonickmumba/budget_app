class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_author

  def index
    @groups = Group.all.includes(:entities).order(created_at: :desc)
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.author_id = current_user.id
    if @group.save
      redirect_to groups_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    if @group.destroy
      redirect_to groups_path
    else
      render :new
    end
  end

  private

  def set_author
    @author = current_user
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
