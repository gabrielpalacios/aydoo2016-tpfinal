require 'rspec'
require 'spec_helper'
require_relative '../model/dominio/nave'
require_relative '../model/dominio/asteroide'
require_relative '../model/dominio/estrella'
require_relative '../model/dominio/misil'
require_relative '../model/dominio/bomba'

describe 'Estrella' do

  it 'setear vida y masa 100 a una Estrella y releer sus valores' do
    objeto = Estrella.new
    objeto.vida = 100
    objeto.masa = 100
    valorEsperadoVidaYMasa = 100
    expect(objeto.vida).to eq valorEsperadoVidaYMasa
    expect(objeto.masa).to eq valorEsperadoVidaYMasa
  end

  it 'setear vida y masa 100 a una Estrella y releer sus valores usando constructor' do
    objeto = Estrella.new
    valorEsperadoVidaYMasa = 100
    expect(objeto.vida).to eq valorEsperadoVidaYMasa
    expect(objeto.masa).to eq valorEsperadoVidaYMasa
  end

  it 'setear vida 0 a una Estrella y releer sus valores para saber q esta muerta' do
    objeto = Estrella.new
    objeto.vida = 0
    valorEsperadoVidaYMasa = false
    expect(objeto.calcular_si_esta_vivo).to eq valorEsperadoVidaYMasa
  end

  it 'setear vida 200 a una Estrella y releer sus valores para saber q esta viva' do
    objeto = Estrella.new
    objeto.vida = 200
    valorEsperadoVidaYMasa = true
    expect(objeto.calcular_si_esta_vivo).to eq valorEsperadoVidaYMasa
  end

  it 'setear vida 50 y masa 0 a una Estrella y releer sus valores para saber q esta muerta' do
    objeto = Estrella.new
    objeto.vida = 50
    objeto.masa = 0
    valorEsperadoVidaYMasa = false
    expect(objeto.calcular_si_esta_vivo).to eq valorEsperadoVidaYMasa
  end

  it 'Estrella 1 pierde 100 de vida al chocar con Estrella 2' do
    estrella1 = Estrella.new
    estrella2 = Estrella.new

    estrella1.chocar estrella2

    expect(estrella1.vida).to eq 0
  end

  it 'Estrella 2 tmb pierde 100 de vida al chocar con Estrella 1' do

    estrella1 = Estrella.new
    #puts estrella1.class.name # devuelve 'Estrella'
    estrella2 = Estrella.new
    estrella1.chocar estrella2
    expect(estrella2.vida).to eq 0
  end

  it 'Estrellas 1 y 2 tmb pierde 100 de vida mutuamente controlando ambas vidas' do

    estrella1 = Estrella.new
    estrella2 = Estrella.new
    estrella1.chocar estrella2
    expect(estrella1.vida).to eq 0
    expect(estrella2.vida).to eq 0
  end

  it 'Estrellas 1 y 2 pierden 100 de vida mutuamente controlando ambas vidas y masas' do

    estrella1 = Estrella.new
    estrella2 = Estrella.new
    estrella1.chocar estrella2
    expect(estrella1.vida).to eq 0
    expect(estrella2.vida).to eq 0
    expect(estrella1.masa).to eq 100
    expect(estrella2.masa).to eq 100
  end

  it 'Estrella no le pasa nada al chocar con misil' do

    estrella1 = Estrella.new
    misil2 = Misil.new
    estrella1.chocar misil2

    expect(estrella1.vida).to eq 100
    expect(estrella1.masa).to eq 100
  end

  #tests mas completos, como casos reales

  it 'Estrellas 1 y 2 de 300 de vida pierden toda su vida simultaneamente' do

    estrella1 = Estrella.new
    estrella1.vida = 300
    estrella2 = Estrella.new
    estrella2.vida = 300

    estrella1.chocar estrella2

    expect(estrella1.vida).to eq 0
    expect(estrella1.masa).to eq 100
    expect(estrella2.vida).to eq 0
    expect(estrella2.masa).to eq 100
  end

  it 'Estrella no le pasa nada al chocar con misil y misil tampoco sufre ningun dano' do

    estrella1 = Estrella.new
    misil2 = Misil.new

    estrella1.chocar misil2

    expect(estrella1.vida).to eq 100
    expect(estrella1.masa).to eq 100
    expect(misil2.vida).to eq 100
    expect(misil2.masa).to eq 100
  end

  it 'choca estrella con asteroide, la estrella queda en 0 vida y el asteroide sale ileso' do

    estrella1 = Estrella.new
    asteroide2 = Asteroide.new

    estrella1.chocar asteroide2

    expect(estrella1.vida).to eq 0
    expect(estrella1.masa).to eq 100
    expect(asteroide2.vida).to eq 100
    expect(asteroide2.masa).to eq 100
  end

  it 'choca estrella con nave, la estrella baja a 0 de vida y la nave suma toda la vida de la estrella' do

    estrella1 = Estrella.new
    nave = Nave.new

    estrella1.chocar nave

    expect(estrella1.vida).to eq 0
    expect(estrella1.masa).to eq 100
    expect(nave.vida).to eq 200
    expect(nave.masa).to eq 100
  end

  it 'choca estrella con bomba, la estrella baja a 0 de vida y la bomba baja 100 de vida' do

    estrella1 = Estrella.new
    bomba = Bomba.new

    estrella1.chocar bomba

    expect(estrella1.vida).to eq 0
    expect(estrella1.masa).to eq 100
    expect(bomba.vida).to eq 0
    expect(bomba.masa).to eq 100
  end

  it 'choca estrella con bomba de 300 de vida, la estrella baja a 0 de vida y la bomba baja 100 de vida' do

    estrella1 = Estrella.new
    bomba = Bomba.new
    bomba.vida = 300

    estrella1.chocar bomba

    expect(estrella1.vida).to eq 0
    expect(estrella1.masa).to eq 100
    expect(bomba.vida).to eq 200
    expect(bomba.masa).to eq 100
  end

  it 'choca estrella con asteroide, la estrella tiene 0 de vida al momento del choque y deberia lanzar la excepcion de objeto espacial muerto' do

    estrella = Estrella.new
    estrella.vida = 0
    asteroide1 = Asteroide.new
    expect { estrella.chocar asteroide1}.to raise_error(ElementoDelEspacioMuertoError)
  end

  it 'deberia lanzar excepcion por asignar vida negativa a estrella' do

    estrella = Estrella.new
    expect { estrella.vida = -1}.to raise_error(ElementoDelEspacioVidaNegativaError)
  end

  it 'deberia lanzar excepcion por asignar masa negativa a estrella' do

    estrella = Estrella.new
    expect { estrella.masa = -1}.to raise_error(ElementoDelEspacioMasaNegativaError)
  end

  it 'deberia agregarse un nuevo sexto elemento y efecto en estrella a las situaciones posibles' do

    estrella = Estrella.new
    estrella.agregar_elemento_espacial_junto_a_efecto_posible('Supernova', EfectoVidaDestructivo.new(10))

    cantidad_situacion_de_choques_obtenidos = estrella.situacion_de_choque.length
    expect(cantidad_situacion_de_choques_obtenidos).to eq 6
  end

  it 'deberia eliminarse el elemento nave de las situaciones posibles, quedando 4 situaciones en estrella' do

    estrella = Estrella.new
    estrella.eliminar_elemento_espacial_junto_a_efecto_posible('Nave')

    cantidad_situacion_de_choques_obtenidos = estrella.situacion_de_choque.length
    expect(cantidad_situacion_de_choques_obtenidos).to eq 4
  end
end
