require 'test1_helper'

class SearchesEsegui1elleTest < ActionDispatch::IntegrationTest

  def setup
    @utente = "prova utente"   #users(:michael)
    #@questaRicerca = searches(:sea21)
    @lpub = lpublishers(:two)
  end
  
   # called after every single test
  teardown do
    # when controller is using cache it may be a good idea to reset it afterwards
    Rails.cache.clear
  end

 
  test "modifica attributi di lpublisher esistente" do
    get edit_lpublisher_path(@lpub)
    assert_template 'lpublishers/edit'
    #log_in_as(@user)
    #assert_redirected_to edit_search_url(@questaRicerca)
    IDEDITORE  = 22
    nome = "Senza argomento in mezzo"
    patch lpublisher_path(@lpub), params: { lpublisher: { ID_EDITORE:  IDEDITORE,
                                                  Nome: nome} }
    assert_not flash.empty?
    assert_redirected_to @lpub
    @lpub.reload
    assert_equal IDEDITORE,  @lpub.ID_EDITORE
    assert_equal nome, @lpub.Nome    
    
  end #test
 
  
end #classs