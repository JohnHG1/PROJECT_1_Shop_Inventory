require_relative('../db/sql_runner')

class Supplier

  attr_reader :name, :contact, :id

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @contact = options['contact']

  end

  def full_name()
      return "#{@name}"
    end

  def contact()
    contact = Contact.find(@contact)
    return contact
  end

  def save()
    sql = "INSERT INTO suppliers
    (
      name,
      contact
    )
    VALUES
    (
      $1, $2
    )
    RETURNING *"
    values = [@name, @contact]
    supplier_data = SqlRunner.run(sql, values)
    @id = supplier_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE suppliers
    SET
    (
      name,
      contact
    ) =
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@name, @contact, @id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all()
    sql = "DELETE FROM suppliers;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM suppliers
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM suppliers"
    suppliers = SqlRunner.run( sql )
    result = suppliers.map { |supplier| Supplier.new(supplier)}
    return result
  end

  def self.delete(id)
    sql = "DELETE FROM suppliers
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.find( id )
    sql = "SELECT * FROM suppliers WHERE id = $1"
    values = [id]
    supplier = SqlRunner.run(sql, values)
    result = Supplier.new(supplier.first )
    return result
  end

end
