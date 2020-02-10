require_relative( '../db/sql_runner' )

class Stock

  attr_reader( :product_id, :quantity, :colour, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @product_id = options['product_id']
    @quantity = options['quantity'].to_i
    @colour = options['colour']
  end

  def save()
    sql = "INSERT INTO stocks
    (
      product_id,
      quantity,
      colour
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@product_id, @quantity, @colour]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def products()
    sql = "SELECT z.* FROM products z INNER JOIN suppliers b ON b.products_id = z.id WHERE b.stock_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |product| Product.new(product) }
  end

  def self.all()
    sql = "SELECT * FROM stocks"
    results = SqlRunner.run( sql )
    return results.map { |stock| Stock.new( stock)}
  end

  def self.find( id )
    sql = "SELECT * FROM stocks
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Stock.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM stocks"
    SqlRunner.run( sql )
  end

end
