require 'pg'

class PreOrder
  def initialize(params)
    @first_name = params['first_name']
    @last_name = params['last_name']
    @address = params['address']
    @size = params['size'].to_i
    @quantity = params['quantity'].to_i
  end

  def save
    db = PG.connect(dbname: 'shoes', host: 'localhost')
    sql = "INSERT INTO orders (
    first_name,
    last_name,
    address,
    size,
    quantity ) VALUES (
      '#{@first_name}',
      '#{@last_name}',
      '#{@address}',
      #{@size}
      #{@quantity}
    )"
    db.exec(sql)
    db.close
  end

  def self.all
    db = PG.connect(dbname: 'shoes', host: 'localhost')
    sql = 'SELECT * FROM orders'
    orders = db.exec(sql)
    result = orders.map { |order| PreOrder.new(order) }
    db.close
    result
  end
end
