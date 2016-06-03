defmodule ElixirProject.DynamicNumberPoolController do
  use ElixirProject.Web, :controller

  alias ElixirProject.DynamicNumberPool

  plug :scrub_params, "dynamic_number_pool" when action in [:create, :update]

  def index(conn, _params) do
    dynamic_number_pools = Repo.all(DynamicNumberPool)
    render(conn, "index.html", dynamic_number_pools: dynamic_number_pools)
  end

  def new(conn, _params) do
    changeset = DynamicNumberPool.changeset(%DynamicNumberPool{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"dynamic_number_pool" => dynamic_number_pool_params}) do
    changeset = DynamicNumberPool.changeset(%DynamicNumberPool{}, dynamic_number_pool_params)

    case Repo.insert(changeset) do
      {:ok, _dynamic_number_pool} ->
        conn
        |> put_flash(:info, "Dynamic number pool created successfully.")
        |> redirect(to: dynamic_number_pool_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    dynamic_number_pool = Repo.get!(DynamicNumberPool, id)
    render(conn, "show.html", dynamic_number_pool: dynamic_number_pool)
  end

  def edit(conn, %{"id" => id}) do
    dynamic_number_pool = Repo.get!(DynamicNumberPool, id)
    changeset = DynamicNumberPool.changeset(dynamic_number_pool)
    render(conn, "edit.html", dynamic_number_pool: dynamic_number_pool, changeset: changeset)
  end

  def update(conn, %{"id" => id, "dynamic_number_pool" => dynamic_number_pool_params}) do
    dynamic_number_pool = Repo.get!(DynamicNumberPool, id)
    changeset = DynamicNumberPool.changeset(dynamic_number_pool, dynamic_number_pool_params)

    case Repo.update(changeset) do
      {:ok, dynamic_number_pool} ->
        conn
        |> put_flash(:info, "Dynamic number pool updated successfully.")
        |> redirect(to: dynamic_number_pool_path(conn, :show, dynamic_number_pool))
      {:error, changeset} ->
        render(conn, "edit.html", dynamic_number_pool: dynamic_number_pool, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    dynamic_number_pool = Repo.get!(DynamicNumberPool, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(dynamic_number_pool)

    conn
    |> put_flash(:info, "Dynamic number pool deleted successfully.")
    |> redirect(to: dynamic_number_pool_path(conn, :index))
  end
end
