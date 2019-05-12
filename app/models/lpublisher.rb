class Lpublisher < ApplicationRecord
	#scope ​:primi_n_record​, ->( minimo, massimo) { where( ​'id GT 1 AND id LT 4' ) }
	#scope :primi_n_record, ->(minimo, massimo) { where('id > 1 and id < 4') }
	#scope :primi_n_record, ->(minimo, massimo) { where('id > ? and id < ?'), minimo, massimo }
	#scope :primi_n_record, -> {}
	scope :ssqq, ->(limite) {where("id > 1").limit(limite)}

  # 26-28 giugno 2017 - Samone;  ripreso il 13/03/2019 a Modena e attualizzato da Publisher per Lpublisher
  # questo scope ha un argomento di default fisso, la stringa '%at%'. In questo caso lo scope, adesempio applicato a Lpublisher
  # produce una clausola WHERE nella forma where LIKE '%at%', che non è significativa
  # naturalmente può essere chiamato passandogli una stringa significativa come argomento. In questo caso, nella ipotesi che
  # lo scope venga chiamato nella forma Lpublisher.likeat('editor'), si otterrà Lpublisher.where("Nome LIKE '%editor%'")
  # vecchio funzionante scope :likeat, ->(parametro='%at%') { where("Nome LIKE ?",parametro)}
  scope :likeat, ->(parametro='%at%') { where("Nome LIKE ?",parametro)}

  #modifiche da C9 il 19/04/2019
  scope :nome_likeat_mid, ->(parametro='%at%') { where("Nome LIKE ?",parametro)}
  scope :nome_likeat_fin, ->(parametro='%at') { where("Nome LIKE ?",parametro)}
  scope :nome_likeat_ini, ->(parametro='at%') { where("Nome LIKE ?",parametro)}
  #


  # Il seguente metodo di classe serve come base per una analisi del contenuto della tabella lpublishers
      TITOLO = "Numero di Record con Nome vuoto"
      def self.analisi1(numero)
        # definisce la struttura da restituire, un array di due hash di nome hashArray, ciascuno hash con 3 elementi
        # usa e restituisce solamente il primo hash
        hashArray = Array.new(2,Hash.new)
        hashArray[0]= {nome: TITOLO, quanti: 0, tuttiquanti: 0}
        hashArray[1]= {nome: 'quanti2', quanti: 0, tuttiquanti: 0}
        #
        mio_numero = numero
        tutti = Lpublisher.all()
        tuttiquanti = tutti.size
        mio_numero = tuttiquanti if mio_numero > tuttiquanti
        hashArray[0].merge!({tuttiquanti: mio_numero})   
        
           conta = 0
           occorrenze = 0
           tutti.each { |lp|
                 conta += 1 
                 str = lp.Nome.strip
                 occorrenze += 1 if (str.empty? || str.length == 0)
                 hashArray[0].merge!( { quanti: occorrenze} ) if conta <= mio_numero
                 return hashArray[0] if conta >= mio_numero
                 }  

      end  #fine metodo self.analisi1(numero)

end
