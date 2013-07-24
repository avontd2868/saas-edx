class Dessert
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  
  attr_accessor :name
  attr_accessor :calories

  def healthy?
    # returns true if a dessert has less than 200 calories
    calories < 200
  end
  
  def delicious?
    # returns true for all desserts
    return true
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    # YOUR CODE HERE
    super(name, calories)
    @flavor = flavor
  end

  attr_accessor :flavor
  
  def delicious?
    # return false if the flavor is "black licorice" 
    !(flavor == "black licorice")
  end
end
