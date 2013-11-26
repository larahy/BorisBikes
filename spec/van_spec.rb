require_relative '../lib/van'

describe Van do    
    
  let (:van) {Van.new(:capacity => 20)}

  it 'should allow setting default capacity' do
    expect(van.capacity).to eq(20)
  end

end