class CheckinsApi < Grape::API
  desc 'Get a list of checkins'
  params do
    optional :ids, type: Array, desc: 'Array of checkin ids'
  end
  get do
    checkins = params[:ids] ? Checkin.where(id: params[:ids]) : Checkin.all
    represent checkins, with: CheckinRepresenter
  end

  desc 'Create a checkin'
  params do
    optional :user_id, type: String, desc: "The ID of the user checking in"
    optional :lattitude, type: String, desc: "The lattitude at which the user is checking in"
    optional :longitude, type: String, desc: "The longitude at which the user is checking in"
    optional :hemi_n_s, type: String, desc: "The North/South hemisphere"
    optional :hemi_e_w, type: String, desc: "The East/West hemisphere"
  end

  post do
    # checkin = Checkin.create!(permitted_params)
    checkin = Checkin.new(permitted_params)
    if checkin.save
      represent checkin, with: CheckinRepresenter
    else
      return { errors: checkin.errors.full_messages }
    end
  end

  params do
    requires :id, desc: 'ID of the checkin'
  end
  route_param :id do
    desc 'Get a checkin'
    get do
      checkin = Checkin.find(params[:id])
      represent checkin, with: CheckinRepresenter
    end

    desc 'Update a checkin'
    params do
      optional :user_id, type: String, desc: "The ID of the user checking in"
      optional :lattitude, type: String, desc: "The lattitude at which the user is checking in"
      optional :longitude, type: String, desc: "The longitude at which the user is checking in"
      optional :hemi_n_s, type: String, desc: "The North/South hemisphere"
      optional :hemi_e_w, type: String, desc: "The East/West hemisphere"
    end
    put do
      # fetch checkin record and update attributes.  exceptions caught in app.rb
      checkin = Checkin.find(params[:id])
      checkin.update_attributes!(permitted_params)
      represent checkin, with: CheckinRepresenter
    end

    desc "Delete a checkin"
    delete do
      check = Checkin.find(params[:id])
      if check.destroy
        return "Checkin #{check[:id]} has been removed successfully"
      end
    end
  end
end
