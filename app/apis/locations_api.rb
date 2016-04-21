class LocationsApi < Grape::API
  desc 'Get a list of locations'
  params do
    optional :ids, type: Array, desc: 'Array of location ids'
    optional :company_id, desc: 'ID of the company'
  end

  get do
    locations = params[:company_id] ? Location.where(company_id: params[:company_id]) : "Company with that ID not found"
    represent locations, with: LocationRepresenter
  end

  get do
    locations = params[:ids] ? Location.where(id: params[:ids]) : Location.all
    represent locations, with: LocationRepresenter
  end

  desc 'Create a location'
  params do
    optional :company_id, type: String, desc: "The id of the company using the API"
    optional :location_title, type: String, desc: "The name of the location being tracked"
    optional :lattitude, type: String, desc: "The lattitude at which the user is checking in"
    optional :longitude, type: String, desc: "The longitude at which the user is checking in"
    optional :hemi_n_s, type: String, desc: "The North/South hemisphere"
    optional :hemi_e_w, type: String, desc: "The East/West hemisphere"
  end

  post do
    # location = Location.create!(permitted_params)
    location = Location.new(permitted_params)
    if location.save
      represent location, with: LocationRepresenter
    else
      return { errors: location.errors.full_messages }
    end
  end

  params do
    requires :id, desc: 'ID of the location'

  end
  route_param :id do
    desc 'Get a location'
    get do
      location = Location.find(params[:id])
      represent location, with: LocationRepresenter
    end

    desc 'Update a location'
    params do
      optional :company_id, type: String, desc: "The id of the company using the API"
      optional :location_title, type: String, desc: "The name of the location being tracked"
      optional :lattitude, type: String, desc: "The lattitude at which the user is checking in"
      optional :longitude, type: String, desc: "The longitude at which the user is checking in"
      optional :hemi_n_s, type: String, desc: "The North/South hemisphere"
      optional :hemi_e_w, type: String, desc: "The East/West hemisphere"
    end
    put do
      # fetch location record and update attributes.  exceptions caught in app.rb
      location = Location.find(params[:id])
      location.update_attributes!(permitted_params)
      represent location, with: LocationRepresenter
    end

    desc "Delete a location"
    delete do
      loc = Location.find(params[:id])
      if loc.destroy
        return "Location #{loc[:id]} has been removed successfully"
      end
    end
  end
end
