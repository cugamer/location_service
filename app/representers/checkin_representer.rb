class CheckinRepresenter < Napa::Representer
  property :id, type: String

  property :user_id, type: String
  property :lattitude, type: String
  property :longitude, type: String
  property :hemi_n_s, type: String
  property :hemi_e_w, type: String
end
