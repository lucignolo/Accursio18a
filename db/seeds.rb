# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Users
def fai_users()
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end
end #def fai_users()

# Microposts
def fai_microposts()
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
end #def fai_microposts()





# inventories
def fai_inventories()
ri = [
"=00 righe totali presenti nell'Inventario: 6098.",
"=01 Libreria Accursio - Inventario 2016 - nessuna correzione per codici IVA - ugoPROVEClassi91.rb",
"=02 .Elaborazione del 19 11 2018 alle 04:53pm",
"=04 Blocco Editori che hanno per iniziale la lettera",
"=11 A",
"=12 ( contiene 97 Editori )",
"=07 Editore: A & A.",
"=05     3007  L' Oceano Pacifico a remi                  10.28    1     10.28     10.28   0  e1992  m2016  88-85279-08-2",
"=09 Totali per l'editore: A & A. nLibri: 1, nCopie: 1, prTCI:    10.28, prTSI:    10.28 .",
"=07 Editore: A Sàm Màt editore.",
"=05    13103  Facciamo un giro?....del mondo via         13.00    5     65.00     65.00   0  e2017  m2017  9791220025447",
"=06           terra e mare",                          
"=09 Totali per l'editore: A Sàm Màt editore. nLibri: 1, nCopie: 5, prTCI:    65.00, prTSI:    65.00 .",
"=07 Editore: ADV.",
"=05    12002  Grande guerra il popolo russo in           10.00    1     10.00     10.00   0  e2014  m2015  9788879221139",
"=06           guerra  -  ADV",                         
"=09 Totali per l'editore: ADV. nLibri: 1, nCopie: 1, prTCI:    10.00, prTSI:    10.00 .",
"=07 Editore: AR.CO.",
"=05     2962  Arte navale                                 7.75    1      7.75      7.75   0  e2001  m2011  no isbn",
"=09 Totali per l'editore: AR.CO. nLibri: 1, nCopie: 1, prTCI:     7.75, prTSI:     7.75 .",
"=07 Editore: Adam Editions.",
"=05     1493  Lesbo  -  Adam                              6.20    1      6.20      6.20   0  e?...  m2003  960-500-049-0",
"=05     1495  Naxos tasc.  -   Adam                       7.00    1      7.00      7.00   0  e?...  m2007  960-500-054-7",
"=05     1516  Argosaronico  -  Adam                       8.78    1      8.78      8.78   0  e?...  m2003  960-500-174-8",
"=05     3321  Santorini  -  Adam                          9.30    1      9.30      9.30   0  e?...  m2006  960-500-142-X",
"=05     3328  Corfù  -  Adam                              6.20    1      6.20      6.20   0  e?...  m2003  960-500-037-7",
"=05     4646  Tutte le isole Greche  -  Adam             18.00    1     18.00     18.00   0  e?...  m2008  960-500-162-2",
"=09 Totali per l'editore: Adam Editions. nLibri: 6, nCopie: 6, prTCI:    55.48, prTSI:    55.48 ."
]
#1-------10:2------20:2------30:2------40:2------50:2------60:2------70:2------80:2------90:2-----100:2-----110:2-----129
#123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
#=05    13103  Facciamo un giro?....del mondo via         13.00    5     65.00     65.00   0  e2017  m2017  9791220025447
#=06           terra e mare                            

ri.each do |rr|
	Inventory.create!(tipo: rr[1,2],
	seq:  rr[3,1],
	riga: rr[4,125],
	ideditore: 1,
	idlibro: rr[7,5],
	)
end

end # fai_inventories()


# lpublishers  versione del 11/02/2019

def fai_lpublishers()
#Lpublisher.deleteall	
    
mieiDati="Editori2018-CSVUTF8virgole.csv"

   conta = 1 
   File.new(mieiDati, "r").each_line{|line|
      rr=line.chop
      questoRecord = rr.split(';',4)
      creaRecordInDb(questoRecord, true)
      conta += 1
      #exit if conta > MAX_CONTA
   }
   puts "Dati da file: #{mieiDati}. Records trattati: #{conta-1}."
   
end #def fai_lpublishers

def creaRecordInDb(questoR, eseguire=false)

   if eseguire
   Lpublisher.create!(
      ID_EDITORE: questoR[ATT_IDEDITORE],
      Nome: questoR[ATT_Nome],
      )
      #puts " ID_EDITORE: #{questoR[ATT_IDEDITORE]}, Nome: #{questoR[ATT_Nome]}"
   else
      #puts 'non esegue'
   end

end #creaRecordInDb


# esecuzione predisposta a blocchi il 11/02/2019
#fai_users()
#fai_microposts()
#fai_inventories()

MAX_CONTA = 5
ATT_IDEDITORE = 0
ATT_Nome = 1
fai_lpublishers()

