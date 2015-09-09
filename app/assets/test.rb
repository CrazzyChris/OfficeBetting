require 'pg'

def insert_data(tablename, value)
  conn = PG.connect(dbname: 'test', user: 'obapplication', password: 'phoenix')
  row_count = conn.exec("SELECT * FROM #{tablename}").cmdtuples
  id = row_count + 1
  conn.exec("INSERT INTO #{tablename} VALUES (#{id}, 'testing')")
end

insert_data("test1", 'testing')
