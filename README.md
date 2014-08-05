Dulcinea: A nebrija frontend + api
==================================

[![Code Climate](https://img.shields.io/codeclimate/github/javierhonduco/dulcinea.svg)](https://codeclimate.com/github/javierhonduco/dulcinea)

What
----

A [nebrija](https://github.com/javierhonduco/nebrija) frontend + api.

This sinatra app serves a [RAE](http://www.rae.es/) api as well as a simple human readable frontend.


The api is extremely simple. [http://dulcinea.herokuapp.com/api/?query=casa](http://dulcinea.herokuapp.com/api/?query=casa). The responses are just the same as the ones documented @ nebrija.

`'/'` serves the webpage. The frontend is made with Bootrap + zepto. 
A nebrija – https://github.com/javierhonduco/nebrija frontend + api

Todo
----

* Frontend (!important):
  * Remove bootstrap.
  * Make it android/ios friendly.
  * Improve markup & js while staying lean.

* Backend:
  * Move model code into its place.
  * Add locks to serch queries.
