require 'json'
require 'rspec'

describe "instances_checker" do

  before :all do
    @pwd = "#{File.dirname(__FILE__)}/.."
    @instances = JSON.parse( open("#{@pwd}/instances.json").readlines.map(&:chomp).join )
    @optimum = JSON.parse( open("#{@pwd}/test/bestknowns.json").readlines.map(&:chomp).join )
  end

  it 'verifies optimum makespan' do
    @instances.reject{|instance| instance["optimum"].nil? }.each do |instance|
      instance["optimum"].should eq(@optimum[instance["name"]])
    end
  end

  it 'verifies instance file path' do
    @instances.each do |instance|
      File.exist?( "#{@pwd}/#{instance["path"]}" ).should be_true
    end
  end

  it 'verifies problem size' do
    @instances.each do |instance|
      size = open( "#{@pwd}/#{instance["path"]}" ).readlines.reject{|line| line =~ /^#/}[0].split.map(&:to_i)
      [instance["jobs"],instance["machines"]].should eq(size)
    end
  end

  it 'verifies bounds' do
    @instances.select{|instance| instance["optimum"].nil? }.each do |instance|
      instance["bounds"].tap{|b| break ( !b.nil? && b["upper"] > b["lower"] ) }.should be_true
    end
  end

end
