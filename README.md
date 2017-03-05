## Dulcinea: a nebrija frontend + api

[![Code Climate](https://img.shields.io/codeclimate/github/javierhonduco/dulcinea.svg)](https://codeclimate.com/github/javierhonduco/dulcinea)

### Description

This project serves as a HTML + JSON frontend for the [nebrija](https://github.com/javierhonduco/nebrija) RAE library.

It is a simple [Sinatra](http://www.sinatrarb.com/) app that serves a JSON as well as a -hopefully- nice webpage, and it's being run on Heroku.

Here is how it looks when a word is searched:
![image](https://cloud.githubusercontent.com/assets/959128/23587327/fe2073fc-01a9-11e7-8ec2-548d3ef0ebaa.png)

### Routes:
* `'/'` serves the webpage. The frontend is made with Bootstrap + Zepto.js. The JSON is requested using Ajax.
* `api/word/:word` is where the API is hosted. The responses are the ones from [nebrija](https://github.com/javierhonduco/nebrija) but adding the current nebrija version.

### Running locally
```bash
# clone the repo
$ git clone https://github.com/javierhonduco/dulcinea && cd dulcinea
# install the dependencies
$ bundle install
# run a server that reloads automatically
$ script/serve
# or the server run by Heroku (unicorn)
$ bundle exec foreman start
```
