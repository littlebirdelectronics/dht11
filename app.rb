#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'

set :bind, '0.0.0.0'
set :port, 80


get '/' do

	file = File.open("readings.txt", "rb")
	contents = file.read

	unless contents.include? 'Invalid'
		humidity = contents.split(',').first
		temperature = contents.split(',').last
		"The temperature is #{temperature}<br>The humidity is #{humidity}."
	else
		"Sorry, couldn't get a reading :("
	end
end