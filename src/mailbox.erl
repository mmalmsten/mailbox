-module(mailbox).

-export([start/0]).

-export([init/0]).

start() -> 
	spawn_link(?MODULE, init, []), 
	{ok, self()}.

init() -> 
	io:format("Hello, I'm ~p~n",[self()]),
	loop().

loop() ->
	receive
		{Node, Msg} when is_binary(Msg) -> 
			io:format("~p says: ~p~n",[Node, Msg]),
			Node ! <<"You said ", Msg/binary>>,
			loop();
		Msg -> 
			io:format("~p~n",[Msg]), 
			loop()
	end.