defmodule PFDSTest do
  use ExUnit.Case
  doctest PFDS

  test "greets the world" do
    assert PFDS.hello() == :world
  end
end
