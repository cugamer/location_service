class LocationRepresenter < Napa::Representer
  property :id, type: String

  property :location_title, type: String
  property :lattitude, type: String
  property :longitude, type: String
  property :hemi_n_s, type: String
  property :hemi_e_w, type: String
end
