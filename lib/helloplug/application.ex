defmodule Helloplug.Application do
  use Application
  import Supervisor.Spec

  def start(_type, _args) do
    IO.puts "starting Helloplug.Application!"
    processes = [
      supervisor(Helloplug.Repo, [])
    ]

    opts = [strategy: :one_for_one]

    Supervisor.start_link(processes, opts)
  end
end
