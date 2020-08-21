class FoodsController < ApplicationController
  def index
    matching_foods = Food.all

    @list_of_foods = matching_foods.order({ :created_at => :desc })

    render({ :template => "foods/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_foods = Food.where({ :id => the_id })

    @the_food = matching_foods.at(0)

    render({ :template => "foods/show.html.erb" })
  end

  def create
    the_food = Food.new
    the_food.name = params.fetch("query_name")
    the_food.description = params.fetch("query_description")
    the_food.party_id = params.fetch("query_party_id")
    the_food.user_id = params.fetch("query_user_id")

    if the_food.valid?
      the_food.save
      redirect_to("/parties/#{the_food.party_id}", { :notice => "Food created successfully." })
    else
      redirect_to("/parties/#{the_food.party_id}", { :notice => "Food failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_food = Food.where({ :id => the_id }).at(0)

    the_food.name = params.fetch("query_name")
    the_food.description = params.fetch("query_description")
    the_food.party_id = params.fetch("query_party_id")
    the_food.user_id = params.fetch("query_user_id")

    if the_food.valid?
      the_food.save
      redirect_to("/parties/#{the_food.party_id}", { :notice => "Food updated successfully."} )
    else
      redirect_to("/parties/#{the_food.party_id}", { :alert => "Food failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_food = Food.where({ :id => the_id }).at(0)

    the_food.destroy

    redirect_to("/foods", { :notice => "Food deleted successfully."} )
  end
end
