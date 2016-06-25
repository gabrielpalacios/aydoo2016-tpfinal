require 'rspec'
require_relative '../model/nave'

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

  # it 'setear vida 0 a una nave y releer sus valores para saber q esta muerta' do
  #   objeto = Nave.new
  #   objeto.vida = 0
  #   valorEsperadoVidaYMasa = false
  #   expect(objeto.calcularSiEstaVivo).to eq valorEsperadoVidaYMasa
  # end

  end

