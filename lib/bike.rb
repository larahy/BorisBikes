

class Bike

	def initialize
	 fix
	end

  def break
  	@broken = true
    self
 	end

 	def fix
 	  @broken = false
 	end

  def broken?
  	@broken 
  end

  
end
