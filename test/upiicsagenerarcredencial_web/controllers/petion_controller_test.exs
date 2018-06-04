defmodule UpiicsagenerarcredencialWeb.PetionControllerTest do
  use UpiicsagenerarcredencialWeb.ConnCase

  alias Upiicsagenerarcredencial.Requests
  alias Upiicsagenerarcredencial.Requests.Petion

  @create_attrs %{boleta: "some boleta", estado: 42, id_constancia: "some id_constancia", id_transacion: "some id_transacion"}
  @update_attrs %{boleta: "some updated boleta", estado: 43, id_constancia: "some updated id_constancia", id_transacion: "some updated id_transacion"}
  @invalid_attrs %{boleta: nil, estado: nil, id_constancia: nil, id_transacion: nil}

  def fixture(:petion) do
    {:ok, petion} = Requests.create_petion(@create_attrs)
    petion
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all petions", %{conn: conn} do
      conn = get conn, petion_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create petion" do
    test "renders petion when data is valid", %{conn: conn} do
      conn = post conn, petion_path(conn, :create), petion: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, petion_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "boleta" => "some boleta",
        "estado" => 42,
        "id_constancia" => "some id_constancia",
        "id_transacion" => "some id_transacion"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, petion_path(conn, :create), petion: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update petion" do
    setup [:create_petion]

    test "renders petion when data is valid", %{conn: conn, petion: %Petion{id: id} = petion} do
      conn = put conn, petion_path(conn, :update, petion), petion: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, petion_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "boleta" => "some updated boleta",
        "estado" => 43,
        "id_constancia" => "some updated id_constancia",
        "id_transacion" => "some updated id_transacion"}
    end

    test "renders errors when data is invalid", %{conn: conn, petion: petion} do
      conn = put conn, petion_path(conn, :update, petion), petion: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete petion" do
    setup [:create_petion]

    test "deletes chosen petion", %{conn: conn, petion: petion} do
      conn = delete conn, petion_path(conn, :delete, petion)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, petion_path(conn, :show, petion)
      end
    end
  end

  defp create_petion(_) do
    petion = fixture(:petion)
    {:ok, petion: petion}
  end
end
