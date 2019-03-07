class LpublishersController < ApplicationController
	def index()
		#@lpub2 = Lpublisher.find(2)
		#@lpub50 = Lpublisher.find(50)
		#---@lpubs = Lpublisher.primi_n_record(1,4)
		@lpubs = Lpublisher.ssqq(5)
	end

private

    def lpublisher_params
      params.require(:lpublisher).permit(:ID_EDITORE, :Nome)
    end 

end
