# Helloplug

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add helloplug to your list of dependencies in `mix.exs`:

        def deps do
          [{:helloplug, "~> 0.0.1"}]
        end

  2. Ensure helloplug is started before your application:

        def application do
          [applications: [:helloplug]]
        end

## Start the server
{:ok, pid} = Plug.Adapters.Cowboy.http Helloplug.Routing.Main,, []
