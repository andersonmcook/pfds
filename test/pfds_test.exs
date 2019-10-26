defmodule PFDSTest do
  use ExUnit.Case
  doctest PFDS

  [
    Stack
  ]
  |> Enum.map(&doctest(&1, import: true))

  test "greets the world" do
    assert PFDS.hello() == :world
  end
end
