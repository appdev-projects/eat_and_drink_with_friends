class PartiesController < ApplicationController
  def index
    matching_parties = Party.all

    @list_of_parties = matching_parties.order({ :created_at => :desc })

    render({ :template => "parties/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_parties = Party.where({ :id => the_id })

    @the_party = matching_parties.at(0)

    render({ :template => "parties/show.html.erb" })
  end

  def create
    the_party = Party.new
    the_party.date = params.fetch("query_date")
    the_party.time = params.fetch("query_time")
    the_party.description = params.fetch("query_description")
    the_party.user_id = @current_user.id
    the_party.address = params.fetch("address")

    if the_party.valid?
      the_party.save
      redirect_to("/parties", { :notice => "Party created successfully." })
    else
      redirect_to("/parties", { :notice => "Party failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_party = Party.where({ :id => the_id }).at(0)

    the_party.date = params.fetch("query_date")
    the_party.time = params.fetch("query_time")
    the_party.description = params.fetch("query_description")
    the_party.user_id = params.fetch("party_host")
    the_party.address = params.fetch("address")

    if the_party.valid?
      the_party.save
      redirect_to("/parties/#{the_party.id}", { :notice => "Party updated successfully."} )
    else
      redirect_to("/parties/#{the_party.id}", { :alert => "Party failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_party = Party.where({ :id => the_id }).at(0)

    the_party.destroy

    redirect_to("/parties", { :notice => "Party deleted successfully."} )
  end
end
