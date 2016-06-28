require 'rspec'
require 'spec_helper'
require_relative '../model/nave'
require_relative '../model/asteroide'
require_relative '../model/bomba'
require_relative '../model/misil'
require_relative '../model/estrella'


describe 'Bomba' do

  it 'setear vida y masa 100 a una Bomba y releer sus valores' do
    objeto = Bomba.new
    objeto.vida = 100
    objeto.masa = 100
    valorEsperadoVidaYMasa = 100
    expect(objeto.vida).to eq valorEsperadoVidaYMasa
    expect(objeto.masa).to eq valorEsperadoVidaYMasa
  end

  it 'setear vida y masa 100 a una Bomba y releer sus valores usando constructor' do
    objeto = Bomba.new
    valorEsperadoVidaYMasa = 100
    expect(objeto.vida).to eq valorEsperadoVidaYMasa
    expect(objeto.masa).to eq valorEsperadoVidaYMasa
  end

  it 'setear vida 0 a una Bomba y releer sus valores para saber q esta muerta' do
    objeto = Bomba.new
    objeto.vida = 0
    valorEsperadoVidaYMasa = false
    expect(objeto.calcular_si_esta_vivo).to eq valorEsperadoVidaYMasa
  end

  it 'setear vida 200 a una Bomba y releer sus valores para saber q esta viva' do
    objeto = Bomba.new
    objeto.vida = 200
    valorEsperadoVidaYMasa = true
    expect(objeto.calcular_si_esta_vivo).to eq valorEsperadoVidaYMasa
  end

  it 'setear vida 50 y masa 0 a una Bomba y releer sus valores para saber q esta muerta' do
    objeto = Bomba.new
    objeto.vida = 50
    objeto.masa = 0
    valorEsperadoVidaYMasa = false
    expect(objeto.calcular_si_esta_vivo).to eq valorEsperadoVidaYMasa
  end


  it 'Bomba 1 pierde 100 de vida al chocar con Bomba 2' do
    bomba1 = Bomba.new
    bomba2 = Bomba.new

    bomba1.chocar bomba2

    expect(bomba1.vida).to eq 0
  end


  it 'Bomba 2 tmb pierde 100 de vida al chocar con Bomba 1' do

    bomba1 = Bomba.new
    #puts bomba1.class.name # devuelve 'Bomba'
    bomba2 = Bomba.new
    bomba1.chocar bomba2
    expect(bomba2.vida).to eq 0
  end


  it 'Bombas 1 y 2 tmb pierde 100 de vida mutuamente controlando ambas vidas' do

    bomba1 = Bomba.new
    bomba2 = Bomba.new
    bomba1.chocar bomba2
    expect(bomba1.vida).to eq 0
    expect(bomba2.vida).to eq 0
  end

  it 'Bombas 1 y 2 nuevas con 300 de vida pierden 100 de vida cada una mutuamente' do

    bomba1 = Bomba.new
    bomba1.vida = 300
    bomba2 = Bomba.new
    bomba2.vida = 300
    bomba1.chocar bomba2
    expect(bomba1.vida).to eq 200
    expect(bomba2.vida).to eq 200
  end




  it 'Bombas 1 y 2 de 300 pierden 100 de vida mutuamente controlando ambas vidas y masas' do

    bomba1 = Bomba.new
    bomba1.vida = 300
    bomba2 = Bomba.new
    bomba2.vida = 300
    bomba1.chocar bomba2
    expect(bomba1.vida).to eq 200
    expect(bomba2.vida).to eq 200

    expect(bomba1.masa).to eq 100
    expect(bomba2.masa).to eq 100
    end



  it 'Bomba pierde 50 porciento de vida al chocar con misil' do

    bomba1 = Bomba.new
    misil2 = Misil.new
    bomba1.chocar misil2

    expect(bomba1.vida).to eq 50
    expect(bomba1.masa).to eq 100
  end

  #tests mas completos, como casos reales

  it 'Bombas 1 y 2 de 300 pierden 100 de vida mutuamente' do

    bomba1 = Bomba.new
    bomba2 = Bomba.new
    bomba1Clon = bomba1.clone
    bomba2Clon = bomba2.clone

    bomba1.chocar bomba2
    bomba2Clon.chocar bomba1Clon


    expect(bomba1.vida).to eq 0
    expect(bomba1.masa).to eq 100
    expect(bomba2Clon.vida).to eq 0
    expect(bomba2Clon.masa).to eq 100
  end

  it 'Bomba pierde 50 porciento de vida al chocar con misil y misil no sufre ningun dano' do

    bomba1 = Bomba.new
    misil2 = Misil.new
    bomba1Clon = bomba1.clone
    misil2Clon = misil2.clone

    bomba1.chocar misil2
    misil2Clon.chocar bomba1Clon


    expect(bomba1.vida).to eq 50
    expect(bomba1.masa).to eq 100
    expect(misil2Clon.vida).to eq 100
    expect(misil2Clon.masa).to eq 100
  end


  it 'choca bomba con asteroide, la bomba queda en 0 vida y el asteroide sale ileso' do

    bomba1 = Bomba.new
    asteroide2 = Asteroide.new

    bomba1Clon = bomba1.clone
    asteroide2Clon = asteroide2.clone

    bomba1.chocar asteroide2
    asteroide2Clon.chocar bomba1Clon

    expect(bomba1.vida).to eq 0
    expect(bomba1.masa).to eq 100
    expect(asteroide2Clon.vida).to eq 100
    expect(asteroide2Clon.masa).to eq 100
  end

  it 'choca bomba con nave, la bomba baja 100 de vida y la nave baja 50 de vida' do

    bomba1 = Bomba.new
    nave = Nave.new

    bomba1Clon = bomba1.clone
    naveClon = nave.clone

    bomba1.chocar nave
    naveClon.chocar bomba1Clon

    expect(bomba1.vida).to eq 0
    expect(bomba1.masa).to eq 100
    expect(naveClon.vida).to eq 50
    expect(naveClon.masa).to eq 100
  end

  it 'choca bomba con estrella, la bomba baja 100 de vida y la estrella baja a 0 de vida' do

    bomba1 = Bomba.new
    estrella = Estrella.new

    bomba1Clon = bomba1.clone
    estrellaClon = estrella.clone

    bomba1.chocar estrella
    estrellaClon.chocar bomba1Clon

    expect(bomba1.vida).to eq 0
    expect(bomba1.masa).to eq 100
    expect(estrellaClon.vida).to eq 0
    expect(estrellaClon.masa).to eq 100
  end

  it 'choca bomba con asteroide, la bomba tiene 0 de vida al momento del choque y deberia lanzar la excepcion de objeto espacial muerto' do

    bomba = Bomba.new
    bomba.vida = 0
    asteroide1 = Asteroide.new
    expect { bomba.chocar asteroide1}.to raise_error(ElementoDelEspacioMuertoError)
  end

  it 'deberia lanzar excepcion por asignar vida negativa a bomba' do

    bomba = Bomba.new
    expect { bomba.vida = -1}.to raise_error(ElementoDelEspacioVidaNegativaError)
  end

  it 'deberia lanzar excepcion por asignar masa negativa a bomba' do

    bomba = Bomba.new
    expect { bomba.masa = -1}.to raise_error(ElementoDelEspacioMasaNegativaError)
  end

  it 'deberia agregarse un nuevo sexto elemento y efecto en bomba a las situaciones posibles' do

    bomba = Bomba.new
    bomba.agregar_elemento_espacial_y_efecto_posible('Supernova', EfectoVidaDestructivo.new(10))

    cantidad_situacion_de_choques_obtenidos = bomba.situacion_de_choque.length
    expect(cantidad_situacion_de_choques_obtenidos).to eq 6
  end

  it 'deberia eliminarse el elemento nave de las situaciones posibles, quedando 4 situaciones en bomba' do

    bomba = Bomba.new
    bomba.eliminar_elemento_espacial_y_efecto_posible('Nave')

    cantidad_situacion_de_choques_obtenidos = bomba.situacion_de_choque.length
    expect(cantidad_situacion_de_choques_obtenidos).to eq 4
  end

end

