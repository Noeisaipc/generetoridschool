defmodule UpiicsagenerarcredencialWeb.AlumnoControllerTest do
  use UpiicsagenerarcredencialWeb.ConnCase

  alias Upiicsagenerarcredencial.Accounts

  @create_attrs %{apmaterno: "some apmaterno", appaterno: "some appaterno", boleta: "some boleta", correo: "some correo", creditos: 42, nivel: 42, nombre: "some nombre", password: "some password", promedio: 120.5, statusinscripcion: 42}
  @update_attrs %{apmaterno: "some updated apmaterno", appaterno: "some updated appaterno", boleta: "some updated boleta", correo: "some updated correo", creditos: 43, nivel: 43, nombre: "some updated nombre", password: "some updated password", promedio: 456.7, statusinscripcion: 43}
  @invalid_attrs %{apmaterno: nil, appaterno: nil, boleta: nil, correo: nil, creditos: nil, nivel: nil, nombre: nil, password: nil, promedio: nil, statusinscripcion: nil}

  def fixture(:alumno) do
    {:ok, alumno} = Accounts.create_alumno(@create_attrs)
    alumno
  end

  describe "index" do
    test "lists all alumno", %{conn: conn} do
      conn = get conn, alumno_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Alumno"
    end
  end

  describe "new alumno" do
    test "renders form", %{conn: conn} do
      conn = get conn, alumno_path(conn, :new)
      assert html_response(conn, 200) =~ "New Alumno"
    end
  end

  describe "create alumno" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, alumno_path(conn, :create), alumno: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == alumno_path(conn, :show, id)

      conn = get conn, alumno_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Alumno"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, alumno_path(conn, :create), alumno: @invalid_attrs
      assert html_response(conn, 200) =~ "New Alumno"
    end
  end

  describe "edit alumno" do
    setup [:create_alumno]

    test "renders form for editing chosen alumno", %{conn: conn, alumno: alumno} do
      conn = get conn, alumno_path(conn, :edit, alumno)
      assert html_response(conn, 200) =~ "Edit Alumno"
    end
  end

  describe "update alumno" do
    setup [:create_alumno]

    test "redirects when data is valid", %{conn: conn, alumno: alumno} do
      conn = put conn, alumno_path(conn, :update, alumno), alumno: @update_attrs
      assert redirected_to(conn) == alumno_path(conn, :show, alumno)

      conn = get conn, alumno_path(conn, :show, alumno)
      assert html_response(conn, 200) =~ "some updated apmaterno"
    end

    test "renders errors when data is invalid", %{conn: conn, alumno: alumno} do
      conn = put conn, alumno_path(conn, :update, alumno), alumno: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Alumno"
    end
  end

  describe "delete alumno" do
    setup [:create_alumno]

    test "deletes chosen alumno", %{conn: conn, alumno: alumno} do
      conn = delete conn, alumno_path(conn, :delete, alumno)
      assert redirected_to(conn) == alumno_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, alumno_path(conn, :show, alumno)
      end
    end
  end

  defp create_alumno(_) do
    alumno = fixture(:alumno)
    {:ok, alumno: alumno}
  end
end
