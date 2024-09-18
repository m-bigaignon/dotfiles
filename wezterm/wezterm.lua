local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

wezterm.on('gui-startup', function()
    local _, _, window = wezterm.mux.spawn_window({})
    window:gui_window():maximize()
end)

config.enable_wayland = true
config.front_end = "OpenGL"
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font_with_fallback({"Hack", "JetBrainsMono Nerd Font"})
config.font_size = 10.0

config.window_decorations = "RESIZE"

config.inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.6,
}

config.hide_tab_bar_if_only_one_tab = true
config.disable_default_key_bindings = true
config.keys = {
    {
        key = "h",
        mods = "ALT",
        action = wezterm.action({
            SplitHorizontal = { domain = "CurrentPaneDomain" },
        }),
    },
    {
        key = "v",
        mods = "ALT",
        action = wezterm.action({
            SplitVertical = { domain = "CurrentPaneDomain" },
        }),
    },
    {
        key = "c",
        mods = "ALT",
        action = wezterm.action({ CloseCurrentPane = { confirm = false } }),
    },
    {
        key = "h",
        mods = "CTRL|SHIFT",
        action = wezterm.action({ ActivatePaneDirection = "Left" }),
    },
    {
        key = "n",
        mods = "CTRL|SHIFT",
        action = wezterm.action({ ActivatePaneDirection = "Right" }),
    },
    {
        key = "c",
        mods = "CTRL|SHIFT",
        action = wezterm.action({ ActivatePaneDirection = "Up" }),
    },
    {
        key = "t",
        mods = "CTRL|SHIFT",
        action = wezterm.action({ ActivatePaneDirection = "Down" }),
    },
    {
        key = "h",
        mods = "CTRL|SHIFT|ALT",
        action = wezterm.action({ AdjustPaneSize = { "Left", 1 } }),
    },
    {
        key = "n",
        mods = "CTRL|SHIFT|ALT",
        action = wezterm.action({ AdjustPaneSize = { "Right", 1 } }),
    },
    {
        key = "c",
        mods = "CTRL|SHIFT|ALT",
        action = wezterm.action({ AdjustPaneSize = { "Up", 1 } }),
    },
    {
        key = "t",
        mods = "CTRL|SHIFT|ALT",
        action = wezterm.action({ AdjustPaneSize = { "Down", 1 } }),
    },
    { -- browser-like bindings for tabbing
        key = "t",
        mods = "CTRL",
        action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
    },
    {
        key = "w",
        mods = "CTRL",
        action = wezterm.action({ CloseCurrentTab = { confirm = false } }),
    },
    {
        key = "Tab",
        mods = "CTRL",
        action = wezterm.action({ ActivateTabRelative = 1 }),
    },
    {
        key = "Tab",
        mods = "CTRL|SHIFT",
        action = wezterm.action({ ActivateTabRelative = -1 }),
    }, -- standard copy/paste bindings
    {
        key = "x",
        mods = "CTRL",
        action = "ActivateCopyMode",
    },
    {
        key = "v",
        mods = "CTRL|SHIFT",
        action = wezterm.action({ PasteFrom = "Clipboard" }),
    },
    {
        key = "c",
        mods = "CTRL|SHIFT",
        action = wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" }),
    },
}

return config
