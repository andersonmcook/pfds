defmodule Stack do
  @moduledoc """
  Stack implemented with a list
  """

  def new, do: []

  def empty?([]), do: true
  def empty?(_), do: false

  def cons(stack, item), do: [item | stack]

  def head([item | _]), do: item

  def tail([_ | items]), do: items

  # Exercise 2.1
  @doc """
  # Examples
    iex> suffixes([1, 2, 3, 4])
    [[1, 2, 3, 4], [2, 3, 4], [3, 4], [4], []]
  """
  # TODO: refine to only call functions defined in this module & find way to test big-O time/space
  def suffixes(stack) do
    stack
    |> Enum.scan(stack, fn _, acc -> tail(acc) end)
    |> cons(stack)
  end
end
