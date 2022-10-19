# implementation
class Material
  def make
    raise NotImplementedError,
          "#{self.class} has not implemented method '#{__method__}'"
  end
end

# concrete implementations
class MyMaterial1 < Material
  def make
    "make: material 1\n"
  end
end

class MyMaterial2 < Material
  def make
    "make: material 2\n"
  end
end

# abstraction
class Product
  def initialize(material)
    @material = material
  end

  def take
    "Product\n#{@material.make}"
  end
end

# extended abstraction
class MyProduct < Product
  def take
    "MyProduct\n#{@material.make}"
  end
end

# client code
def client_code(product)
  print product.take
end

# test (bridge)
material1 = MyMaterial1.new
material2 = MyMaterial2.new

product1 = Product.new(material1)
product2 = MyProduct.new(material2)

client_code(product1)
client_code(product2)