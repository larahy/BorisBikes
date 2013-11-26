

class Bike

	def initialize
	 fix
	end

  def break
  	@broken = true
 	end

 	def fix
 	  @broken = false
 	end

  def broken?
  	@broken 
  end

  
end
