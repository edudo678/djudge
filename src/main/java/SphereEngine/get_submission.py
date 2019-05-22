#!/usr/bin/env python2
#encoding: UTF-8

"""
Example presents error handling for submissions.get() API method
"""
from sphere_engine import CompilersClientV4
from sphere_engine.exceptions import SphereEngineException

# define access parameters
accessToken = '8bce219ca0c54390d6b832fa542470b2'
endpoint = 'a53fdb4d.compilers.sphere-engine.com'

# initialization
client = CompilersClientV4(accessToken, endpoint)

# API usage
try:
    response = client.submissions.get(82807704)
    print(response)
except SphereEngineException as e:
    if e.code == 401:
        print('Invalid access token')
    elif e.code == 403:
        print('Access to the submission is forbidden')
    elif e.code == 404:
        print('Submission does not exist')
