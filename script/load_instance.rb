require 'json'

Root = "#{File.dirname(__FILE__)}/../"

class Instance
  def initialize hash
    @hash = hash
  end
  def name
    @hash["name"]
  end
  def jobs
    @hash["jobs"]
  end
  def machines
    @hash["machines"]
  end
  def operations
    self.jobs * self.machines
  end
  def path
    @hash["path"]
  end
  def optimum
    opt = @hash["optimum"]
    bnd = @hash["bounds"]
    return "nan" if [opt,bnd].compact.empty?
    return opt unless opt.nil?
    bnd["lower"]
  end
  def bounds
    @hash["bounds"]
  end
end


def load_instance target, dir = Root
  file = open("#{Root}/instances.json")
  json = JSON.parse( file.readlines.map(&:chomp).join )
  instance = json.select{|data| data["name"] == target }
  raise "There is no instance named '#{target}'" if instance.empty?
  instance = instance.first
  instance["path"] = File.expand_path( instance["path"], dir )
  Instance.new( instance )
end

if $0 == __FILE__
  target,dir = ARGV
  dir ||= Root
  instance = load_instance( target, dir )
  print "--instance %s --optimum %s" % [instance.path,instance.optimum]
end
