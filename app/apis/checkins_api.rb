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
  end

  post do
    checkin = Checkin.create!(permitted_params)
    represent checkin, with: CheckinRepresenter
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
    end
    put do
      # fetch checkin record and update attributes.  exceptions caught in app.rb
      checkin = Checkin.find(params[:id])
      checkin.update_attributes!(permitted_params)
      represent checkin, with: CheckinRepresenter
    end
  end
end
