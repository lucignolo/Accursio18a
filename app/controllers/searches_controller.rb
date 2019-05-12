class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy, :eseguiRicerca
  ]
    layout "special_layout"

  # GET /searches
  # GET /searches.json
  def index
    @searches = Search.all
    # prova Ajax 31/03/2019
    @search = Search.new
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
    @mia_tabella = Search.mia_tabella(@search.tabella)
    @mio_campo   = Search.mio_campo(@search.campo)
    @mio_tipo    = Search.mio_tipo(@search.tipo)
    #
    @descrizione = @search.descrivi()
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

    respond_to do |format|
      if @search.save
        format.html { redirect_to @search, notice: 'Search was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @search }
      else
        format.html { render :new }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def createprova1
    @search = Search.first
    respond_to do |format|
           format.html { redirect_to @search, notice: 'Da creapteprova1 ok.' }
           format.js
           format.json { render :show, status: :created, location: @search }
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
  
  def eseguiRicerca
    @search = Search.find(params[:id]) 
    # qui chiamiamo un metodo della classe Search, che restituisce una stringa codificata
    # del tipo TCtAAA, con T=tabella; C=campo; t=tipo; AAA=argomento
    @codice = @search.tabella.to_s+@search.campo.to_s+@search.tipo.to_s+@search.argomento
    # selezione della struttura della ricerca
    case
       when @codice[0,3] == '122'
         @comando0 = {tabella: 'lpublishers', campo: 'Nome', tipo: 'LIKEmez', argomento: @codice[3,] }
         # esegue la query:
            mioPara = @search.argomento
            mioPara2 = "%"+mioPara+"%"
            @lpubs = Lpublisher.nome_likeat_mid("#{mioPara2}")  
            @risultati = @lpubs.size
       #end
       
       when @codice[0,3] == '123'
         @comando0 = {tabella: 'lpublishers', campo: 'Nome', tipo: 'LIKEini', argomento: @codice[3,] }
         # esegue la query:
            mioPara = @search.argomento
            mioPara2 = mioPara+"%"
            @lpubs = Lpublisher.nome_likeat_ini("#{mioPara2}")  
            @risultati = @lpubs.size
            
       when @codice[0,3] == "124"      
         @comando0 = {tabella: 'lpublishers', campo: 'Nome', tipo: 'LIKEfin', argomento: @codice[3,] }
         # esegue la query:
            mioPara = @search.argomento
            mioPara2 = "%"+mioPara
            @lpubs = Lpublisher.nome_likeat_fin("#{mioPara2}")  
            @risultati = @lpubs.size       
       #end
       #
       else
         @comando0 ={}
     end
     # qui abbiamo tutto per impostare la ricerca in tutti i casi

     
  end  #eseguiRicerca


     
     
     
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.require(:search).permit(:tabella, :campo, :argomento, :data, :occorrenze, :tipo)
    end
end
