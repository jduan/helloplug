defmodule Helloplug.Routing.Main do
  use Helloplug.Routing.Router

  @user_router_options Helloplug.Routing.UserRouter.init([])

  def route("GET", ["users" | _path], conn) do
    Helloplug.Routing.UserRouter.call(conn, @user_router_options)
  end

  def route("GET", ["hello"], conn) do
    conn
    |> Plug.Conn.send_resp(200, "Hello, world!")
  end

  def route(_method, _path, conn) do
    # catch all routes
    conn
    |> Plug.Conn.send_resp(404, "Couldn't find that page, sorry!")
  end
end
