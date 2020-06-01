{application, 'mailbox', [
	{description, "New project"},
	{vsn, "0.1.0"},
	{modules, ['mailbox','mailbox_app','mailbox_sup']},
	{registered, [mailbox_sup]},
	{applications, [kernel,stdlib]},
	{mod, {mailbox_app, []}},
	{env, []}
]}.