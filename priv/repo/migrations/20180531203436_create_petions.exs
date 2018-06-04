defmodule Upiicsagenerarcredencial.Repo.Migrations.CreatePetions do
  use Ecto.Migration

  def change do
    create table(:petions) do
      add :boleta, :string
      add :estado, :integer
      add :id_transacion, :string
      add :id_constancia, :string

      timestamps()
    end

    create unique_index(:petions, [:boleta])
  end
end
