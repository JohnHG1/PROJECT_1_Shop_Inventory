require_relative( '../db/sql_runner' )

class Product

  attr_reader( :name, :description, :supplier_id, :cost, :retail,  :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @supplier_id = options['supplier_id']
    @cost = options['cost']
    @retail = options['retail']

  end

  def name()
        return "#{@name}"
  end

  def description()
        return "#{@desription}"
  end

  def cost()
        return "#{@cost}"
  end

  def supplier()
    supplier = Supplier.find(@supplier)
    return supplier
  end

  def save()
    sql = "INSERT INTO product
    (
      name,
      description,
      supplier_id,
      cost,
      retail
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@name, @description, @supplier_id, @cost, @retail]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  # def suppliers
  #   sql = "SELECT v.* FROM suppliers v INNER JOIN stocks b ON b.suppliers_id = v.id WHERE b.product_id = $1;"
  #   values = [@id]
  #   results = SqlRunner.run(sql, values)
  #   return results.map { |product| Product.new(product) }
  # end

  def self.all()
    sql = "SELECT * FROM products"
    results = SqlRunner.run( sql )
    return results.map { |hash| Products.new(hash) }
  end

  def self.find( id )
    sql = "SELECT * FROM products
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Product.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM products"
    SqlRunner.run( sql )
  end

end
