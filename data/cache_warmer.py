import json
import requests
from multiprocessing import Pool
from requests.exceptions import ConnectionError
#words = json.loads(open('top_spanish_words.json').read())
words = open('palabras/listado-general.txt').read().split()
p = Pool(8)

def load(word):
    try:
        r = requests.get('http://dulcinea.herokuapp.com/api/?query=' + word + '&update=true', allow_redirects=False)
        print r
        return r
    except ConnectionError:
        pass

if __name__ == '__main__':
    p.map(load, words)
    p.close()
    p.join()
    print 'Work done! ;D'
