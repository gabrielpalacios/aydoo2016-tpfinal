require 'rspec'
require 'spec_helper'
require_relative '../model/dominio/nave'
require_relative '../model/dominio/asteroide'
require_relative '../model/dominio/estrella'
require_relative '../model/dominio/misil'
require_relative '../model/dominio/bomba'

describe 'Asteroide' do

  it 'setear vida y masa 100 a un asteroide y releer sus valores' do
    objeto = Asteroide.new
    objeto.vida = 100
    objeto.masa = 100
    valorEsperadoVidaYMasa = 100
    expect(objeto.vida).to eq valorEsperadoVidaYMasa
    expect(objeto.masa).to eq valorEsperadoVidaYMasa
  end

  it 'setear vida y masa 100 a un asteroide y releer sus valores usando constructor' do
    objeto = Asteroide.new
    valorEsperadoVidaYMasa = 100
    expect(objeto.vida).to eq valorEsperadoVidaYMasa
    expect(objeto.masa).to eq valorEsperadoVidaYMasa
  end

  it 'setear vida 0 a uun asteroidee y releer sus valores para saber q esta muerto' do
    objeto = Asteroide.new
    objeto.vida = 0
    valorEsperadoVidaYMasa = false
    expect(objeto.calcular_si_esta_vivo).to eq valorEsperadoVidaYMasa
  end

  it 'setear vida 200 a uun asteroidee y releer sus valores para saber q esta vivo' do
    objeto = Asteroide.new
    objeto.vida = 200
    valorEsperadoVidaYMasa = true
    expect(objeto.calcular_si_esta_vivo).to eq valorEsperadoVidaYMasa
  end

  it 'setear vida 50 y masa 0 a un Asteroide y releer sus valores para saber q esta muerto' do
    objeto = Asteroide.new
    objeto.vida = 50
    objeto.masa = 0
    valorEsperadoVidaYMasa = false
    expect(objeto.calcular_si_esta_vivo).to eq valorEsperadoVidaYMasa
  end


  it 'asteroide 1 no le pasa nada al chocar con asteroide 2' do
    asteroide1 = Asteroide.new
    asteroide2 = Asteroide.new

    asteroide1.chocar asteroide2

    expect(asteroide1.vida).to eq 100
  end

  it 'asteroide 2 tmb no le pasa nada al chocar con asteroide 1' do

    asteroide1 = Asteroide.new
    asteroide2 = Asteroide.new

    asteroide1.chocar asteroide2

    expect(asteroide2.vida).to eq 100
  end

  it 'asteroide 1 y 2 no pierden nada de vida ni masa mutuamente controlandolos' do

    asteroide1 = Asteroide.new
    asteroide2 = Asteroide.new

    asteroide1.chocar asteroide2

    expect(asteroide1.vida).to eq 100
    expect(asteroide2.vida).to eq 100
    expect(asteroide1.masa).to eq 100
    expect(asteroide2.masa).to eq 100
  end


  it 'asteroide Aumenta su masa en un valor igual al 10 porciento  de la masa del otro objeto al chocar con nave' do
    asteroide1 = Asteroide.new
    nave2 = Nave.new

    asteroide1.chocar nave2

    expect(asteroide1.masa).to eq 110
  end

  it 'nave Disminuye su masa en un valor igual al 50 porciento de la masa del asteroide' do
    asteroide1 = Asteroide.new
    nave2 = Nave.new

    nave = nave2.clone
    asteroide = asteroide1.clone

    asteroide1.chocar nave2
    nave.chocar asteroide

    expect(nave.masa).to eq 50
  end

  #tests mas completos, como casos reales

  it 'Asteroides 1 y 2 de 300 vida y 100 masa no le pasan nada tras choque' do

    asteroide1 = Asteroide.new
    asteroide2 = Asteroide.new

    asteroide1.chocar asteroide2

    expect(asteroide1.vida).to eq 100
    expect(asteroide1.masa).to eq 100
    expect(asteroide2.vida).to eq 100
    expect(asteroide2.masa).to eq 100
  end

  it 'Asteroide no pierde nada al chocr con misil y misil tampoco sufre ningun danao' do

    asteroide1 = Asteroide.new
    misil2 = Misil.new

    asteroide1.chocar misil2

    expect(asteroide1.vida).to eq 100
    expect(asteroide1.masa).to eq 100
    expect(misil2.vida).to eq 100
    expect(misil2.masa).to eq 100
  end

  it 'choca asteroide con nave, el asteroide Aumenta su masa en un valor igual al 10 porciento de la nave y la nave baja 50 porciento de masa respecto a asteroide' do

    asteroide1 = Asteroide.new
    nave = Nave.new

    asteroide1.chocar nave

    expect(asteroide1.vida).to eq 100
    expect(asteroide1.masa).to eq 110
    expect(nave.vida).to eq 100
    expect(nave.masa).to eq 50
  end

  it 'choca asteroide con estrella, al asteroide no le pasa nada y la estrella baja a 0 de vida' do

    asteroide1 = Asteroide.new
    estrella = Estrella.new

    asteroide1.chocar estrella

    expect(asteroide1.vida).to eq 100
    expect(asteroide1.masa).to eq 100
    expect(estrella.vida).to eq 0
    expect(estrella.masa).to eq 100
  end

  it 'choca asteroide con bomba, la asteroide no le pasa nada y la estrella baja a 0 de vida' do

    asteroide1 = Asteroide.new
    bomba = Bomba.new

    asteroide1.chocar bomba

    expect(asteroide1.vida).to eq 100
    expect(asteroide1.masa).to eq 100
    expect(bomba.vida).to eq 0
    expect(bomba.masa).to eq 100
  end

  it 'choca asteroide con bomba, el asteroide tiene 0 de vida al momento del choque y deberia lanzar la excepcion de objeto espacial muerto' do

    asteroide1 = Asteroide.new
    bomba = Bomba.new
    asteroide1.vida = 0

    expect { asteroide1.chocar bomba}.to raise_error(ElementoDelEspacioMuertoError)
  end

  it 'deberia lanzar excepcion por asignar vida negativa a asteroide' do

    asteroide1 = Asteroide.new
    expect { asteroide1.vida = -1}.to raise_error(ElementoDelEspacioVidaNegativaError)
  end

  it 'deberia lanzar excepcion por asignar masa negativa a asteroide' do

    asteroide1 = Asteroide.new
    expect { asteroide1.masa = -1}.to raise_error(ElementoDelEspacioMasaNegativaError)
  end

  it 'deberia agregarse un nuevo sexto elemento y efecto a las situaciones posibles' do

    asteroide = Asteroide.new()
    asteroide.agregar_elemento_espacial_junto_a_efecto_posible('Supernova', EfectoVidaDestructivo.new(10))

    cantidad_situacion_de_choques_obtenidos = asteroide.situacion_de_choque.length
    expect(cantidad_situacion_de_choques_obtenidos).to eq 6
  end

  it 'deberia eliminarse el elemento nave de las situaciones posibles, quedando 4' do

    asteroide = Asteroide.new()
    asteroide.eliminar_elemento_espacial_junto_a_efecto_posible('Nave')

    cantidad_situacion_de_choques_obtenidos = asteroide.situacion_de_choque.length
    expect(cantidad_situacion_de_choques_obtenidos).to eq 4
  end

end
