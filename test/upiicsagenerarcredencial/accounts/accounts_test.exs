defmodule Upiicsagenerarcredencial.AccountsTest do
  use Upiicsagenerarcredencial.DataCase

  alias Upiicsagenerarcredencial.Accounts

  describe "alumno" do
    alias Upiicsagenerarcredencial.Accounts.Alumno

    @valid_attrs %{apmaterno: "some apmaterno", appaterno: "some appaterno", boleta: "some boleta", correo: "some correo", creditos: 42, nivel: 42, nombre: "some nombre", password: "some password", promedio: 120.5, statusinscripcion: 42}
    @update_attrs %{apmaterno: "some updated apmaterno", appaterno: "some updated appaterno", boleta: "some updated boleta", correo: "some updated correo", creditos: 43, nivel: 43, nombre: "some updated nombre", password: "some updated password", promedio: 456.7, statusinscripcion: 43}
    @invalid_attrs %{apmaterno: nil, appaterno: nil, boleta: nil, correo: nil, creditos: nil, nivel: nil, nombre: nil, password: nil, promedio: nil, statusinscripcion: nil}

    def alumno_fixture(attrs \\ %{}) do
      {:ok, alumno} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_alumno()

      alumno
    end

    test "list_alumno/0 returns all alumno" do
      alumno = alumno_fixture()
      assert Accounts.list_alumno() == [alumno]
    end

    test "get_alumno!/1 returns the alumno with given id" do
      alumno = alumno_fixture()
      assert Accounts.get_alumno!(alumno.id) == alumno
    end

    test "create_alumno/1 with valid data creates a alumno" do
      assert {:ok, %Alumno{} = alumno} = Accounts.create_alumno(@valid_attrs)
      assert alumno.apmaterno == "some apmaterno"
      assert alumno.appaterno == "some appaterno"
      assert alumno.boleta == "some boleta"
      assert alumno.correo == "some correo"
      assert alumno.creditos == 42
      assert alumno.nivel == 42
      assert alumno.nombre == "some nombre"
      assert alumno.password == "some password"
      assert alumno.promedio == 120.5
      assert alumno.statusinscripcion == 42
    end

    test "create_alumno/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_alumno(@invalid_attrs)
    end

    test "update_alumno/2 with valid data updates the alumno" do
      alumno = alumno_fixture()
      assert {:ok, alumno} = Accounts.update_alumno(alumno, @update_attrs)
      assert %Alumno{} = alumno
      assert alumno.apmaterno == "some updated apmaterno"
      assert alumno.appaterno == "some updated appaterno"
      assert alumno.boleta == "some updated boleta"
      assert alumno.correo == "some updated correo"
      assert alumno.creditos == 43
      assert alumno.nivel == 43
      assert alumno.nombre == "some updated nombre"
      assert alumno.password == "some updated password"
      assert alumno.promedio == 456.7
      assert alumno.statusinscripcion == 43
    end

    test "update_alumno/2 with invalid data returns error changeset" do
      alumno = alumno_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_alumno(alumno, @invalid_attrs)
      assert alumno == Accounts.get_alumno!(alumno.id)
    end

    test "delete_alumno/1 deletes the alumno" do
      alumno = alumno_fixture()
      assert {:ok, %Alumno{}} = Accounts.delete_alumno(alumno)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_alumno!(alumno.id) end
    end

    test "change_alumno/1 returns a alumno changeset" do
      alumno = alumno_fixture()
      assert %Ecto.Changeset{} = Accounts.change_alumno(alumno)
    end
  end
end
