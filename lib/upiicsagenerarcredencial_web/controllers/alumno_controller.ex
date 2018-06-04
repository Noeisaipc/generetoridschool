defmodule UpiicsagenerarcredencialWeb.AlumnoController do
  use UpiicsagenerarcredencialWeb, :controller

  alias Upiicsagenerarcredencial.Accounts
  alias Upiicsagenerarcredencial.Accounts.Alumno

  plug :authenticate when action in [:index, :show]

  def index(conn, _params) do
    alumno = Accounts.list_alumno()
    render(conn, "index.html", alumno: alumno)
  end

  def new(conn, _params) do
    changeset = Accounts.change_alumno(%Alumno{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"alumno" => alumno_params}) do
    case Accounts.create_alumno(alumno_params) do
      {:ok, alumno} ->
        conn
        |> put_flash(:info, "Alumno created successfully.")
        |> redirect(to: alumno_path(conn, :show, alumno))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    alumno = Accounts.get_alumno!(id)
    render(conn, "show.html", alumno: alumno)
  end

  def edit(conn, %{"id" => id}) do
    alumno = Accounts.get_alumno!(id)
    changeset = Accounts.change_alumno(alumno)
    render(conn, "edit.html", alumno: alumno, changeset: changeset)
  end

  def update(conn, %{"id" => id, "alumno" => alumno_params}) do
    alumno = Accounts.get_alumno!(id)

    case Accounts.update_alumno(alumno, alumno_params) do
      {:ok, alumno} ->
        conn
        |> put_flash(:info, "Alumno updated successfully.")
        |> redirect(to: alumno_path(conn, :show, alumno))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", alumno: alumno, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    alumno = Accounts.get_alumno!(id)
    {:ok, _alumno} = Accounts.delete_alumno(alumno)

    conn
    |> put_flash(:info, "Alumno deleted successfully.")
    |> redirect(to: alumno_path(conn, :index))
  end


  defp authenticate(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in to access that page")
      |> redirect(to: page_path(conn, :index))
      |> halt()
    end
  end

end
