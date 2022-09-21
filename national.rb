require 'rubygems'
require 'bundler'
Bundler.setup

require 'sinatra'
require 'json'
require 'rspotify'

get '/' do

  RSpotify.authenticate('569b8babfc6349bf8c148e96bae0afa7', 'd3c6cbc8ae044f339b851b9f282ec78b')
  artist = RSpotify::Artist.find('2cCUtGK9sDU2EoElnk0GNB')
  output = ''
  tracks = artist.top_tracks(:US)
  top_five = Array[]


  tracks.each do |n|
    name = n.name
    top_five << name
  end

  top_five.first(5).each do |x|
    output << "<tr><td>#{x}</td></tr>"
  end

  erb :index, :locals => {result: output}

end
