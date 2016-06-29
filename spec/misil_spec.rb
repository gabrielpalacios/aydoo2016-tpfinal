require 'rspec'
require 'spec_helper'
require_relative '../model/nave'
require_relative '../model/asteroide'
require_relative '../model/misil'
require_relative '../model/bomba'
require_relative '../model/estrella'

describe 'Misil' do

  it 'setear vida y masa 100 a una Misil y releer sus valores' do
    objeto = Misil.new
    objeto.vida = 100
    objeto.masa = 100
    valorEsperadoVidaYMasa = 100
    expect(objeto.vida).to eq valorEsperadoVidaYMasa
    expect(objeto.masa).to eq valorEsperadoVidaYMasa
  end

  it 'setear vida y masa 100 a una Misil y releer sus valores usando constructor' do
    objeto = Misil.new
    valorEsperadoVidaYMasa = 100
    expect(objeto.vida).to eq valorEsperadoVidaYMasa
    expect(objeto.masa).to eq valorEsperadoVidaYMasa
  end

  it 'setear vida 0 a una Misil y releer sus valores para saber q esta muerta' do
    objeto = Misil.new
    objeto.vida = 0
    valorEsperadoVidaYMasa = false
    expect(objeto.calcular_si_esta_vivo).to eq valorEsperadoVidaYMasa
  end

  it 'setear vida 200 a un Misil y releer sus valores para saber q esta vivo' do
    objeto = Misil.new
    objeto.vida = 200
    valorEsperadoVidaYMasa = true
    expect(objeto.calcular_si_esta_vivo).to eq valorEsperadoVidaYMasa
  end

  it 'setear vida 50 y masa 0 a un Misil y releer sus valores para saber q esta muerto' do
    objeto = Misil.new
    objeto.vida = 50
    objeto.masa = 0
    valorEsperadoVidaYMasa = false
    expect(objeto.calcular_si_esta_vivo).to eq valorEsperadoVidaYMasa
  end

  it 'Misil 1 pierde 100 de vida al chocar con Misil 2' do
    misil1 = Misil.new
    misil2 = Misil.new

    misil1.chocar misil2

    expect(misil1.vida).to eq 0
  end

  it 'Misil 2 tmb pierde 100 de vida al chocar con Misil 1' do

    misil1 = Misil.new
    #puts misil1.class.name # devuelve 'Misil'
    misil2 = Misil.new
    misil1.chocar misil2
    expect(misil2.vida).to eq 0
  end

  it 'Misiles 1 y 2 tmb pierde 100 de vida mutuamente controlando ambas vidas' do

    misil1 = Misil.new
    misil2 = Misil.new
    misil1.chocar misil2
    expect(misil1.vida).to eq 0
    expect(misil2.vida).to eq 0
  end

  it 'Misiles 1 y 2 nuevos con 300 de vida pierden 100 de vida cada una mutuamente' do

    misil1 = Misil.new
    misil1.vida = 300
    misil2 = Misil.new
    misil2.vida = 300
    misil1.chocar misil2
    expect(misil1.vida).to eq 200
    expect(misil2.vida).to eq 200
  end

  it 'Misils 1 y 2 de 300 pierden 100 de vida mutuamente controlando ambas vidas y masas' do

    misil1 = Misil.new
    misil1.vida = 300
    misil2 = Misil.new
    misil2.vida = 300
    misil1.chocar misil2
    expect(misil1.vida).to eq 200
    expect(misil2.vida).to eq 200

    expect(misil1.masa).to eq 100
    expect(misil2.masa).to eq 100
    end

  #tests mas completos, como casos reales

  it 'Misiles 1 y 2 de 300 de vida pierden 100 de vida mutuamente' do

    misil1 = Misil.new
    misil2 = Misil.new

    misil1.chocar misil2

    expect(misil1.vida).to eq 0
    expect(misil1.masa).to eq 100
    expect(misil2.vida).to eq 0
    expect(misil2.masa).to eq 100
  end

  it 'Misil no le pasa nada al chocar con bomba y bomba pierde el 50 porciento de su vida' do

    misil1 = Misil.new
    bomba2 = Bomba.new

    misil1.chocar bomba2

    expect(misil1.vida).to eq 100
    expect(misil1.masa).to eq 100
    expect(bomba2.vida).to eq 50
    expect(bomba2.masa).to eq 100
  end

  it 'choca misil con asteroide, al misil no le pasa nada al chocar con el asteroide y el asteroide sale ileso' do

    misil1 = Misil.new
    asteroide2 = Asteroide.new

    misil1.chocar asteroide2

    expect(misil1.vida).to eq 100
    expect(misil1.masa).to eq 100
    expect(asteroide2.vida).to eq 100
    expect(asteroide2.masa).to eq 100
  end

  it 'choca misil con nave, el misil baja 100 de vida y la nave baja 80 de vida' do

    misil1 = Misil.new
    nave = Nave.new

    misil1.chocar nave

    expect(misil1.vida).to eq 0
    expect(misil1.masa).to eq 100
    expect(nave.vida).to eq 20
    expect(nave.masa).to eq 100
  end

  it 'choca misil con estrella, al misil no le pasa nada y la estrella tampoco sufre dano' do

    misil1 = Misil.new
    estrella = Estrella.new

    misil1.chocar estrella

    expect(misil1.vida).to eq 100
    expect(misil1.masa).to eq 100
    expect(estrella.vida).to eq 100
    expect(estrella.masa).to eq 100
  end

  it 'choca misil con asteroide, el misil tiene 0 de vida al momento del choque y deberia lanzar la excepcion de objeto espacial muerto' do

    misil = Misil.new
    misil.vida = 0
    asteroide1 = Asteroide.new
    expect { misil.chocar asteroide1}.to raise_error(ElementoDelEspacioMuertoError)
  end


  it 'deberia lanzar excepcion por asignar vida negativa a misil' do

    misil = Misil.new
    expect { misil.vida = -1}.to raise_error(ElementoDelEspacioVidaNegativaError)
  end

  it 'deberia lanzar excepcion por asignar masa negativa a misil' do

    misil = Misil.new
    expect { misil.masa = -1}.to raise_error(ElementoDelEspacioMasaNegativaError)
  end

  it 'deberia agregarse un nuevo sexto elemento y efecto en misil a las situaciones posibles' do

    misil = Misil.new
    misil.agregar_elemento_espacial_y_efecto_posible('Supernova', EfectoVidaDestructivo.new(10))

    cantidad_situacion_de_choques_obtenidos = misil.situacion_de_choque.length
    expect(cantidad_situacion_de_choques_obtenidos).to eq 6
  end

  it 'deberia eliminarse el elemento nave de las situaciones posibles, quedando 4 situaciones en misil' do

    misil = Misil.new
    misil.eliminar_elemento_espacial_y_efecto_posible('Nave')

    cantidad_situacion_de_choques_obtenidos = misil.situacion_de_choque.length
    expect(cantidad_situacion_de_choques_obtenidos).to eq 4
  end
end
