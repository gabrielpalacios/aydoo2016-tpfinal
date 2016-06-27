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
    expect(objeto.calcularSiEstaVivo).to eq valorEsperadoVidaYMasa
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

=begin

  it 'Misils 1 y 2 nuevas con 300 de vida pierden 100 de vida cada una mutuamente' do

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



  it 'Misil pierde 50 porciento de vida al chocar con misil' do

    misil1 = Misil.new
    misil2 = Misil.new
    misil1.chocar misil2

    expect(misil1.vida).to eq 50
    expect(misil1.masa).to eq 100
  end

  #tests mas completos, como casos reales

  it 'Misils 1 y 2 de 300 pierden 100 de vida mutuamente' do

    misil1 = Misil.new
    misil2 = Misil.new
    misil1Clon = misil1.clone
    misil2Clon = misil2.clone

    misil1.chocar misil2
    misil2Clon.chocar misil1Clon


    expect(misil1.vida).to eq 0
    expect(misil1.masa).to eq 100
    expect(misil2Clon.vida).to eq 0
    expect(misil2Clon.masa).to eq 100
  end

  it 'Misil pierde 50 porciento de vida al chocar con misil y misil no sufre ningun dano' do

    misil1 = Misil.new
    misil2 = Misil.new
    misil1Clon = misil1.clone
    misil2Clon = misil2.clone

    misil1.chocar misil2
    misil2Clon.chocar misil1Clon


    expect(misil1.vida).to eq 50
    expect(misil1.masa).to eq 100
    expect(misil2Clon.vida).to eq 100
    expect(misil2Clon.masa).to eq 100
  end


  it 'choca misil con asteroide, la misil queda en 0 vida y el asteroide sale ileso' do

    misil1 = Misil.new
    asteroide2 = Asteroide.new

    misil1Clon = misil1.clone
    asteroide2Clon = asteroide2.clone

    misil1.chocar asteroide2
    asteroide2Clon.chocar misil1Clon

    expect(misil1.vida).to eq 0
    expect(misil1.masa).to eq 100
    expect(asteroide2Clon.vida).to eq 100
    expect(asteroide2Clon.masa).to eq 100
  end

  it 'choca misil con nave, la misil baja 100 de vida y la nave baja 50 de vida' do

    misil1 = Misil.new
    nave = Nave.new

    misil1Clon = misil1.clone
    naveClon = nave.clone

    misil1.chocar nave
    naveClon.chocar misil1Clon

    expect(misil1.vida).to eq 0
    expect(misil1.masa).to eq 100
    expect(naveClon.vida).to eq 50
    expect(naveClon.masa).to eq 100
  end

  it 'choca misil con estrella, la misil baja 100 de vida y la estrella baja a 0 de vida' do

    misil1 = Misil.new
    estrella = Estrella.new

    misil1Clon = misil1.clone
    estrellaClon = estrella.clone

    misil1.chocar estrella
    estrellaClon.chocar misil1Clon

    expect(misil1.vida).to eq 0
    expect(misil1.masa).to eq 100
    expect(estrellaClon.vida).to eq 0
    expect(estrellaClon.masa).to eq 100
  end

=end
end
