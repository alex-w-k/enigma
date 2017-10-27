# frozen_string_literal: true

require_relative 'spec_helper'

describe Decryptor do
  let(:decrypt) { Decryptor.new }

  describe '#initialie' do
    it 'initializes with no arguments' do
      expect(decrypt.class).to eq(Decryptor)
    end
  end

  describe '#message' do
    it 'retaiins the message' do
      decrypt.message = 'test'
      expect(decrypt.message).to eq('test')
    end
  end

  describe '#decrypt' do
    context 'when given a message, key, and date' do
      it 'correctly decrypts' do
        expected = 'this is a test ..end..'
        actual   = decrypt.decrypt("😰😩😷😷W😪!_😝\\\"😩😯😵ime😦😼😨ej", '55654', '300317')
        expect(actual).to eq(expected)
      end
    end

    context 'when given a message and key' do

    end
  end
end
