class EntitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_author

  def index
    @group = current_user.groups.find(params[:group_id])
    @entities = @group.entities.order(created_at: :desc)
  end

  def new
    @groups = current_user.groups.all
    @entity = Entity.new
  end

  # Take note that this is a many to many relationship
  def create
    @entity = Entity.new(entity_params) # do not use .create as it will save bu twe dont need that yet
    @entity.author_id = current_user.id
    if @entity.save
      @group_entities = GroupEntity.new(group_id: params[:group_id], entity_id: @entity.id)
      if @group_entities.save
        redirect_to group_entities_path(params[:group_id])
      else
        render :new
      end
    else
      render :new
    end
  end

  def destroy
    group = Group.find(params[:group_id]) # Find the group where that entity you are to destroy belongs
    @entity = group.entities.find(params[:id]) # Locate the all entities through the group it belongs
    entity = Entity.find(@entity.id) # Find the particular entity to destroy in Entity table through its id
    entity.group_entities.find_by(entity_id: entity.id).destroy
    @entity.destroy
    if @entity.destroy
      redirect_to group_entity_path, notice: 'Transaction deleted'
    else
      render :new
    end
  end

  private

  def set_author
    @author = current_user
  end

  def group_params
    params.require(:entity).permit(:id)
  end

  def entity_params
    params.permit(:name, :amount)
  end
end
