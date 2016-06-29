require 'rspec'
require 'spec_helper'
require_relative '../model/dominio/nave'
require_relative '../model/dominio/asteroide'
require_relative '../model/dominio/estrella'
require_relative '../model/dominio/misil'
require_relative '../model/dominio/bomba'

describe 'Nave' do

  it 'setear vida y masa 100 a una nave y releer sus valores' do
    objeto = Nave.new
    objeto.vida = 100
    objeto.masa = 100
    valorEsperadoVidaYMasa = 100
    expect(objeto.vida).to eq valorEsperadoVidaYMasa
    expect(objeto.masa).to eq valorEsperadoVidaYMasa
  end

  it 'setear vida y masa 100 a una nave y releer sus valores usando constructor' do
    objeto = Nave.new
    valorEsperadoVidaYMasa = 100
    expect(objeto.vida).to eq valorEsperadoVidaYMasa
    expect(objeto.masa).to eq valorEsperadoVidaYMasa
  end

  it 'setear vida 0 a una nave y releer sus valores para saber q esta muerta' do
    objeto = Nave.new
    objeto.vida = 0
    valorEsperadoVidaYMasa = false
    expect(objeto.calcular_si_esta_vivo).to eq valorEsperadoVidaYMasa
  end

  it 'setear vida 200 a una Nave y releer sus valores para saber q esta viva' do
    objeto = Nave.new
    objeto.vida = 200
    valorEsperadoVidaYMasa = true
    expect(objeto.calcular_si_esta_vivo).to eq valorEsperadoVidaYMasa
  end

  it 'setear vida 50 y masa 0 a una Nave y releer sus valores para saber q esta muerta' do
    objeto = Nave.new
    objeto.vida = 50
    objeto.masa = 0
    valorEsperadoVidaYMasa = false
    expect(objeto.calcular_si_esta_vivo).to eq valorEsperadoVidaYMasa
  end

  it 'nave 1 pierde 100 de vida al chocar con nave 2' do
    nave1 = Nave.new
    nave2 = Nave.new

    nave1.chocar nave2

    expect(nave1.vida).to eq 0
  end

  it 'nave 2 tmb pierde 100 de vida al chocar con nave 1' do

    nave1 = Nave.new
    #puts nave1.class.name # devuelve 'Nave'
    nave2 = Nave.new
    nave1.chocar nave2
    expect(nave2.vida).to eq 0
  end

  it 'naves 1 y 2 tmb pierde 100 de vida mutuamente controlando ambas vidas' do

    nave1 = Nave.new
    nave2 = Nave.new
    nave1.chocar nave2
    expect(nave1.vida).to eq 0
    expect(nave2.vida).to eq 0
  end

  it 'naves 1 y 2 tmb pierde 100 de vida mutuamente controlando ambas vidas' do

    nave1 = Nave.new
    nave2 = Nave.new
    nave1.chocar nave2
    expect(nave1.vida).to eq 0
    expect(nave2.vida).to eq 0
  end

  it 'naves 1 y 2 pierden 100 de vida mutuamente controlando ambas vidas y masas' do

    nave1 = Nave.new
    nave2 = Nave.new
    nave1.chocar nave2
    expect(nave1.vida).to eq 0
    expect(nave2.vida).to eq 0
    expect(nave1.masa).to eq 100
    expect(nave2.masa).to eq 100
  end

  it 'nave Disminuye su masa en un valor igual al 50 porciento de la masa del asteroide' do

    nave1 = Nave.new
    asteroide2 = Asteroide.new
    nave1.chocar asteroide2

    expect(nave1.masa).to eq 50
  end

  it 'asteroide Aumenta su masa en un valor igual al 10 porciento  de la masa del otro objeto al chocar con nave' do

    nave1 = Nave.new
    asteroide2 = Asteroide.new

    nave1.chocar asteroide2

    expect(asteroide2.masa).to eq 110
  end

  it 'nave aumenta su vida a 200 porque gana la cantidad de vida de la estrella' do

    nave1 = Nave.new
    estrella2 = Estrella.new
    nave1.chocar estrella2

    expect(nave1.vida).to eq 200
  end

  #tests mas completos, como casos reales

it 'Naves 1 y 2 de 100 de vida pierden 100 de vida mutuamente' do

    nave1 = Nave.new
    nave2 = Nave.new

    nave1.chocar nave2
 
    expect(nave1.vida).to eq 0
    expect(nave1.masa).to eq 100
    expect(nave2.vida).to eq 0
    expect(nave2.masa).to eq 100
  end

 it 'Nave pierde 50 de vida al chocar con bomba y bomba pierde 100 de vida' do

    nave1 = Nave.new
    bomba2 = Bomba.new

    nave1.chocar bomba2

    expect(nave1.vida).to eq 50
    expect(nave1.masa).to eq 100
    expect(bomba2.vida).to eq 0
    expect(bomba2.masa).to eq 100
  end

  it 'Nave pierde 80 de vida al chocar con misil y misil pierde 100 de vida' do

    nave1 = Nave.new
    misil2 = Misil.new

    nave1.chocar misil2

    expect(nave1.vida).to eq 20
    expect(nave1.masa).to eq 100
    expect(misil2.vida).to eq 0
    expect(misil2.masa).to eq 100
  end

  it 'choca nave con asteroide, la nave queda en 100 vida y 50 masa y el asteroide gana 10 porciento de masa' do

    nave1 = Nave.new
    asteroide2 = Asteroide.new

    nave1.chocar asteroide2

    expect(nave1.vida).to eq 100
    expect(nave1.masa).to eq 50
    expect(asteroide2.vida).to eq 100
    expect(asteroide2.masa).to eq 110
  end

  it 'choca nave con estrella, la nave sube 100 de vida y la estrella baja a 0 de vida' do

    nave1 = Nave.new
    estrella = Estrella.new

    nave1.chocar estrella

    expect(nave1.vida).to eq 200
    expect(nave1.masa).to eq 100
    expect(estrella.vida).to eq 0
    expect(estrella.masa).to eq 100
  end

  it 'choca nave con asteroide, la nave tiene 0 de vida al momento del choque y deberia lanzar la excepcion de objeto espacial muerto' do

    nave = Nave.new
    nave.vida = 0
    asteroide1 = Asteroide.new
    expect { nave.chocar asteroide1}.to raise_error(ElementoDelEspacioMuertoError)
  end

  it 'deberia lanzar excepcion por asignar vida negativa a nave' do

    nave = Nave.new
    expect { nave.vida = -1}.to raise_error(ElementoDelEspacioVidaNegativaError)
  end

  it 'deberia lanzar excepcion por asignar masa negativa a nave' do

    nave = Nave.new
    expect { nave.masa = -1}.to raise_error(ElementoDelEspacioMasaNegativaError)
  end

  it 'deberia agregarse un nuevo sexto elemento y efecto en nave a las situaciones posibles' do

    nave = Nave.new
    nave.agregar_elemento_espacial_junto_a_efecto_posible('Supernova', EfectoVidaDestructivo.new(10))

    cantidad_situacion_de_choques_obtenidos = nave.situacion_de_choque.length
    expect(cantidad_situacion_de_choques_obtenidos).to eq 6
  end

  it 'deberia eliminarse el elemento bomba de las situaciones posibles, quedando 4 situaciones en nave' do

    nave = Nave.new
    nave.eliminar_elemento_espacial_junto_a_efecto_posible('Bomba')

    cantidad_situacion_de_choques_obtenidos = nave.situacion_de_choque.length
    expect(cantidad_situacion_de_choques_obtenidos).to eq 4
  end
end
