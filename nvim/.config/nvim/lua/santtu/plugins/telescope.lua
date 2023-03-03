local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

-- import telescope-ui-select safely
local themes_setup, themes = pcall(require, "telescope.themes")
if not themes_setup then
	return
end

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-u>"] = actions.move_selection_previous,
				["<C-e>"] = actions.move_selection_next,
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
			n = {
				["u"] = actions.move_selection_previous,
				["e"] = actions.move_selection_next,
			},
		},
		extensions = {
			["ui-select"] = {
				themes.get_dropdown({}),
			},
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")
telescope.load_extension("file_browser")
