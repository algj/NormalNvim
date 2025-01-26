local function load_user_modules()
  local config_dir = vim.fn.stdpath('config')
  local user_dir = config_dir .. '/lua/user/'

  -- scan user directory
  local handle = vim.loop.fs_scandir(user_dir)
  if not handle then
    vim.notify('Failed to scan directory: ' .. user_dir, vim.log.levels.ERROR)
    return
  end

  -- loop through user directory
  while true do
    local name, typ = vim.loop.fs_scandir_next(handle)
    if not name then break end

    -- skip non-Lua files and 1-init.lua
    if typ == 'file' then
      if name:match('%.lua$') and name ~= '1-init.lua' then
        local module_name = name:gsub('%.lua$', '')
        local status, err = pcall(require, 'user.' .. module_name)
        if not status then
          vim.notify('Failed to load ' .. name .. ': ' .. err, vim.log.levels.ERROR)
        end
      end
    end
  end
end

load_user_modules()
