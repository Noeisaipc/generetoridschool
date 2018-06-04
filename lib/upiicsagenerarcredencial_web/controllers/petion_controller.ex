defmodule UpiicsagenerarcredencialWeb.PetionController do
  use UpiicsagenerarcredencialWeb, :controller

  alias Upiicsagenerarcredencial.Requests
  alias Upiicsagenerarcredencial.Requests.Petion
  

  action_fallback UpiicsagenerarcredencialWeb.FallbackController

  def index(conn, _params) do
    petions = Requests.list_petions()
    render(conn, "index.json", petions: petions)
  end

  def create(conn, %{"petion" => petion_params}) do
    with {:ok, %Petion{} = petion} <- Requests.create_petion(petion_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", petion_path(conn, :show, petion))
      |> render("show.json", petion: petion)
    end
  end

  def show(conn, %{"id" => id}) do
    petion = Requests.get_petion!(id)
    render(conn, "show.json", petion: petion)
  end

  def update(conn, %{"id" => id, "petion" => petion_params}) do
    petion = Requests.get_petion!(id)
    with {:ok, %Petion{} = petion} <- Requests.update_petion(petion, petion_params) do
      render(conn, "show.json", petion: petion)
    end
  end

  def delete(conn, %{"id" => id}) do
    petion = Requests.get_petion!(id)
    with {:ok, %Petion{}} <- Requests.delete_petion(petion) do
      send_resp(conn, :no_content, "")
    end
  end
end
