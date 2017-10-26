# frozen_string_literal: true
require_relative 'spec_helper'

describe Decryptor do
  let(:decrypt) { Decryptor.new }

  describe '#initialie' do
    it 'initializes with no arguments' do
      expect(decrypt.class).to eq(Decryptor)
    end
  end
end
