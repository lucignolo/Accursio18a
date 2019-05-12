require 'test1_helper'

class SearchesController2Test < ActionDispatch::IntegrationTest
  setup do
    @search = searches(:one)
  end

  test 'uso dati search per nomelikeatmid' do
    mio_argo = "edixo"
    argo2 = ""
    # parte 1: creo nuova search con argomento = mio_argo, estraggo argo2 dall'ultimo record in tabella
    assert_difference 'Search.count', 1 do
      post searches_path, params: { search: { tabella: 1, campo: 1, tipo: 2, 
                                              argomento: mio_argo} }
      @prova = Search.last   #search.argomento 
      argo2 = @prova.argomento
      assert_equal mio_argo, argo2
    end #assert_difference - do
    # parte 2: uso argo2 sia per calcolare argo_vero (argomento nome_likeat_mid), sia
    # per inserirlo nel campo Nome di un nuovo record in lpublishers
    argo_vero = "%"+argo2+"%"
    nome_con_argo = "prova "+argo2+" in mezzo"
    assert_difference 'Lpublisher.nome_likeat_mid(argo_vero).size', 1 do
      post lpublishers_path, params: { lpublisher: { ID_EDITORE: 12, Nome: nome_con_argo} }
    end # assert_difference - do
  end #test
  
  
end
