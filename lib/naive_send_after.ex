defmodule NSA do
  @moduledoc """
  Documentation for Naive Send After - not a NSA tool :)
  """

  def send_after(pid, msg, time, opts \\ [:noconnect]) do
    sleeper = fn ->
      receive do
      after
        time ->
          Process.send(pid, msg, opts)
      end
    end

    Process.spawn(sleeper, [])
  end
end
