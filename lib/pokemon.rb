require "pry"
class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id
  
  def initialize(id: nil, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?);
    SQL
    #binding.pry
    db[:conn].execute(sql, self.name, self.type)
    @id = db[:conn].execute("SELECT last_insert_rowid() FROM pokemon")
  end
end
