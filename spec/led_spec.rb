describe 'Led.add' do
  it 'should pre-process the scripts' do
    Led.add(:t1, 'return 1')
    
    Led.t1.should == 1
  end
  
  it 'should pass arguments correctly' do
    Led.add(:t2, 'return ARGV')
    
    Led.t2(1,2,3).should == %w{1 2 3}
  end
end

describe 'Led' do
  it 'should reload the script automatically if missing' do
    Led.add(:t1, 'return 1')
    Led.t1.should == 1
    
    Led.conn.script('flush')
    
    Led.t1.should == 1
  end
end