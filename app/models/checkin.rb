class Checkin < ActiveRecord::Base
	LATTITUDE_FORMAT = /\d{1,2}\.\d{4}/
	LONGITUDE_FORMAT = /\d{1,3}\.\d{4}/

	N_S_FORMAT = /[nN,sS]/
	E_W_FORMAT = /[eE,wW]/	

	validates :lattitude, format: { with: LATTITUDE_FORMAT, message: "value must be in the format of x.xxxx" }, presence: true
	validates :longitude, format: { with: LONGITUDE_FORMAT, message: "value must be in the format of x.xxxx" }, presence: true
	validates :hemi_n_s, format: { with: N_S_FORMAT, message: "value must be either n or s" }, presence: true
	validates :hemi_e_w, format: { with: E_W_FORMAT, message: "value must be either e or w" }, presence: true
	validates :user_id, presence: true

	before_save :downcase_e_w, :downcase_n_s

	def downcase_e_w
		self.hemi_e_w.downcase!
	end

	def downcase_n_s
		self.hemi_n_s.downcase!
	end
end
