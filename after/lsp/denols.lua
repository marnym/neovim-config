--- @type vim.lsp.Config
return {
    root_dir = function(bufnr, on_dir)
        local root_markers = { { 'deno.lock' }, { '.git' } }
        -- exclude non-deno projects (npm, yarn, pnpm, bun)
        local non_deno_path = vim.fs.root(
            bufnr,
            { 'yarn.lock', 'pnpm-lock.yaml', 'bun.lockb', 'bun.lock' }
        )
        local project_root = vim.fs.root(bufnr, root_markers)
        if non_deno_path and (not project_root or #non_deno_path >= #project_root) then
            return
        end
        -- We fallback to the current working directory if no project root is found
        on_dir(project_root or vim.fn.getcwd())
    end,
}
