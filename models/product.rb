require_relative( '../db/sql_runner' )

class Product

  attr_reader( :model, :description, :colour, :cost, :retail,  :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @model = options['model']
    @description = options['description']
    @colour = options['colour']
    @cost = options['cost']
    @retail = options['retail']
    @supplier_id = options['supplier_id'].to_i

  end

  def model()
        return "#{@model}"
  end

  def description()
        return "#{@desription}"
  end

  def cost()
        return "#{@cost}"
  end

  def supplier()
    supplier = Supplier.find(@supplier_ids)
    return supplier
  end

  def save()
    sql = "INSERT INTO products
    (
      model,
      description,
      colour,
      cost,
      retail,
      supplier_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@model, @description, @colour, @cost, @retail, @supplier_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def stocks
    sql = "SELECT v.* FROM stocks v INNER JOIN suppliers b ON b.stocks_id = v.id WHERE b.product_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |stock| Stock.new(stock) }
  end

  def update()
      sql = "UPDATE products
      SET
      (
        model,
        description,
        colour,
        cost,
        retail
      ) =
      (
        $1, $2, $3, $4, $5
      )
      WHERE id = $6"
      values = [@model, @description, @colour, @cost, @retail, @id]
      SqlRunner.run( sql, values )
    end

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
