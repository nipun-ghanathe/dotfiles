local vars = require('modules.vars')

local mod = 'SUPER'

local left = 'h'
local down = 'j'
local up = 'k'
local right = 'l'

-- Reload config
hl.bind(mod .. ' + SHIFT + R', hl.dsp.exec_cmd('hyprctl reload'))

-- Launch apps
hl.bind(mod .. ' + RETURN', hl.dsp.exec_cmd(vars.terminal))
hl.bind(mod .. ' + D', hl.dsp.exec_cmd(vars.menu))
hl.bind(mod .. ' + E', hl.dsp.exec_cmd(vars.file_browser))
hl.bind(mod .. ' + O', hl.dsp.exec_cmd(vars.browser))

-- Actions on windows
hl.bind(mod .. ' + Q', hl.dsp.window.close())
hl.bind(mod .. ' + F', hl.dsp.window.fullscreen({ action = 'toggle' }))
hl.bind(mod .. ' + SPACE', hl.dsp.window.float({ action = 'toggle' }))

-- Layout stuff
hl.bind(mod .. ' + T', hl.dsp.layout('togglesplit'))
hl.bind(mod .. ' + G', hl.dsp.group.toggle())
hl.bind(mod .. ' + SHIFT + L', hl.dsp.window.pin())
hl.bind(mod .. ' + SHIFT + P', hl.dsp.window.pseudo())

-- Move focus
hl.bind(mod .. ' + ' .. left, hl.dsp.focus({ direction = 'left' }))
hl.bind(mod .. ' + ' .. down, hl.dsp.focus({ direction = 'down' }))
hl.bind(mod .. ' + ' .. up, hl.dsp.focus({ direction = 'up' }))
hl.bind(mod .. ' + ' .. right, hl.dsp.focus({ direction = 'right' }))
hl.bind(mod .. ' + TAB', function()
  hl.dispatch(hl.dsp.window.cycle_next())
  hl.dispatch(hl.dsp.window.bring_to_top())
end)

-- Move window
hl.bind(mod .. ' + SHIFT + ' .. left, hl.dsp.window.move({ group_aware = true, direction = 'left' }))
hl.bind(mod .. ' + SHIFT + ' .. down, hl.dsp.window.move({ group_aware = true, direction = 'down' }))
hl.bind(mod .. ' + SHIFT + ' .. up, hl.dsp.window.move({ group_aware = true, direction = 'up' }))
hl.bind(mod .. ' + SHIFT + ' .. right, hl.dsp.window.move({ group_aware = true, direction = 'right' }))

-- Switch workspaces
-- Move active window to workspace
for i = 1, 10 do
  local key = i % 10
  hl.bind(mod .. ' + ' .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mod .. ' + SHIFT + ' .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(mod .. ' + SHIFT + MINUS', hl.dsp.window.move({ workspace = 'special:magic' }))
hl.bind(mod .. ' + MINUS', hl.dsp.workspace.toggle_special('magic'))

-- Scroll through existing workspaces
hl.bind(mod .. ' + mouse_up', hl.dsp.focus({ workspace = 'e+1' }))
hl.bind(mod .. ' + mouse_down', hl.dsp.focus({ workspace = 'e-1' }))

-- Move/resize windows with mod + LMB/RMB dragging
hl.bind(mod .. ' + mouse:272', hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. ' + mouse:273', hl.dsp.window.resize(), { mouse = true })

-- Utilities
hl.bind('XF86AudioRaiseVolume', hl.dsp.exec_cmd('wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+'), { locked = true, repeating = true })
hl.bind('XF86AudioLowerVolume', hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-'), { locked = true, repeating = true })
hl.bind('XF86AudioMute', hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'), { locked = true, repeating = true })
hl.bind('XF86AudioMicMute', hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle'), { locked = true, repeating = true })
hl.bind('XF86MonBrightnessUp', hl.dsp.exec_cmd('brightnessctl set 5%+'), { locked = true, repeating = true })
hl.bind('XF86MonBrightnessDown', hl.dsp.exec_cmd('brightnessctl set 5%-'), { locked = true, repeating = true })
hl.bind('XF86AudioNext', hl.dsp.exec_cmd('playerctl next'), { locked = true })
hl.bind('XF86AudioPause', hl.dsp.exec_cmd('playerctl play-pause'), { locked = true })
hl.bind('XF86AudioPlay', hl.dsp.exec_cmd('playerctl play-pause'), { locked = true })
hl.bind('XF86AudioPrev', hl.dsp.exec_cmd('playerctl previous'), { locked = true })

--[[ Extras ]]

-- system-dmenu
hl.bind(mod .. '+ BACKSPACE', hl.dsp.exec_cmd('~/.local/bin/system-dmenu'))

-- screenshots
-- take region/fullscreen screenshot and pipe to swappy
hl.bind('PRINT', hl.dsp.exec_cmd('grim -g "$(slurp)" - | swappy -f -'))
hl.bind(mod .. ' + PRINT', hl.dsp.exec_cmd('grim - | swappy -f -'))
-- save screenshot to ~/Downloads
hl.bind(mod .. ' + SHIFT + PRINT', hl.dsp.exec_cmd('grim "$HOME/Downloads/$(date +%Y-%m-%d-%H%M%S).png"'))

-- clipboard management
hl.bind(mod .. ' + CTRL + V', hl.dsp.exec_cmd('cliphist list | ' .. vars.dmenu .. ' -l 10 | cliphist decode | wl-copy'))

-- Gestures
hl.gesture({
  fingers = 3,
  direction = 'horizontal',
  action = 'workspace',
})
