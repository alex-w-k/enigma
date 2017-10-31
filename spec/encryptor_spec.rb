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

end
