# update plugins
update:
  nvim -c "lua vim.pack.update()"

# restore plugins from lockfile
restore:
  nvim -c "lua vim.pack.update(nil, { target = 'lockfile' })"
