local previewers = require("telescope.previewers")
local Job = require("plenary.job")
local new_maker = function(filepath, bufnr, opts)
  filepath = vim.fn.expand(filepath)
  Job:new({
    command = "file",
    args = { "--mime-type", "-b", filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], "/")[1]
      if mime_type == "text" then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        -- maybe we want to write something to the buffer here
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
        end)
      end
    end
  }):sync()
end

require('telescope').setup{
    -- see :help telescope.setup()
    defaults = {
        -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/actions/init.lua
        mappings = {
            i = {
                ["<Esc>"] = require('telescope.actions').close,
                ["<Tab>"] = require('telescope.actions').move_selection_previous,
                ["<S-Tab>"] = require('telescope.actions').move_selection_next
            },
        },
        -- The below pattern is lua regex and not wildcard
        file_ignore_patterns = {"%.out", "%.pdf", "%.png", "%.ok"},
        -- prompt_prefix = "🔍 ",
        prompt_prefix = "🔭 ",
        path_display={"smart"},
        buffer_previewer_maker = new_maker,
    }
}
