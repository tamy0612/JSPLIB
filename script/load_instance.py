# coding: utf-8

import os
import sys
import json
import math

Argv = sys.argv
if( len(Argv) < 2 ):
    sys.stderr.write( "Usage: python %s <instance>\n" % Argv[0] )
    quit()

Target = Argv[1]

file = open( os.path.join( os.path.dirname( __file__ ), 'instances.json' ), "r" )
data = json.load( file )

instance = [ inst for inst in data if inst['name'] == Target ]
if( len(instance) == 0 ):
    raise Exception("There is no instance named %s" % Target)

instance = instance[0]
path = os.path.abspath( os.path.join(os.path.dirname( __file__ ),instance['path']) )
optimum = instance['optimum']
print( optimum )
if( optimum is None ):
    if( instance['bounds'] is None ):
        optimum = "nan"
    else:
        optimum = instance['bounds']['lower']

sys.stdout.write('--instance %s --optimum %s' % (path,optimum))
