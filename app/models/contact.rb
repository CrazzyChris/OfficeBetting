class Contact
  include ActiveModel::Model
  attr_accessor :name, :string
  attr_accessor :email, :string
  attr_accessor :content, :string

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :content
  validates_format_of :email,
    :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  validates_length_of :content, :maximum => 500

#Move it somewhere else. Where?
  def connect_to_db
    conn = PG.connect(dbname: 'test', user: 'obapplication', password: 'phoenix')
  end

  def create_table_in_db(tablename)
    conn = connect_to_db
    conn.exec("CREATE TABLE #{tablename} (id serial PRIMARY KEY, test varchar(20));")
  end

  def insert_data_to_table(tablename, value)
    conn = connect_to_db
    row_count = conn.exec("SELECT * FROM #{tablename}").cmdtuples
    id = row_count + 1
    conn.exec("INSERT INTO #{tablename} VALUES (#{id}, #{value});")
  end



end
