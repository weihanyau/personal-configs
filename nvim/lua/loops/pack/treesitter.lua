local hooks = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and (kind == 'install' or kind == 'update') then
        if not ev.data.active then
            vim.cmd.packadd("nvim-treesitter")
        end 
        vim.cmd("TSUpdate")
    end
end

vim.api.nvim_create_autocmd('PackChanged', { callback = hooks })

vim.pack.add({
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = '4916d6592ede8c07973490d9322f187e07dfefac' }
})

-- local ensure_installed_ts = {
--     'c',
--     'lua',
--     'markdown',
--     'markdown_inline',
--     'query',
--     'vim',
--     'vimdoc',
--     -- NOTE: the above are natively installed since neovim 0.12
--     'bash',
--     'diff',
--     'dockerfile',
--     'gitignore',
--     'git_config',
--     'luadoc',
--     'regex',
--     'toml',
--     'yaml',
--     'csv',
--     'java',
--     'python',
--     'html',
--     'css',
--     'javascript',
--     'typescript',
--     'json',
--     'latex',
-- }
--
-- local isnt_installed = function(lang) return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0 end
-- local to_install = vim.tbl_filter(isnt_installed, ensure_installed_ts)
-- if #to_install > 0 then require('nvim-treesitter').install(to_install) end

