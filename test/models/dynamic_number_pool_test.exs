defmodule ElixirProject.DynamicNumberPoolTest do
  use ElixirProject.ModelCase

  alias ElixirProject.DynamicNumberPool

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = DynamicNumberPool.changeset(%DynamicNumberPool{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = DynamicNumberPool.changeset(%DynamicNumberPool{}, @invalid_attrs)
    refute changeset.valid?
  end
end
