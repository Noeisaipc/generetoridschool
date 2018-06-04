defmodule Upiicsagenerarcredencial.Repo.Migrations.CreateAlumno do
  use Ecto.Migration

  def change do
    create table(:alumno) do
      add :boleta, :string
      add :password, :string
      add :nombre, :string
      add :appaterno, :string
      add :apmaterno, :string
      add :nivel, :integer
      add :creditos, :integer
      add :promedio, :float
      add :correo, :string
      add :statusinscripcion, :integer

      timestamps()
    end

  end
end
