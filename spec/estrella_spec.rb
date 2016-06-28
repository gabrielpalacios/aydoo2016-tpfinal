require 'rspec'
require 'spec_helper'
require_relative '../model/nave'
require_relative '../model/asteroide'
require_relative '../model/estrella'
require_relative '../model/misil'
require_relative '../model/bomba'


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
    expect(objeto.calcularSiEstaVivo).to eq valorEsperadoVidaYMasa
  end

  it 'setear vida 200 a una Estrella y releer sus valores para saber q esta viva' do
    objeto = Estrella.new
    objeto.vida = 200
    valorEsperadoVidaYMasa = true
    expect(objeto.calcularSiEstaVivo).to eq valorEsperadoVidaYMasa
  end

  it 'setear vida 50 y masa 0 a una Estrella y releer sus valores para saber q esta muerta' do
    objeto = Estrella.new
    objeto.vida = 50
    objeto.masa = 0
    valorEsperadoVidaYMasa = false
    expect(objeto.calcularSiEstaVivo).to eq valorEsperadoVidaYMasa
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
    estrella1Clon = estrella1.clone
    estrella2Clon = estrella2.clone

    estrella1.chocar estrella2
    estrella2Clon.chocar estrella1Clon


    expect(estrella1.vida).to eq 0
    expect(estrella1.masa).to eq 100
    expect(estrella2Clon.vida).to eq 0
    expect(estrella2Clon.masa).to eq 100
  end

  it 'Estrella no le pasa nada al chocar con misil y misil tampoco sufre ningun dano' do

    estrella1 = Estrella.new
    misil2 = Misil.new
    estrella1Clon = estrella1.clone
    misil2Clon = misil2.clone

    estrella1.chocar misil2
    misil2Clon.chocar estrella1Clon


    expect(estrella1.vida).to eq 100
    expect(estrella1.masa).to eq 100
    expect(misil2Clon.vida).to eq 100
    expect(misil2Clon.masa).to eq 100
  end


  it 'choca estrella con asteroide, la estrella queda en 0 vida y el asteroide sale ileso' do

    estrella1 = Estrella.new
    asteroide2 = Asteroide.new

    estrella1Clon = estrella1.clone
    asteroide2Clon = asteroide2.clone

    estrella1.chocar asteroide2
    asteroide2Clon.chocar estrella1Clon

    expect(estrella1.vida).to eq 0
    expect(estrella1.masa).to eq 100
    expect(asteroide2Clon.vida).to eq 100
    expect(asteroide2Clon.masa).to eq 100
  end


  it 'choca estrella con nave, la estrella baja a 0 de vida y la nave suma toda la vida de la estrella' do

    estrella1 = Estrella.new
    nave = Nave.new

    estrella1Clon = estrella1.clone
    naveClon = nave.clone

    estrella1.chocar nave
    naveClon.chocar estrella1Clon

    expect(estrella1.vida).to eq 0
    expect(estrella1.masa).to eq 100
    expect(naveClon.vida).to eq 200
    expect(naveClon.masa).to eq 100
  end

  it 'choca estrella con bomba, la estrella baja a 0 de vida y la bomba baja 100 de vida' do

    estrella1 = Estrella.new
    bomba = Bomba.new

    estrella1Clon = estrella1.clone
    bombaClon = bomba.clone

    estrella1.chocar bomba
    bombaClon.chocar estrella1Clon

    expect(estrella1.vida).to eq 0
    expect(estrella1.masa).to eq 100
    expect(bombaClon.vida).to eq 0
    expect(bombaClon.masa).to eq 100
  end

  it 'choca estrella con bomba de 300 de vida, la estrella baja a 0 de vida y la bomba baja 100 de vida' do

    estrella1 = Estrella.new
    bomba = Bomba.new
    bomba.vida = 300

    estrella1Clon = estrella1.clone
    bombaClon = bomba.clone

    estrella1.chocar bomba
    bombaClon.chocar estrella1Clon

    expect(estrella1.vida).to eq 0
    expect(estrella1.masa).to eq 100
    expect(bombaClon.vida).to eq 200
    expect(bombaClon.masa).to eq 100
  end

  it 'choca estrella con asteroide, la estrella tiene 0 de vida al momento del choque y deberia lanzar la excepcion de objeto espacial muerto' do

    estrella = Estrella.new
    estrella.vida = 0
    asteroide1 = Asteroide.new
    expect { estrella.chocar asteroide1}.to raise_error(ElementoDelEspacioMuertoError)
  end
end

