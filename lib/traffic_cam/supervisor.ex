defmodule TrafficCam.Supervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @impl true
  def init(_opts) do
    children = [
      {Tortoise.Connection,
       [
         client_id: TrafficCam,
         server: {Tortoise.Transport.Tcp, host: 'growi.local', port: 1883},
         handler: {TrafficCam.MqttHandler, []},
         subscriptions: [{"traffic", 0}]
       ]}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
