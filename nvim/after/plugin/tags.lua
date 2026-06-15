local function rename_c_symbol()
	local stored_buffer = vim.api.nvim_get_current_buf()
	local old_name = vim.fn.expand("<cword>")
	local new_name = vim.fn.input("new name: ", old_name)

	if new_name == "" or new_name == old_name then
		print("Rename cancelled.")
		return
	end

	local cmd = string.format("cscope -L -d -F cscope.out -0 %s", vim.fn.shellescape(old_name))
	local cscope_out_list = vim.fn.systemlist(cmd)

	for _, cscope_line in ipairs(cscope_out_list) do
		local parts = vim.split(cscope_line, " ", { trimempty = true })
		if #parts >= 3 then
			local subs_file = parts[1]
			local subs_lnr = parts[3]

			local subs_buffer = vim.fn.bufnr(subs_file)
			local do_close = false

			if subs_buffer == -1 then
				vim.cmd("edit " .. vim.fn.fnameescape(subs_file))
				do_close = true
				subs_buffer = vim.api.nvim_get_current_buf()
			else
				vim.cmd("buffer " .. subs_buffer)
			end

			if subs_buffer ~= -1 then
				vim.cmd(string.format("%s,%ss/%s/%s/g", subs_lnr, subs_lnr, old_name, new_name))
				vim.cmd("write")
				if do_close then
					vim.cmd("bd")
				end
			end
		end
	end
	vim.api.nvim_set_current_buf(stored_buffer)
end

vim.keymap.set("n", "<leader>vrn", rename_c_symbol, { desc = "Rename Symbol" })
vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { desc = "show diagnostic" })
vim.keymap.set("n", "<leader>xx", "<cmd>cwindow<cr>", { desc = "Toggle Build Errors List" })

vim.keymap.set("n", "K", function()
	local cword = vim.fn.expand("<cword>")
	local original_win = vim.api.nvim_get_current_win()
	vim.cmd("split")
	local new_win = vim.api.nvim_get_current_win()
	vim.api.nvim_win_set_var(new_win, "is_definition_win", true)
	vim.cmd("silent! Cs f g " .. cword)
	pcall(vim.cmd, "cfirst")
	vim.api.nvim_set_current_win(original_win)
end, { desc = "Split definition (fallback to references)" })

vim.keymap.set("n", "<leader>q", function()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local ok, is_def_win = pcall(vim.api.nvim_win_get_var, win, "is_definition_win")
		if ok and is_def_win then
			vim.api.nvim_win_close(win, true)
		end
	end
end, { desc = "Close definition window" })

vim.keymap.set("n", "gd", function()
	vim.cmd("Cs f g")
end, { desc = "Go to Definition" })

vim.keymap.set("n", "gi", function()
	vim.cmd("Cs f c")
end, { desc = "Go to Implementation" })

vim.keymap.set("n", "<leader>fr", function()
	vim.cmd("Cs f s")
end, { desc = "Find References" })
