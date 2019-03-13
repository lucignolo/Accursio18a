class LpublishersController < ApplicationController
	def index()
		mio_hash = Lpublisher.analisi1(1300)
		@info1 = "#{mio_hash[:nome]}: #{mio_hash[:quanti]}. Sul totale di: #{mio_hash[:tuttiquanti]} record in tabella."
		@lpubs = Lpublisher.ssqq(5)
	end

private

    def lpublisher_params
      params.require(:lpublisher).permit(:ID_EDITORE, :Nome)
    end 

end
