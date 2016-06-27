require 'rspec'
require 'spec_helper'
require_relative '../model/nave'
require_relative '../model/asteroide'
require_relative '../model/estrella'
require_relative '../model/misil'
require_relative '../model/bomba'

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
    expect(objeto.calcularSiEstaVivo).to eq valorEsperadoVidaYMasa
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

    naveClon = nave2.clone
    asteroideClon = asteroide1.clone

    asteroide1.chocar nave2
    naveClon.chocar asteroideClon

    expect(naveClon.masa).to eq 50
  end

  #tests mas completos, como casos reales

  it 'Asteroides 1 y 2 de 300 vida y 100 masa no le pasan nada tras choque' do

    asteroide1 = Asteroide.new
    asteroide2 = Asteroide.new
    asteroide1Clon = asteroide1.clone
    asteroide2Clon = asteroide2.clone

    asteroide1.chocar asteroide2
    asteroide2Clon.chocar asteroide1Clon


    expect(asteroide1.vida).to eq 100
    expect(asteroide1.masa).to eq 100
    expect(asteroide2Clon.vida).to eq 100
    expect(asteroide2Clon.masa).to eq 100
  end

  it 'Asteroide no pierde nada al chocr con misil y misil tampoco sufre ningun danao' do

    asteroide1 = Asteroide.new
    misil2 = Misil.new
    asteroide1Clon = asteroide1.clone
    misil2Clon = misil2.clone

    asteroide1.chocar misil2
    misil2Clon.chocar asteroide1Clon


    expect(asteroide1.vida).to eq 100
    expect(asteroide1.masa).to eq 100
    expect(misil2Clon.vida).to eq 100
    expect(misil2Clon.masa).to eq 100
  end



  it 'choca asteroide con nave, el asteroide Aumenta su masa en un valor igual al 10 porciento de la nave y la nave baja 50 porciento de masa respecto a asteroide' do

    asteroide1 = Asteroide.new
    nave = Nave.new

    asteroide1Clon = asteroide1.clone
    naveClon = nave.clone

    asteroide1.chocar nave
    naveClon.chocar asteroide1Clon

    expect(asteroide1.vida).to eq 100
    expect(asteroide1.masa).to eq 110
    expect(naveClon.vida).to eq 100
    expect(naveClon.masa).to eq 50
  end

  it 'choca asteroide con estrella, al asteroide no le pasa nada y la estrella baja a 0 de vida' do

    asteroide1 = Asteroide.new
    estrella = Estrella.new

    asteroide1Clon = asteroide1.clone
    estrellaClon = estrella.clone

    asteroide1.chocar estrella
    estrellaClon.chocar asteroide1Clon

    expect(asteroide1.vida).to eq 100
    expect(asteroide1.masa).to eq 100
    expect(estrellaClon.vida).to eq 0
    expect(estrellaClon.masa).to eq 100
  end


  it 'choca asteroide con bomba, la asteroide no le pasa nada y la estrella baja a 0 de vida' do

    asteroide1 = Asteroide.new
    bomba = Bomba.new

    asteroide1Clon = asteroide1.clone
    bombaClon = bomba.clone

    asteroide1.chocar bomba
    bombaClon.chocar asteroide1Clon

    expect(asteroide1.vida).to eq 100
    expect(asteroide1.masa).to eq 100
    expect(bombaClon.vida).to eq 0
    expect(bombaClon.masa).to eq 100
  end

end

