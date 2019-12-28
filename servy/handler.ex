defmodule Servy.Handler do
  def handle(request) do
    request
    |> parse
    |> router
    |> format_response
  end

  def parse(request) do
    [method, path, _] =
      request
      |> String.split("\n")
      |> List.first()
      |> String.split(" ")

    %{method: "GET", path: "/wildthings", resp_body: ""}
  end

  def router(conv) do
    # TODO: Create a new map that also has the reponse body:
    conv = %{method: "GET", path: "/wildthings", resp_body: "Bears, Lions, Tigers"}
  end

  def format_response(conv) do
    # TODO: Use values in the map to create an HTTP response string:
    """
    HTTP/1.1 200 OK
    Content-Type: text/html
    Content-Lenght: 20

    Bears, Lions, Tigers
    """
  end
end

request = """
GET /wildthings HTTP/1.1
Host: example.com
User-Agent: ExampleBrowser/1.0
Accept: */*

"""

response = Servy.Handler.handle(request)

IO.puts(response)
