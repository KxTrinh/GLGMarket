# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require "open-uri"


puts 'Cleaning database...'
Post.destroy_all
User.destroy_all


puts 'creating user'
User.create!(email: 'kev@mail.com', password: '123456', name: 'Kev', last_name: 'TEST', age: 32, address: 'Paris')


puts 'creating posts'
post = Post.create!(
  title: 'Pantalon celio',
  content: "Bonjour,
  Je vends ce très joli pantalon taille M, et le noeud papillon assorti, servis tous les 2 une fois pour un mariage. Le pantalon s’adapte à tous les styles. 30 € le lot.",
  price: 30,
  user_id: User.first.id
)
file = URI.open("https://www.celio.com/medias/sys_master/productMedias/productMediasImport/hcc/hf7/10602137026590/pantalon-straight-5-poches-marine-marine-1124517-3-zoom.jpg")
post.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
file = URI.open("https://www.celio.com/medias/sys_master/productMedias/productMediasImport/hc0/h4a/10576525295646/pantalon-straight-5-poches-marine-marine-1124517-1-zoom.jpg")
post.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
file = URI.open("https://www.celio.com/medias/sys_master/productMedias/productMediasImport/h72/h69/10602175037470/pantalon-straight-5-poches-marine-marine-1124517-6-zoom.jpg")
post.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
post.save!

post = Post.create!(
  title: 'Chevrolet Impala SS 1967', 
  content: "L'Impala nous vient des Etats Unis, de l'état de Californie plus précisément. Son châssis est très sain ainsi que sa carrosserie. La peinture est de très belle facture, juste un petit accroc sur l'aile ARG. La sellerie est en excellent état ainsi que le pavillon de toit, pas de déchirure ni saleté. L'interieur est en tissu noir.

  Le moteur tourne très bien , ne chauffe pas et démarre au quart de tour. Pas de fuite de direction assistée mais nous ne garantissons pas le bon fonctionnement de la climatisation. Les pneus sont récents avec des lettrages blancs sur les flancs. L'allumage a été refait, les autres organes du moteur sont en bon état.
  
  La voiture sur la route est imposante et encombrante . Son freinage n'est pas son fort , il faudra avoir une conduite anticipée , de plus sur nos petites routes, la voiture est large. Il est dit que la pédale de frein , par sa largeur peut être poussée avec les 2 pieds en cas de freinage d'urgence.... ",
  price: 100_000,
  user_id: User.first.id
)
file = URI.open("https://absolutelycars.fr/wp-content/uploads/2021/02/1967-chevrolet-impala-3.jpg?w=1024")
post.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
file = URI.open("https://absolutelycars.fr/wp-content/uploads/2021/09/95b025f513bacd94fc4240b32fa5e4ae.jpg?w=749")
post.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
file = URI.open("https://carsguide-res.cloudinary.com/image/upload/f_auto,fl_lossy,q_auto,t_cg_hero_large/v1/editorial/story/hero_image/Supernatural-impala-1001x565p.jpg")
post.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
post.save!

post = Post.create!(
  title: 'Lit mezzanine 1 place blanc', 
  content: "Dimensions:
  Longueur 2M 
  Largeur 96 cm 
  
  Largeur couchage 90cm 
  Hauteur couchage à 150cm du sol 
  
  Échelle démontée mais présente 
  
  Quelques pignes légères
  A voir sur place 
  Peut être repeind à la couleur de votre choix 
  
  A récupérer sur muret 
  Pas de réservation 
  Paiement en espèce uniquement 
  
  Possibilité de vendre le matelas avec pour 50e 
  
  Lit seul : 80euros",
  price: 80,
  user_id: User.first.id
)
file = URI.open("https://img.leboncoin.fr/api/v1/lbcpb1/images/cd/24/56/cd2456993e8c02dbd5c78721d1febece12ff89a2.jpg?rule=ad-large")
post.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
file = URI.open("https://img.leboncoin.fr/api/v1/lbcpb1/images/c3/7d/53/c37d5305dbf04c6c05fef40896899e10fc2bf2de.jpg?rule=ad-large")
post.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
post.save!

puts 'finished'