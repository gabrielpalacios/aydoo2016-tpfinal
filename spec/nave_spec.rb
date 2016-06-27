require 'rspec'
require 'spec_helper'
require_relative '../model/nave'
require_relative '../model/asteroide'
require_relative '../model/estrella'
require_relative '../model/misil'
require_relative '../model/bomba'

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
    expect(objeto.calcularSiEstaVivo).to eq valorEsperadoVidaYMasa
  end

  it 'setear vida 200 a una Nave y releer sus valores para saber q esta viva' do
    objeto = Nave.new
    objeto.vida = 200
    valorEsperadoVidaYMasa = true
    expect(objeto.calcularSiEstaVivo).to eq valorEsperadoVidaYMasa
  end

  it 'setear vida 50 y masa 0 a una Nave y releer sus valores para saber q esta muerta' do
    objeto = Nave.new
    objeto.vida = 50
    objeto.masa = 0
    valorEsperadoVidaYMasa = false
    expect(objeto.calcularSiEstaVivo).to eq valorEsperadoVidaYMasa
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

  # it 'nave Disminuye su masa en un valor igual al 50 porciento de la masa del asteroide y asteroide Aumenta su masa en un valor igual al 10 porciento  de la masa del otro objeto al chocar con nave' do
  #
  #   nave1 = Nave.new
  #   asteroide2 = Asteroide.new
  #   nave1.chocar asteroide2
  #
  #   expect(nave1.masa).to eq 50
  #   expect(asteroide2.masa).to eq 110
  # end

  it 'asteroide Aumenta su masa en un valor igual al 10 porciento  de la masa del otro objeto al chocar con nave' do

    nave1 = Nave.new
    asteroide2 = Asteroide.new

    nave1Clon = nave1.clone
    asteroide2Clon = asteroide2.clone

    nave1.chocar asteroide2
    asteroide2Clon.chocar nave1Clon

    expect(asteroide2Clon.masa).to eq 110
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
    nave1Clon = nave1.clone
    nave2Clon = nave2.clone

    nave1.chocar nave2
    nave2Clon.chocar nave1Clon


    expect(nave1.vida).to eq 0
    expect(nave1.masa).to eq 100
    expect(nave2Clon.vida).to eq 0
    expect(nave2Clon.masa).to eq 100
  end


 it 'Nave pierde 50 de vida al chocar con bomba y bomba pierde 100 de vida' do

    nave1 = Nave.new
    bomba2 = Bomba.new
    nave1Clon = nave1.clone
    bomba2Clon = bomba2.clone

    nave1.chocar bomba2
    bomba2Clon.chocar nave1Clon


    expect(nave1.vida).to eq 50
    expect(nave1.masa).to eq 100
    expect(bomba2Clon.vida).to eq 0
    expect(bomba2Clon.masa).to eq 100
  end

  it 'Nave pierde 80 de vida al chocar con misil y misil pierde 100 de vida' do

    nave1 = Nave.new
    misil2 = Misil.new
    nave1Clon = nave1.clone
    misil2Clon = misil2.clone

    nave1.chocar misil2
    misil2Clon.chocar nave1Clon


    expect(nave1.vida).to eq 20
    expect(nave1.masa).to eq 100
    expect(misil2Clon.vida).to eq 0
    expect(misil2Clon.masa).to eq 100
  end

  it 'choca nave con asteroide, la nave queda en 100 vida y 50 masa y el asteroide gana 10 porciento de masa' do

    nave1 = Nave.new
    asteroide2 = Asteroide.new

    nave1Clon = nave1.clone
    asteroide2Clon = asteroide2.clone

    nave1.chocar asteroide2
    asteroide2Clon.chocar nave1Clon

    expect(nave1.vida).to eq 100
    expect(nave1.masa).to eq 50
    expect(asteroide2Clon.vida).to eq 100
    expect(asteroide2Clon.masa).to eq 110
  end



  it 'choca nave con estrella, la nave sube 100 de vida y la estrella baja a 0 de vida' do

    nave1 = Nave.new
    estrella = Estrella.new

    nave1Clon = nave1.clone
    estrellaClon = estrella.clone

    nave1.chocar estrella
    estrellaClon.chocar nave1Clon

    expect(nave1.vida).to eq 200
    expect(nave1.masa).to eq 100
    expect(estrellaClon.vida).to eq 0
    expect(estrellaClon.masa).to eq 100
  end






end

