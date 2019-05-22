#!/usr/bin/env python2
#encoding: UTF-8

"""
Example presents usage of the successful submissions.create() API method
"""
from sphere_engine import CompilersClientV4

# define access parameters
accessToken = '8bce219ca0c54390d6b832fa542470b2'
endpoint = 'a53fdb4d.compilers.sphere-engine.com'

# initialization
client = CompilersClientV4(accessToken, endpoint)

# API usage
source = 'print("dani")'
compiler = 4 # Python language
input = '2'

response = client.submissions.create(source, compiler, input)
#print(client.submissions.get(response['id']))
print(response)
# response['id'] stores the ID of the created submission