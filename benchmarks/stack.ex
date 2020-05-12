defmodule Pfds.Benchmarks.Stack do
  def cons do
    cons = fn module ->
      fn items ->
        Enum.reduce(items, module.new(), fn curr, acc -> module.cons(acc, curr) end)
      end
    end

    Benchee.run(
      %{
        list_stack: cons.(LStack),
        tuple_stack: cons.(TStack),
        map_stack: cons.(MStack)
      },
      inputs: Map.new(thousand: 1..1000),
      memory_time: 2
    )

    ""
  end
end
