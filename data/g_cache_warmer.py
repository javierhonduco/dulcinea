import requests
import gevent
import json
from gevent import monkey

# patches stdlib (including socket and ssl modules) to cooperate with other greenlets
monkey.patch_all()

import urllib2

words = json.loads(open('top_spanish_words.json').read())

def load(word):
	r = requests.get('http://dulcinea.herokuapp.com/api/?query=' + word)
	print r
	return r
	
jobs = [geventloadd, url) for url in words]

gevent.joinall(jobs)
