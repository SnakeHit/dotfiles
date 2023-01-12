require('telescope').setup{
    -- see :help telescope.setup()
    defaults = {
        mappings = {
            i = {
                ["<Esc>"] = require('telescope.actions').close
            }
        },
        -- The below pattern is lua regex and not wildcard
        file_ignore_patterns = {"%.out", "%.pdf", "%.png"},
        prompt_prefix = "🔍 ",
    }
}
