defmodule NSATest do
  use ExUnit.Case

  test "receive a message after a specified interval of time" do
    {mcrsec, _pid} = :timer.tc(fn -> NSA.send_after(self(), :hi, 1000) end)
    refute_receive :hi, 10
    assert mcrsec / 1000 < 1

    assert_receive :hi, 1001

    NSA.send_after(self(), :hello, 100)
    refute_receive :hello, 5

    assert_receive :hello, 101
  end
end
