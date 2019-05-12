class Search < ApplicationRecord
    SELOPTIONS = [['Standard', 1],['LIKEmez', 2],
                                  ['LIKEini', 3], ['LIKEfin', 4],
                                  ['perDATA',5]]
    SEL_OPTIONS_TABELLE = [['lpublishers',1],['publishers',2],['lbooks',3],['books',4]]
    SEL_OPTIONS_CAMPI = [['ID_EDITORE',1],['Nome',2]]
    def self.prendiPrimo(costante,numero)
      ritorno = nil
      costante.each do |c|
         ritorno = c.first if c.last == numero
      end
      return ritorno
    end #prendiPrimobin/rails 
    
    def self.mia_tabella(noptionValue)
         "  [ "+Search.prendiPrimo(Search::SEL_OPTIONS_TABELLE, noptionValue)+" (#{noptionValue}) ]"
    end #miaTabella(noptionValue)

    def self.mio_campo(noptionValue)
         "  [ "+Search.prendiPrimo(Search::SEL_OPTIONS_CAMPI, noptionValue)+" (#{noptionValue}) ]"
    end #miocampo(noptionValue)

    def self.mio_tipo(noptionValue)
         "  [ "+Search.prendiPrimo(Search::SELOPTIONS, noptionValue)+" (#{noptionValue}) ]"
    end #miotipo(noptionValue)
    
    def descrivi()
       it=self.tabella
       t=Search.mia_tabella(it)
       ic=self.campo
       c=Search.mio_campo(ic)
       kt=self.tipo
       tipo=Search.mio_tipo(kt)
       #
       desc="Questa ricerca riguarda il campo #{c} della tabella #{t}."
       desc+="Essa è del tipo #{tipo} e cercherà la parola: "+ self.argomento 
       return desc
    end #def descrivi() 

  #======================================================================================
  def analArg()
       pattern = /^(.+)(ii|qq|ff)$/i
       match=pattern.match(self.argomento)
      if match
       mioh = { nome: match[1], para: match[2] }
      else
       mioh = { nome: self.argomento, para: nil }
      end
    end

    def assegnaSuffisso(suffisso)
       status = self.analArg()  
       if status[:para]   # suffisso già presente, lo cambiamo
          nuovo_argomento = status[:nome] + suffisso
          self.argomento = nuovo_argomento 
       else               # argomento senza suffisso, glielo assegniamo
          nuovo_argomento = status[:nome] + suffisso
          self.argomento = nuovo_argomento 
       end  
       #
       self.save

    end #def assegnaSuffisso(suffisso)
  #======================================================================================
    

       
end

