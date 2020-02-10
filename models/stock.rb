require_relative( '../db/sql_runner' )
require_relative( 'product' )

class Stock

  attr_reader( :product_id, :quantity, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @product_id = options['product_id']
    @quantity = options['quantity'].to_i
  end

  def save()
    sql = "INSERT INTO stocks
    (
      product_id,
      quantity
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@product_id, @quantity]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
      sql = "UPDATE stocks
      SET
      (
        product_id,
        quantity
      ) =
      (
        $1, $2
      )
      WHERE id = $3"
      values = [@product_id, @quantity, @id]
      SqlRunner.run( sql, values )
    end

    def product()
      product = Product.find(@product_id)
      return product
    end

  def self.all()
    sql = "SELECT * FROM stocks"
    results = SqlRunner.run( sql )
    return results.map { |stock| Stock.new(stock)}
  end

  def self.find( id )
    sql = "SELECT * FROM stocks
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Stock.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM stocks"
    SqlRunner.run( sql )
  end

end
