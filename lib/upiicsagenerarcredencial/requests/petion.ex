defmodule Upiicsagenerarcredencial.Requests.Petion do
  use Ecto.Schema
  import Ecto.Changeset


  schema "petions" do
    field :boleta, :string
    field :estado, :integer, default: 0
    field :id_constancia, :string, default: ""
    field :id_transacion, :string, default: ""

    timestamps()
  end

  @doc false
  def changeset(petion, attrs) do
    petion
    |> cast(attrs, [:boleta, :estado, :id_transacion, :id_constancia])
    |> validate_required([:boleta])
    |> unique_constraint(:boleta)
  end
end
