class Cluck_helper
	require 'cluck.rb'

  	def findCluck(id)
  		Cluck.find(id)
  	end

	def initialize
  	end

  	def createEmptyCluck
  		Cluck.new
  		
  	end

  	def getAllClucks
  		Cluck.all
  		
  	end

  end

  