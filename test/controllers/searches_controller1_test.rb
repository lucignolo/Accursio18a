require 'test_helper'

class SearchesController1Test < ActionDispatch::IntegrationTest
  setup do
    @search = searches(:two)
  end

  test "altra prova" do
    assert_generates eseric_path(1), 
      { controller: 'searches', action: 'eseguiRicerca', id: '1' }
  end

  test "contenuto pagina eseguiRicerca" do
    get eseric_path(2)
    assert_response :success 
    assert_select "h1", text: "Prova vista per eseguiRicerca"
    assert_select "p", text: "search_id: 2"
    assert_select "p", text: "search_tabella: 1"
    assert_select "p", text: "search_campo: 2"
    assert_select "p", text: "search_tipo: 2"
    assert_select "p", text: "search_argomento: editor"
    assert_select "p", text: "codice: 122editor"
  end 

  # ora andiamo all'indice delle ricerche e scegliamo una di esse
  test "show page search2" do
    get "/searches/2"
    assert_response :success
  end # test-do
   
end