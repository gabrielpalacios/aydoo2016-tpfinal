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
=begin
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

=end
  end

