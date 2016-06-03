defmodule ElixirProject.DynamicNumberPoolControllerTest do
  use ElixirProject.ConnCase

  alias ElixirProject.DynamicNumberPool
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, dynamic_number_pool_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing dynamic number pools"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, dynamic_number_pool_path(conn, :new)
    assert html_response(conn, 200) =~ "New dynamic number pool"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, dynamic_number_pool_path(conn, :create), dynamic_number_pool: @valid_attrs
    assert redirected_to(conn) == dynamic_number_pool_path(conn, :index)
    assert Repo.get_by(DynamicNumberPool, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, dynamic_number_pool_path(conn, :create), dynamic_number_pool: @invalid_attrs
    assert html_response(conn, 200) =~ "New dynamic number pool"
  end

  test "shows chosen resource", %{conn: conn} do
    dynamic_number_pool = Repo.insert! %DynamicNumberPool{}
    conn = get conn, dynamic_number_pool_path(conn, :show, dynamic_number_pool)
    assert html_response(conn, 200) =~ "Show dynamic number pool"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, dynamic_number_pool_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    dynamic_number_pool = Repo.insert! %DynamicNumberPool{}
    conn = get conn, dynamic_number_pool_path(conn, :edit, dynamic_number_pool)
    assert html_response(conn, 200) =~ "Edit dynamic number pool"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    dynamic_number_pool = Repo.insert! %DynamicNumberPool{}
    conn = put conn, dynamic_number_pool_path(conn, :update, dynamic_number_pool), dynamic_number_pool: @valid_attrs
    assert redirected_to(conn) == dynamic_number_pool_path(conn, :show, dynamic_number_pool)
    assert Repo.get_by(DynamicNumberPool, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    dynamic_number_pool = Repo.insert! %DynamicNumberPool{}
    conn = put conn, dynamic_number_pool_path(conn, :update, dynamic_number_pool), dynamic_number_pool: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit dynamic number pool"
  end

  test "deletes chosen resource", %{conn: conn} do
    dynamic_number_pool = Repo.insert! %DynamicNumberPool{}
    conn = delete conn, dynamic_number_pool_path(conn, :delete, dynamic_number_pool)
    assert redirected_to(conn) == dynamic_number_pool_path(conn, :index)
    refute Repo.get(DynamicNumberPool, dynamic_number_pool.id)
  end
end
