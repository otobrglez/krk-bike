#!/usr/bin/env ruby

require 'rubygems'
require 'bundler'
Bundler.setup(:default)
require './krk_bike_api'
require 'thor'
require 'json'

class Cli < Thor
  def initialize(*args)
    super
    @api = KrkBikeAPI.new(ENV.fetch('KRK_BIKE_API_KEY'))
  end

  desc "tracks", "Fetches all tracks"
  def tracks
    puts JSON.pretty_generate(@api.tracks)
  end
end

Cli.start(ARGV)
