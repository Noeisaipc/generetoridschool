defmodule Upiicsagenerarcredencial.RequestsTest do
  use Upiicsagenerarcredencial.DataCase

  alias Upiicsagenerarcredencial.Requests

  describe "petions" do
    alias Upiicsagenerarcredencial.Requests.Petion

    @valid_attrs %{boleta: "some boleta", estado: 42, id_constancia: "some id_constancia", id_transacion: "some id_transacion"}
    @update_attrs %{boleta: "some updated boleta", estado: 43, id_constancia: "some updated id_constancia", id_transacion: "some updated id_transacion"}
    @invalid_attrs %{boleta: nil, estado: nil, id_constancia: nil, id_transacion: nil}

    def petion_fixture(attrs \\ %{}) do
      {:ok, petion} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Requests.create_petion()

      petion
    end

    test "list_petions/0 returns all petions" do
      petion = petion_fixture()
      assert Requests.list_petions() == [petion]
    end

    test "get_petion!/1 returns the petion with given id" do
      petion = petion_fixture()
      assert Requests.get_petion!(petion.id) == petion
    end

    test "create_petion/1 with valid data creates a petion" do
      assert {:ok, %Petion{} = petion} = Requests.create_petion(@valid_attrs)
      assert petion.boleta == "some boleta"
      assert petion.estado == 42
      assert petion.id_constancia == "some id_constancia"
      assert petion.id_transacion == "some id_transacion"
    end

    test "create_petion/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Requests.create_petion(@invalid_attrs)
    end

    test "update_petion/2 with valid data updates the petion" do
      petion = petion_fixture()
      assert {:ok, petion} = Requests.update_petion(petion, @update_attrs)
      assert %Petion{} = petion
      assert petion.boleta == "some updated boleta"
      assert petion.estado == 43
      assert petion.id_constancia == "some updated id_constancia"
      assert petion.id_transacion == "some updated id_transacion"
    end

    test "update_petion/2 with invalid data returns error changeset" do
      petion = petion_fixture()
      assert {:error, %Ecto.Changeset{}} = Requests.update_petion(petion, @invalid_attrs)
      assert petion == Requests.get_petion!(petion.id)
    end

    test "delete_petion/1 deletes the petion" do
      petion = petion_fixture()
      assert {:ok, %Petion{}} = Requests.delete_petion(petion)
      assert_raise Ecto.NoResultsError, fn -> Requests.get_petion!(petion.id) end
    end

    test "change_petion/1 returns a petion changeset" do
      petion = petion_fixture()
      assert %Ecto.Changeset{} = Requests.change_petion(petion)
    end
  end
end
