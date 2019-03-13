class Lpublisher < ApplicationRecord
	#scope ​:primi_n_record​, ->( minimo, massimo) { where( ​'id GT 1 AND id LT 4' ) }
	#scope :primi_n_record, ->(minimo, massimo) { where('id > 1 and id < 4') }
	#scope :primi_n_record, ->(minimo, massimo) { where('id > ? and id < ?'), minimo, massimo }
	#scope :primi_n_record, -> {}
	scope :ssqq, ->(limite) {where("id > 1").limit(limite)}

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

      end  #fine metodo s

end
