hl.config({
  general = {
    gaps_in = 3,
    gaps_out = 8,

    border_size = 1,

    col = {
      active_border = { colors = { 'rgba(33ccffee)', 'rgba(00ff99ee)' }, angle = 45 },
      inactive_border = 'rgba(595959aa)',
    },

    layout = 'dwindle',
  },

  group = {
    col = {
      border_active = { colors = { 'rgba(33ccffee)', 'rgba(00ff99ee)' }, angle = 45 },
      border_inactive = 'rgba(595959aa)',
    },

    groupbar = {
      font_family = 'monospace',
      font_size = 12,
      font_weight_active = 'bold',
      font_weight_inactive = 'normal',

      height = 22,
      indicator_height = 0,
      indicator_gap = 4,
      gaps_in = 2,
      gaps_out = 0,

      text_color = 'rgb(ffffff)',
      text_color_inactive = 'rgba(ffffff90)',
      col = {
        active = 'rgba(00000060)',
        inactive = 'rgba(00000040)',
      },

      gradients = true,
      gradient_rounding = 0,
      gradient_round_only_edges = false,
    },
  },

  decoration = {
    rounding = 5,
    rounding_power = 2,

    shadow = {
      enabled = true,
    },

    blur = {
      enabled = true,
    },
  },

  animations = {
    enabled = false,
  },

  dwindle = {
    force_split = 2,
    preserve_split = true,
  },

  misc = {
    force_default_wallpaper = 1,
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
  },
})
