require 'rspec'
require_relative '../model/nave'
require_relative '../model/asteroide'
require_relative '../model/bomba'
require_relative '../model/misil'
require_relative '../model/bomba'


describe 'Bomba' do

  it 'setear vida y masa 100 a una Bomba y releer sus valores' do
    objeto = Bomba.new
    objeto.vida = 100
    objeto.masa = 100
    valorEsperadoVidaYMasa = 100
    expect(objeto.vida).to eq valorEsperadoVidaYMasa
    expect(objeto.masa).to eq valorEsperadoVidaYMasa
  end

  it 'setear vida y masa 100 a una Bomba y releer sus valores usando constructor' do
    objeto = Bomba.new
    valorEsperadoVidaYMasa = 100
    expect(objeto.vida).to eq valorEsperadoVidaYMasa
    expect(objeto.masa).to eq valorEsperadoVidaYMasa
  end

  it 'setear vida 0 a una Bomba y releer sus valores para saber q esta muerta' do
    objeto = Bomba.new
    objeto.vida = 0
    valorEsperadoVidaYMasa = false
    expect(objeto.calcularSiEstaVivo).to eq valorEsperadoVidaYMasa
  end


  it 'Bomba 1 pierde 100 de vida al chocar con Bomba 2' do
    bomba1 = Bomba.new
    bomba2 = Bomba.new

    bomba1.chocar bomba2

    expect(bomba1.vida).to eq 0
  end


  it 'Bomba 2 tmb pierde 100 de vida al chocar con Bomba 1' do

    bomba1 = Bomba.new
    #puts bomba1.class.name # devuelve 'Bomba'
    bomba2 = Bomba.new
    bomba1.chocar bomba2
    expect(bomba2.vida).to eq 0
  end


  it 'Bombas 1 y 2 tmb pierde 100 de vida mutuamente controlando ambas vidas' do

    bomba1 = Bomba.new
    bomba2 = Bomba.new
    bomba1.chocar bomba2
    expect(bomba1.vida).to eq 0
    expect(bomba2.vida).to eq 0
  end

  it 'Bombas 1 y 2 nuevas con 300 de vida pierden 100 de vida cada una mutuamente' do

    bomba1 = Bomba.new
    bomba1.vida = 300
    bomba2 = Bomba.new
    bomba2.vida = 300
    bomba1.chocar bomba2
    expect(bomba1.vida).to eq 200
    expect(bomba2.vida).to eq 200
  end


=begin

  it 'Bombas 1 y 2 pierden 100 de vida mutuamente controlando ambas vidas y masas' do

    bomba1 = Bomba.new
    bomba2 = Bomba.new
    bomba1.chocar bomba2
    expect(bomba1.vida).to eq 0
    expect(bomba2.vida).to eq 0
    expect(bomba1.masa).to eq 100
    expect(bomba2.masa).to eq 100
  end

  it 'Bomba no le pasa nada al chocar con misil' do

    bomba1 = Bomba.new
    misil2 = Misil.new
    bomba1.chocar misil2

    expect(bomba1.vida).to eq 100
    expect(bomba1.masa).to eq 100
  end

  # it 'Bomba Disminuye su masa en un valor igual al 50 porciento de la masa del asteroide y asteroide Aumenta su masa en un valor igual al 10 porciento  de la masa del otro objeto al chocar con Bomba' do
  #
  #   bomba1 = Bomba.new
  #   asteroide2 = Asteroide.new
  #   bomba1.chocar asteroide2
  #
  #   expect(bomba1.masa).to eq 50
  #   expect(asteroide2.masa).to eq 110
  # end

  it 'asteroide Aumenta su masa en un valor igual al 10 porciento  de la masa del otro objeto al chocar con Bomba' do

    bomba1 = Bomba.new
    asteroide2 = Asteroide.new

    bomba1Clon = bomba1.clone
    asteroide2Clon = asteroide2.clone

    bomba1.chocar asteroide2
    asteroide2Clon.chocar bomba1Clon

    expect(asteroide2Clon.masa).to eq 110
  end


=end
end

