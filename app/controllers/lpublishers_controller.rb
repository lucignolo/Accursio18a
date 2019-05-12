class LpublishersController < ApplicationController
  before_action :set_lpublisher, only: [:show, :edit, :update, :destroy]

	def index() 
    mioHash = analizzaScope(params[:scope], /^(likeat)(.+)$/)
    mioNome = mioHash[:nome]
    mioPara = mioHash[:para] 
    #
    case mioNome
     when "nonbidoni"
       @lpubs = Lpublisher.limit(10)
     when "bidoni"
       @lpubs = Lpublisher.limit(10)

     when "likeat"
       mioPara2 = "%"+mioPara+"%"
       @lpubs = Lpublisher.likeat("#{mioPara2}")    #.page params[:page]
       #.order(:nome).paginate(page: params[:page], per_page: 5)
           #@products = Product.all.paginate(page: params[:page], per_page: 5)
       # prova 02/07 da StackOverfkow
       #@total_items = [@publishers].compact.flatten
       #Kaminari.paginate_array(@total_items).page(params[:page]).per(10)

       #@events = Event.likeat(mioPara'%kata%')   
    else
       mio_hash = Lpublisher.analisi1(1300)
       @info1 = "#{mio_hash[:nome]}: #{mio_hash[:quanti]}. Sul totale di: #{mio_hash[:tuttiquanti]} record in tabella."
       @lpubs = Lpublisher.ssqq(5) #@lpublishers = Publisher.bidoni.order(:nome).page params[:page]
    end      
	end

  def edit
    @lpublisher = Lpublisher.find(params[:id])    
  end #def edit

  def update
    respond_to do |format|
      if @lpublisher.update(lpublisher_params)
        format.html { redirect_to @lpublisher, notice: 'Lpublisher was successfully updated.' }
        format.json { render :show, status: :ok, location: @lpublisher }
      else
        format.html { render :edit }
        format.json { render json: @lpublisher.errors, status: :unprocessable_entity }
      end
    end        
  end #def update

  def show
        @lpublisher = Lpublisher.find(params[:id])
  end #def show

  # GET /ellepublishers/new
  def new
    @lpublisher = Lpublisher.new
  end

  # POST /ellepublishers
  # POST /ellepublishers.json
  def create
    @lpublisher = Lpublisher.new(lpublisher_params)

    respond_to do |format|
      if @lpublisher.save
        format.html { redirect_to @lpublisher, notice: 'Lpublisher was successfully created.' }
        format.json { render :show, status: :created, location: @lpublisher }
      else
        format.html { render :new }
        format.json { render json: @lpublisher.errors, status: :unprocessable_entity }
      end
    end
  end

  




private
    # Use callbacks to share common setup or constraints between actions.
    def set_lpublisher
      @lpublisher = Lpublisher.find(params[:id])
    end

    def lpublisher_params
      params.require(:lpublisher).permit(:ID_EDITORE, :Nome)
    end 

    def analizzaScope(stringa, pattern)
     match = pattern.match(stringa)
     if match
       mioh = { nome: match[1], para: match[2] }
     else
       mioh = { nome: stringa, para: nil }
     end
    end

end
