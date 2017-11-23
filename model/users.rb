class Users
  
  def insert(client, args)
    sql = %{insert into users (userid, password, name) values (?, ?, ?)}
    stmt = client.prepare(sql)
    client.query("begin");
    stmt.execute(args[0], args[1], args[2])
    client.query("commit");
  end
  
end