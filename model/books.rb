class Books

  def insert(client, args)
    sql = %{insert into books (title, number, authors, isbn, user) values (?, ?, ?, ?, ?)}
    stmt = client.prepare(sql)
    client.query("begin");
    stmt.execute(args[0], args[1], args[2], args[3], args[4])
    client.query("commit");
  end  
  
end