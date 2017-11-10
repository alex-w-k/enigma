# frozen_string_literal: true

require_relative 'spec_helper'

describe Encryptor do
  let(:encrypt) { Encryptor.new }

  describe '#initialize' do
    it 'initiazes with no arguments' do
      expect(encrypt.class).to eq(Encryptor)
    end
    
    it 'has keygen when initialized' do
      expect(encrypt.key.class).to eq(KeyGen)
    end
  end

  describe '#encrypt' do
    it 'correctly takes arguments and saves them properly' do
      encrypt.encrypt({message: "This is soooooo secret", key: {key: '12345', date: '290317'}})
      expect(encrypt.message).to eq('This is soooooo secret')
      expect(encrypt.key.key).to eq('12345')
    end

    it 'correctly encrypts a string 😲' do
      expected = "t😅😛😧😀"
      acutal = encrypt.encrypt({message: "hello", key: {key: '12345', date: '290317'}})
      expect(expected).to eq(acutal)
    end
  end

end
