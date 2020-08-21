class DrinksController < ApplicationController
  def index
    matching_drinks = Drink.all

    @list_of_drinks = matching_drinks.order({ :created_at => :desc })

    render({ :template => "drinks/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_drinks = Drink.where({ :id => the_id })

    @the_drink = matching_drinks.at(0)

    render({ :template => "drinks/show.html.erb" })
  end

  def create
    the_drink = Drink.new
    the_drink.name = params.fetch("query_name")
    the_drink.party_id = params.fetch("query_party_id")
    the_drink.user_id = params.fetch("query_user_id")

    if the_drink.valid?
      the_drink.save
      redirect_to("/parties/#{the_drink.party_id}", { :notice => "Drink created successfully." })
    else
      redirect_to("/parties/#{the_drink.party_id}", { :notice => "Drink failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_drink = Drink.where({ :id => the_id }).at(0)

    the_drink.name = params.fetch("query_name")
    the_drink.party_id = params.fetch("query_party_id")
    the_drink.user_id = params.fetch("query_user_id")

    if the_drink.valid?
      the_drink.save
      redirect_to("/parties/#{the_drink.party_id}", { :notice => "Drink updated successfully."} )
    else
      redirect_to("/parties/#{the_drink.party_id}", { :alert => "Drink failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_drink = Drink.where({ :id => the_id }).at(0)

    the_drink.destroy

    redirect_to("/drinks", { :notice => "Drink deleted successfully."} )
  end
end
