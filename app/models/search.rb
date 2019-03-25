class Search < ApplicationRecord
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

end
