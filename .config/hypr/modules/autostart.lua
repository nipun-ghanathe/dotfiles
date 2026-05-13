local vars = require('modules.vars')

hl.on('hyprland.start', function()
  -- Utilities
  hl.exec_cmd('waybar')
  hl.exec_cmd('hypridle')
  hl.exec_cmd('systemctl --user start hyprpolkitagent')

  -- Extras
  hl.exec_cmd('wl-paste --watch cliphist store')

  -- Apps
  hl.exec_cmd(vars.terminal, { workspace = '1 silent' })
  hl.exec_cmd(vars.browser, { workspace = '2 silent' })
end)
