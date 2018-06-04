defmodule Upiicsagenerarcredencial.Requests do
  @moduledoc """
  The Requests context.
  """

  import Ecto.Query, warn: false
  alias Upiicsagenerarcredencial.Repo

  alias Upiicsagenerarcredencial.Requests.Petion

  @doc """
  Returns the list of petions.

  ## Examples

      iex> list_petions()
      [%Petion{}, ...]

  """
  def list_petions do
    Repo.all(Petion)
  end

  @doc """
  Gets a single petion.

  Raises `Ecto.NoResultsError` if the Petion does not exist.

  ## Examples

      iex> get_petion!(123)
      %Petion{}

      iex> get_petion!(456)
      ** (Ecto.NoResultsError)

  """
  def get_petion!(id), do: Repo.get!(Petion, id)

  @doc """
  Creates a petion.

  ## Examples

      iex> create_petion(%{field: value})
      {:ok, %Petion{}}

      iex> create_petion(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_petion(attrs \\ %{}) do
    %Petion{}
    |> Petion.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a petion.

  ## Examples

      iex> update_petion(petion, %{field: new_value})
      {:ok, %Petion{}}

      iex> update_petion(petion, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_petion(%Petion{} = petion, attrs) do
    petion
    |> Petion.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Petion.

  ## Examples

      iex> delete_petion(petion)
      {:ok, %Petion{}}

      iex> delete_petion(petion)
      {:error, %Ecto.Changeset{}}

  """
  def delete_petion(%Petion{} = petion) do
    Repo.delete(petion)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking petion changes.

  ## Examples

      iex> change_petion(petion)
      %Ecto.Changeset{source: %Petion{}}

  """
  def change_petion(%Petion{} = petion) do
    Petion.changeset(petion, %{})
  end

  def get_status(boleta) do
      case Repo.get_by(Petion, boleta: boleta) do
        nil ->
          {:error, "Alumno sin tramite"}
        petion ->
          {:ok, petion.estado}
      end
  end

  def get_current_petion(boleta) do
    case Repo.get_by(Petion, boleta: boleta) do
      nil ->
        {:error, "Alumno sin tramite"}
      petion ->
        {:ok, petion}
    end
  end

  def update_petion_pago(boleta,new_step) do
    with {:ok, petion} <- get_current_petion(boleta) do
      petion_update = Ecto.Changeset.change petion, estado: new_step, id_transacion: "1542484"
      Repo.update petion_update
    else 
      {:error, error} -> {:errot , "#{error}"}
    end
  end


  def update_petion_constancia(boleta,new_step) do
    with {:ok, petion} <- get_current_petion(boleta) do
      petion_update = Ecto.Changeset.change petion, estado: new_step , id_constancia: "154875115"
      Repo.update petion_update
    else 
      {:error, error} -> {:errot , "#{error}"}
    end
  end

  def update_petion_process(boleta,new_step) do
    with {:ok, petion} <- get_current_petion(boleta) do
      petion_update = Ecto.Changeset.change petion, estado: new_step
      Repo.update petion_update
    else 
      {:error, error} -> {:errot , "#{error}"}
    end
  end

  def create(petion) do
    Repo.insert(petion)
  end

end
