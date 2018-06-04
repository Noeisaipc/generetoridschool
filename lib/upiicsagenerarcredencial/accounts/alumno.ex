defmodule Upiicsagenerarcredencial.Accounts.Alumno do
  use Ecto.Schema
  import Ecto.Changeset


  schema "alumno" do
    field :apmaterno, :string
    field :appaterno, :string
    field :boleta, :string
    field :correo, :string
    field :creditos, :integer
    field :nivel, :integer
    field :nombre, :string
    field :password, :string
    field :promedio, :float
    field :statusinscripcion, :integer

    timestamps()
  end

  @doc false
  def changeset(alumno, attrs) do
    alumno
    |> cast(attrs, [:boleta, :password, :nombre, :appaterno, :apmaterno, :nivel, :creditos, :promedio, :correo, :statusinscripcion])
    |> validate_required([:boleta, :password, :nombre, :appaterno, :apmaterno, :nivel, :creditos, :promedio, :correo, :statusinscripcion])
  end
end
