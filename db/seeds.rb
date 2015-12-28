# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Program.count == 0
  Program.create([
     { name: "DOCTORADO EN FILOSOFÍA CON MENCIÓN EN ESTÉTICA Y TEORÍA DEL ARTE", code: "001" },
     { name: "MAGÍSTER EN ARTES CON MENCIÓN EN ARTES VISUALES", code: "006" },
     { name: "MAGÍSTER EN ARTES CON MENCIÓN EN COMPOSICIÓN MUSICAL", code: "002" },
     { name: "MAGÍSTER EN ARTES CON MENCIÓN EN DIRECCIÓN TEATRAL", code: "005" },
     { name: "MAGÍSTER EN ARTES CON MENCIÓN EN MUSICOLOGÍA", code: "003" },
     { name: "MAGÍSTER EN ARTES CON MENCIÓN EN TEORÍA E HISTORIA DE LAS ARTES", code: "004" },
     { name: "MAGÍSTER EN ARTES MEDIALES", code: "050" },
     { name: "MAGÍSTER EN GESTIÓN CULTURAL", code: "049" },
     { name: "CURSO DE ESPECIALIZACIÓN DE POSTÍTULO EN COMPOSICIÓN MUSICAL", code: "035" },
     { name: "CURSO DE ESPECIALIZACIÓN DE POSTÍTULO EN MÚSICA ELECTRÓNICA", code: "036" },
     { name: "CURSO DE ESPECIALIZACIÓN DE POSTÍTULO EN RESTAURACIÓN DEL PATRIMONIO CULTURAL MUEBLE", code: "014" },
     { name: "CURSO DE ESPECIALIZACIÓN DE POSTÍTULO EN TERAPIAS DE ARTE MENCIÓN ARTE TERAPIA", code: "022" },
     { name: "CURSO DE ESPECIALIZACIÓN DE POSTÍTULO EN TERAPIAS DE ARTE MENCIÓN MUSICOTERAPIA", code: "011" },
     { name: "DIPLOMA DE POSTÍTULO EN ARTE SONORO", code: "062" },
     { name: "DIPLOMA DE POSTÍTULO EN FUNDAMENTOS Y PRÁCTICAS DE LA DRAMATERAPIA", code: "032" },
     { name: "DIPLOMA DE POSTÍTULO EN GESTIÓN CULTURAL - PUERTO MONTT", code: "065" },
     { name: "DIPLOMA DE POSTÍTULO EN PRODUCCIÓN GRÁFICA, VIDEO Y FOTOGRAFÍA", code: "044" },
     { name: "DIPLOMA DE POSTÍTULO EN SEMIÓTICA DEL ARTE Y LA CULTURA", code: "040" },
     { name: "DIPLOMA DE EXTENSIÓN VIRTUAL EN GESTIÓN CULTURAL", code: "034" },
     { name: "DIPLOMA DE EXTENSIÓN EN GESTIÓN CULTURAL ARICA Y PARINACOTA", code: "061" },
     { name: "DIPLOMA DE EXTENSIÓN EN TERAPIAS DE ARTE MENCIÓN ARTE TERAPIA - PUERTO MONTT", code: "064" }
  ])
end

if FindOut.count == 0
  FindOut.create([
    { name: "BUSCADOR WEB" },
    { name: "CORREO ELECTRÓNICO" },
    { name: "FOLLETO" },
    { name: "LUNETAS DE BUSES" },
    { name: "PANTALLAS LED" },
    { name: "PRENSA ESCRITA" },
    { name: "RADIO" },
    { name: "REFERIDO" },
    { name: "OTRA (ESPECIFIQUE)" }
  ])
end

if Financing.count == 0
  Financing.create([
    { name: "BECAS CHILE / CONICYT" },
    { name: "BECAS FONDART" },
    { name: "BECAS MECESUP / FONDECYT" },
    { name: "BECAS + RECURSOS PROPIOS" },
    { name: "RECURSOS PROPIOS" },
    { name: "OTRO (ESPECIFIQUE)" }
  ])
end

if User.count == 0
  admin = User.create(username: "Admin", email: "admin@postulaciones.uchile.cl", password: "12345678", password_confirmation: "12345678")
  admin.add_role :admin
  
  acceso = User.create(username: "Acceso", email: "acceso@postulaciones.uchile.cl", password: "12345678", password_confirmation: "12345678")
  acceso.add_role :acceso
  
  descarga = User.create(username: "Descarga", email: "descarga@postulaciones.uchile.cl", password: "12345678", password_confirmation: "12345678")
  descarga.add_role :descarga
end