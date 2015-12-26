defmodule Router do
  defmacro __using__(opts) do
    quote do
      def init(options) do
        options
      end

      def call(conn, _opts) do
        route(conn.method, conn.path_info, conn)
      end
    end
  end
end

defmodule UserRouter do
  use Router

  def route("GET", ["users", user_id], conn) do
    # this route is for /users/<user_id>
    conn
    |> Plug.Conn.send_resp(200, "You requested user #{user_id}")
  end

  def route("POST", ["users"], conn) do
    # insert to db etc
  end

  def route(_method, _path, conn) do
    # catch all routes
    conn
    |> Plug.Conn.send_resp(404, "Couldn't find that page, sorry!")
  end
end

defmodule Helloplug do
  use Router

  @user_router_options UserRouter.init([])

  def route("GET", ["users" | path], conn) do
    UserRouter.call(conn, @user_router_options)
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
