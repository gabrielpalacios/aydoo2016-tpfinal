require 'rspec'
require_relative '../model/asteroide'

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

=begin
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

=end
  end

