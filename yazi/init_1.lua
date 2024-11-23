require("full-border"):setup()

require("git"):setup()

require("copy-file-contents"):setup({
	clipboard_cmd = "default",
	append_char = "\n",
	notification = true,
})

require("bookmarks"):setup({
	last_directory = { enable = false, persist = false },
	persist = "all",
	desc_format = "full",
	file_pick_mode = "hover",
	notify = {
		enable = true,
		timeout = 1,
		message = {
			new = "New bookmark '<key>' -> '<folder>'",
			delete = "Deleted bookmark in '<key>'",
			delete_all = "Deleted all bookmarks",
		},
	},
})
