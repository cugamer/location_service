class CheckinRepresenter < Napa::Representer
  property :id, type: String

  property :user_id, type: String
  property :lattitude, type: String
  property :longitude, type: String
end
