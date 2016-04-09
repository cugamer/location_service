class Location < ActiveRecord::Base
	LATTITUDE_FORMAT = /\d{1,2}\.\d{4}/
	LONGITUDE_FORMAT = /\d{1,3}\.\d{4}/	

	validates :lattitude, format: { with: LATTITUDE_FORMAT, message: "value must be in the format of x.xxxx"}
	validates :longitude, format: { with: LONGITUDE_FORMAT, message: "value must be in the format of x.xxxx"}

end
