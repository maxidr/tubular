require 'spec_helper'

def pad_fragment(fragment)
  fragment.to_s.rjust(2, '0')
end

shared_examples 'an object that represent current duration' do |hours, minutes, seconds, millis|
  context "when initialize with :hours => #{hours}, :minutes => #{minutes}, :seconds => #{seconds}, :millis => #{millis}" do
    subject { Duration.new(:hours => hours, :minutes => minutes, :seconds => seconds, :millis => millis) }
    it { should_not be_nil }
    its(:to_s)    { should == "#{pad_fragment(hours)}:#{pad_fragment(minutes)}:#{pad_fragment(seconds)}.#{pad_fragment(millis)}" }
    its(:hours)   { should == hours }
    its(:minutes) { should == minutes }
    its(:seconds) { should == seconds }
    its(:millis)  { should == millis }
  end
end


describe Duration do
  it_behaves_like 'an object that represent current duration', 1, 10, 30, 3
  it_behaves_like 'an object that represent current duration', 0, 0, 3, 0
  it_behaves_like 'an object that represent current duration', 0, 1, 0, 0

  context "Constructor without params" do
    subject { Duration.new() }
    it { should_not be_nil }
    its(:to_s) { should == "00:00:00.00" }
  end

end

