require 'rspec'
require_relative '../model/nave'

describe 'Nave' do

  it 'setear con set vida y masa a una nave y releer sus valores' do
    objeto = Nave.new
    objeto.vida = 100
    objeto.masa = 100
    vectorEsperadoVidaYMasa = 100
    expect(objeto.vida).to eq vectorEsperadoVidaYMasa
    expect(objeto.masa).to eq vectorEsperadoVidaYMasa
  end

  end

