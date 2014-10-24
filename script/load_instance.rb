require 'json'

Target = ARGV.first

Root = File.dirname(__FILE__)

file = open("#{Root}/instances.json")
json = JSON.parse( file.readlines.map(&:chomp).join )

instance = json.select{|data| data["name"] == Target }
raise "There is no instance named '#{target}'" if instance.empty?

instance = instance.first
path = File.expand_path( instance["path"], Root )
optimum = instance["optimum"]
optimum ||= instance["bounds"]["lower"] unless instance["bounds"].nil?
optimum ||= "nan"

print "--instance %s --optimum %s" % [path,optimum]
