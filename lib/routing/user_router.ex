defmodule Helloplug.Routing.UserRouter do
  use Helloplug.Routing.Router

  def route("GET", ["users", user_id], conn) do
    # this route is for /users/<user_id>
    case Helloplug.Repo.get(Helloplug.Models.User, user_id) do
      nil ->
        conn
        |> Plug.Conn.send_resp(404, "User ID #{user_id} not found, sorry!")
      user ->
        page_contents = EEx.eval_file("templates/show_user.eex", [user: user])
        conn
        |> Plug.Conn.put_resp_content_type("text/html")
        |> Plug.Conn.send_resp(200, page_contents)
    end
  end

  def route("POST", ["users"], _conn) do
    # insert to db etc
  end

  def route(_method, _path, conn) do
    # catch all routes
    conn
    |> Plug.Conn.send_resp(404, "Couldn't find that page, sorry!")
  end
end
