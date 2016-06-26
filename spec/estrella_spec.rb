require 'rspec'
require_relative '../model/Estrella'
require_relative '../model/asteroide'
require_relative '../model/estrella'
require_relative '../model/misil'


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

=begin
  # it 'Estrella Disminuye su masa en un valor igual al 50 porciento de la masa del asteroide y asteroide Aumenta su masa en un valor igual al 10 porciento  de la masa del otro objeto al chocar con Estrella' do
  #
  #   estrella1 = Estrella.new
  #   asteroide2 = Asteroide.new
  #   estrella1.chocar asteroide2
  #
  #   expect(estrella1.masa).to eq 50
  #   expect(asteroide2.masa).to eq 110
  # end

  it 'asteroide Aumenta su masa en un valor igual al 10 porciento  de la masa del otro objeto al chocar con Estrella' do

    estrella1 = Estrella.new
    asteroide2 = Asteroide.new

    estrella1Clon = estrella1.clone
    asteroide2Clon = asteroide2.clone

    estrella1.chocar asteroide2
    asteroide2Clon.chocar estrella1Clon

    expect(asteroide2Clon.masa).to eq 110
  end


=end
end

