require 'spec_helper'

shared_examples_for ParticularDuration do |hours, minutes, seconds, millis|
  context "Initialize with params" do
    context ":hours => #{hours}, :minutes => #{minutes}, :seconds => #{seconds}, :millis => #{millis}" do
      subject { Duration.new(:hours => hours, :minutes => minutes, :seconds => seconds, :millis => millis) }
      its(:to_s)    { should == "#{hours.nil? '0' : hours}:#{minutes.nil? '0' : minutes}:#{seconds.nil? '0' : seconds}.#{millis.nil? '0' : millis}" }
      its(:hours)   { should == hours }
      its(:minutes) { should == minutes }
      its(:seconds) { should == seconds }
      its(:millis)  { should == millis }
    end
end

describe Duration do

  context "Initialize with params" do
    context ":hours => 1, :minutes => 10, :seconds => 30, :millis => 3" do
      subject { Duration.new(:hours => 1, :minutes => 10, :seconds => 30, :millis => 3) }
#      it "should return '1:10:30.3' when invoke to_s" do
#        should_not be_nil
#        subject.to_s.should == "1:10:30.3"
#      end
      its(:to_s)    { should == "1:10:30.3" }
      its(:hours)   { should == 1 }
      its(:minutes) { should == 10 }
      its(:seconds) { should == 30 }
      its(:millis)  { should == 3 }
    end

    let(:)

    context ":minutes => 3, :seconds => 10" do
      it "should return '0:3:10.00' when invoke to_s" do
        d = Duration.new(:minutes => 3, :seconds => 10)
        d.should_not be_nil
        d.to_s.should == "0:3:10.00"
      end
    end
  end

  it "Constructor without params should be return '0:0:0.00'" do
    d = Duration.new()
    d.should_not be_nil
    d.to_s.should == "0:0:0.00"
  end

end

