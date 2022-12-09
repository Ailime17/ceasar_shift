# frozen_string_literal: true

require './script'

describe "#caesar_cipher" do
  it 'shifts a string by a small amount of places' do
    expect(caesar_cipher("What a string!",5)).to eql("Bmfy f xywnsl!")
  end
  it 'shifts a string by a big amount of places' do
    expect(caesar_cipher('Zz',83)).to eql('Ee')
  end
  it 'shifts a string by a negative amount of places' do
    expect(caesar_cipher('Ee', -83)).to eql('Zz')
  end
  it 'with an empty string as an argument, returns an empty string' do
    expect(caesar_cipher('',5)).to eql('')
  end
  it 'shifts a string with characters other than letters' do
    expect(caesar_cipher('Hel%lo! H:ow r u?^ xo<3', 5)).to eql('Mjq%qt! M:tb w z?^ ct<3')
  end
end
