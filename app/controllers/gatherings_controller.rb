class GatheringsController < ApplicationController
  def index
    matching_gatherings = Gathering.all

    @list_of_gatherings = matching_gatherings.order({ :created_at => :desc })

    render({ :template => "gatherings/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_gatherings = Gathering.where({ :id => the_id })

    @the_gathering = matching_gatherings.at(0)

    render({ :template => "gatherings/show.html.erb" })
  end

  def create
    the_gathering = Gathering.new
    the_gathering.user_id = params.fetch("query_user_id")
    the_gathering.party_id = params.fetch("query_party_id")
    the_gathering.rsvp = params.fetch("query_rsvp", false)

    if the_gathering.valid?
      the_gathering.save
      redirect_to("/gatherings", { :notice => "Gathering created successfully." })
    else
      redirect_to("/gatherings", { :notice => "Gathering failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_gathering = Gathering.where({ :id => the_id }).at(0)

    the_gathering.user_id = params.fetch("query_user_id")
    the_gathering.party_id = params.fetch("query_party_id")
    the_gathering.rsvp = params.fetch("query_rsvp", false)

    if the_gathering.valid?
      the_gathering.save
      redirect_to("/gatherings/#{the_gathering.id}", { :notice => "Gathering updated successfully."} )
    else
      redirect_to("/gatherings/#{the_gathering.id}", { :alert => "Gathering failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_gathering = Gathering.where({ :id => the_id }).at(0)

    the_gathering.destroy

    redirect_to("/gatherings", { :notice => "Gathering deleted successfully."} )
  end
end
