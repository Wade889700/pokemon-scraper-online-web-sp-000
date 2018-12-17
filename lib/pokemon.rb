class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all =[]
  def initialize(pokemon)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
    @hp = 60
    @@all << self
  end

  def self.all 
    @@all 
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id = #{id}").flatten
  end

  def alter_hp(new_hp)
    db.execute("UPDATE pokemon SET hp = #{new_hp} WHERE id = #{self.id}")
  end


end
