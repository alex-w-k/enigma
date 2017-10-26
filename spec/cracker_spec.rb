# frozen_string_literal: true

require_relative 'spec_helper'

describe Cracker, '#crack' do
  let(:cracker) { Cracker.new }

  context "with message ending with '..end..'" do
    context 'given the day the message was encrypted' do
      it 'can crack the message' do
        message = 'this is a test ..end.. cracked with key 2177'
        result = cracker.crack('z😄😇-&😅😑ug7😒🖕y😐9😈4😁😌😾4E', 251017)
        expect(result).to eq(message)
      end
    end
  end
end
