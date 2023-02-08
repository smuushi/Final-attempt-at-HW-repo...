require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_title(title)
    data = PlayDBConnection.instance.execute(<<-SQL,title)

      SELECT
        title
      FROM
        plays
      WHERE
        title like ?;

    SQL

    return data
  end

  def self.find_by_playwright(name)

    data = PlayDBConnection.instance.execute(<<-SQL, name)

      SELECT
        title
      FROM 
        plays
      JOIN playwrights
        ON plays.playwright_id = playwrights.id
      WHERE
        playwrights.name like ?

    SQL

    return data
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database. or ID was manually assigned during initialization." if self.id

    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL

    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end



class Playwright

  attr_accessor :id, :name, :birth_year
  # attr_reader :id

  def self.all 

    data_im_querying = PlayDBConnection.instance.execute("SELECT * FROM playwrights")

    data_im_querying.map { |info| Playwright.new(info) }

  end

  def self.find_by_name(name)

    data_im_querying = PlayDBConnection.instance.execute(<<-SQL, name)

      SELECT
        name
      FROM
        playwrights

    SQL

    return data_im_querying
  end
  
  def initialize(info_hash)

    @id = info_hash['id']
    @name = info_hash["name"]
    @birth_year = info_hash["birth_year"]

  end

  def create
    raise "already in DB uwu" if @id != nil

    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)

      INSERT INTO
        playwrights(name, birth_year)
      VALUES
        (?, ?)

    SQL

    @id = PlayDBConnection.instance.last_insert_row_id

  end

  def update

    if self.id == nil
      raise "#{self} is not in DB. No DB ID. Use create first to obtain row and ID"
    end

    data_to_update = PlayDBConnection.instance.execute(<<-SQL, @name, @birthyear, @id)

      UPDATE
        playwright
      SET
        name = ?, birthyear = ?
      WHERE
        id = ?

    SQL

  end


  def get_plays #should return all plays written by playwright

    if id == nil
      raise "playwright currently not in DB. No ID to point to any plays."
    end

    plays_query = PlayDBConnection.instance.execute(<<-SQL, @name)

      SELECT
        title
      FROM
        plays
      JOIN playwrights
        ON plays.playwright_id = playwrights.id
      WHERE
        playwrights.name LIKE ?

    SQL


  end


end
