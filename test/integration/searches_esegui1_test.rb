require 'test1_helper'

class SearchesEsegui1Test < ActionDispatch::IntegrationTest

  def setup
    @utente = "prova utente"   #users(:michael)
    @questaRicerca = searches(:sea21)
  end

  test "esecuzione di una ricerca" do
  	log_bidone(@utente)
  	get "/searches/#{@questaRicerca.id}"
  	assert_template 'searches/show'
  	questo_argomento = "Argomento:#{@questaRicerca.argomento}"
  	assert_select 'h3', text: questo_argomento, count: 1
    #get eseric_path(21)
    #assert_template 'searches/eseguiRicerca'
    #assert_select "a[href=?]", root_path, count: 2
    #assert_select "a[href=?]", help_path
    #assert_select "a[href=?]", about_path
    #assert_select "a[href=?]", contact_path
  end
end