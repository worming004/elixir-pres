defmodule Stackmemo.GenTest do
  use ExUnit.Case

  test "should be start_linkialized with empty list" do
    {:ok, process} = Stackmemo.Gen.start_link(:nawak)
    assert Stackmemo.Gen.is_empty(process)
  end

  test "should add item" do
    {:ok, stack} = Stackmemo.Gen.start_link(:truc)

    assert :ok =
             stack
             |> Stackmemo.Gen.push("foo")
  end

  test "shoud pop an item" do
    {:ok, process} = Stackmemo.Gen.start_link(:nawak)

    :ok =
      process
      |> Stackmemo.Gen.push("foo")

    assert item =
             process
             |> Stackmemo.Gen.pop()

    assert item == "foo"
  end
end
