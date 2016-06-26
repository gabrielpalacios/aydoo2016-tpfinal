require 'rspec'
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



end

