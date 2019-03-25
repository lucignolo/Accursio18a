class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]
    layout "special_layout"

  # GET /searches
  # GET /searches.json
  def index
    @searches = Search.all
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
    # materiale ripreso dallo scorso anno in data 13/03/2019 a Modena
    # Accedo -da questo mondo del Search model- allo Lpublisher model
    @lpublishersTotali = "#{Lpublisher.all.count}"
    @lpublishersNonBidoni = 900  #@lpublishersTotali-5  #"#{Publisher.nonbidoni.count}"

    @search = Search.find(params[:id])
    # --- aggiungiamo un suffisso
    @search.assegnaSuffisso("qq")
    # --- riprendiamo
    @ricerca = "likeat"+@search.argomento

    # eseguiamo un filtraggio preliminare e calcoliamo il numero di elementi che lo soddisfano
    mio_suffisso  = @search.analArg()[:para]
    mio_argomento = @search.analArg()[:nome]
    case
      when mio_suffisso = nil
        mioPara2 = "%"+mio_argomento+"%"
        @ricerca = "likeat"+@search.argomento
      when mio_suffisso == "ii"  
        mioPara2 = mio_argomento+"%"
        @ricerca = "likeat"+mio_argomento
      when mio_suffisso == "qq"
        mioPara2 = "%"+mio_argomento+"%"
        @ricerca = "likeat"+@search.argomento
      when mio_suffisso == "ff"
        mioPara2 = "%"+mio_argomento
        @ricerca = "likeat"+mio_argomento
      else  
    end
    #mioPara2 = "%"+@search.argomento+"%"
    trovati = Lpublisher.likeat("#{mioPara2}")
    @numeroFiltrati = "#{trovati.count}"
  end

  # GET /searches/new
  def new
    @search = Search.new
  end

  # GET /searches/1/edit
  def edit
  end

  # POST /searches
  # POST /searches.json
  def create
    @search = Search.new(search_params)

    logger.debug "Nuova search: #{@search.attributes.inspect}"
    logger.debug "Search should be valid: #{@search.valid?}"


    respond_to do |format|
      if @search.save
        format.html { redirect_to @search, notice: 'Search was successfully created.' }
        format.json { render :show, status: :created, location: @search }
      else
        format.html { render :new }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /searches/1
  # PATCH/PUT /searches/1.json
  def update
    respond_to do |format|
      if @search.update(search_params)
        format.html { redirect_to @search, notice: 'Search was successfully updated.' }
        format.json { render :show, status: :ok, location: @search }
      else
        format.html { render :edit }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @search.destroy
    respond_to do |format|
      format.html { redirect_to searches_url, notice: 'Search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.require(:search).permit(:tabella, :campo, :argomento, :data, :occorrenze)
    end
end
