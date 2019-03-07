class Lpublisher < ApplicationRecord
	#scope ​:primi_n_record​, ->( minimo, massimo) { where( ​'id GT 1 AND id LT 4' ) }
	#scope :primi_n_record, ->(minimo, massimo) { where('id > 1 and id < 4') }
	#scope :primi_n_record, ->(minimo, massimo) { where('id > ? and id < ?'), minimo, massimo }
	#scope :primi_n_record, -> {}
	scope :ssqq, ->(limite) {where("id > 1").limit(limite)}

end
