defmodule LStack do
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

defmodule MStack do
  @moduledoc """
  Stack implemented with a map
  """
  def new, do: %{head: 0}

  def empty?(%{head: 0}), do: true
  def empty?(_), do: false

  def cons(stack, item) do
    new_head = Map.get(stack, :head) + 1

    stack
    |> Map.put(:head, new_head)
    |> Map.put(new_head, item)
  end

  def head(stack) do
    Map.fetch!(stack, Map.fetch!(stack, :head))
  end

  def tail(stack) do
    stack
    |> Map.pop!(Map.fetch!(stack, :head))
    |> elem(1)
  end
end

defmodule TStack do
  @moduledoc """
  Stack implemented with tuples
  """
  def new, do: {nil}

  def empty?({nil}), do: true
  def empty?({_, {_}}), do: false

  def cons(stack, item), do: {item, stack}

  def head({nil}), do: raise("empty")
  def head({item, _}), do: item

  def tail({nil}), do: raise("empty")
  def tail({_, stack}), do: stack
end
