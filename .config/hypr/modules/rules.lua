hl.window_rule({
  -- Fix some dragging issues with XWayland
  name = 'fix-wayland-drags',
  match = {
    class = '^$',
    title = '^$',
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false,
  },
  no_focus = true,
})
