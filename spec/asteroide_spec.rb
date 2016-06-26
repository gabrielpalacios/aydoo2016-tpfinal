require 'rspec'
require_relative '../model/nave'
require_relative '../model/asteroide'
require_relative '../model/estrella'
require_relative '../model/misil'

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

end

