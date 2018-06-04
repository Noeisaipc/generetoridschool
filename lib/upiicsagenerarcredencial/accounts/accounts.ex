defmodule Upiicsagenerarcredencial.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Upiicsagenerarcredencial.Repo

  alias Upiicsagenerarcredencial.Accounts.Alumno

  @doc """
  Returns the list of alumno.

  ## Examples

      iex> list_alumno()
      [%Alumno{}, ...]

  """
  def list_alumno do
    Repo.all(Alumno)
  end

  @doc """
  Gets a single alumno.

  Raises `Ecto.NoResultsError` if the Alumno does not exist.

  ## Examples

      iex> get_alumno!(123)
      %Alumno{}

      iex> get_alumno!(456)
      ** (Ecto.NoResultsError)

  """
  def get_alumno!(id), do: Repo.get!(Alumno, id)

  @doc """
  Creates a alumno.

  ## Examples

      iex> create_alumno(%{field: value})
      {:ok, %Alumno{}}

      iex> create_alumno(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_alumno(attrs \\ %{}) do
    %Alumno{}
    |> Alumno.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a alumno.

  ## Examples

      iex> update_alumno(alumno, %{field: new_value})
      {:ok, %Alumno{}}

      iex> update_alumno(alumno, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_alumno(%Alumno{} = alumno, attrs) do
    alumno
    |> Alumno.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Alumno.

  ## Examples

      iex> delete_alumno(alumno)
      {:ok, %Alumno{}}

      iex> delete_alumno(alumno)
      {:error, %Ecto.Changeset{}}

  """
  def delete_alumno(%Alumno{} = alumno) do
    Repo.delete(alumno)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking alumno changes.

  ## Examples

      iex> change_alumno(alumno)
      %Ecto.Changeset{source: %Alumno{}}

  """
  def change_alumno(%Alumno{} = alumno) do
    Alumno.changeset(alumno, %{})
  end

  def get_status_by_boleta(boleta) do
    case Repo.get_by(Alumno, boleta: boleta) do
      nil ->
        {:error, "Alumno sin boleta"}
      user ->
        {:ok, user.statusinscripcion}
    end
  end


  def login(boleta,password)  do
    with {:ok, alumno} <- get_by_boleta(boleta) do
      if alumno.password == password do
        {:ok, alumno}
      else
        {:error, "Invalid credentials"}
      end
    else
      {:error, error} ->
        {:error, error}
    end
  end

  def get_by_boleta(boleta) do
    case Repo.get_by(Alumno, boleta: boleta) do
      nil ->
        {:error, "User not found"}
      alumno ->
        {:ok, alumno}
    end
  end




end
