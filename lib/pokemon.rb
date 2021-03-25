class Pokemon # scraping the info and adding it into database

    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(id:, name:, type:, db:) # must be key/value pairs
        @id = id # getting data from database, always going to be key/value pairs of arguments, we are expecting it to be a key/value pair, its coming in from tests or database
        @name = name # assigning the name to whatever :name key value is 
        @type = type
        @db = db
    end 

    def self.save(name, type, db) # pokemon not saved until we write this method, scraping them from website page, but scraper wants us to have a save method (look at spec for scraper)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end 

    def self.find(id, db)# find methods are always class methods, bc we are searching through the whole class 
        # find method always take in argument of id
        find_pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten # makes multiple arrays into 1 array
        Pokemon.new(id: id, name: find_pokemon[1], type: find_pokemon[2], db: db) # expecting certain syntax when passing in info, need key and value
    end 

end