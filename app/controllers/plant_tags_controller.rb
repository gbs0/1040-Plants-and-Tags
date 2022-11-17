class PlantTagsController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @tags = Tag.where(id: params[:plant_tag][:tag])
    @tags.each do |tag|
      @plant_tag = PlantTag.new(plant: @plant, tag: tag)
      if @plant_tag.valid?
        @plant_tag.save
        flash[:notice] = "Saved Succesfully!"
      else
        flash[:notice] = @plant_tag.errors.messages[:tag].first
      end
    end
    redirect_to garden_path(@plant.garden)
  end
end
