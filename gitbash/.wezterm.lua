-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- APARIENCIA/ESTILO
config.color_scheme = 'Argonaut'

config.font = wezterm.font('MesloLGS Nerd Font', {
    -- weight = 'Bold',
    -- italic = true
})

--  estilo de terminal 
local dimmer = {
    brightness = 0.5
}

config.window_frame = {
    inactive_titlebar_bg = '#353535',
    active_titlebar_bg = '#181818',
    inactive_titlebar_fg = '#cccccc',
    inactive_titlebar_border_bottom = '#2b2042',
    active_titlebar_border_bottom = '#2b2042',
    button_fg = '#cccccc',
    button_bg = '#2b2042',
    button_hover_fg = '#ffffff',
    button_hover_bg = '#3b3052',
    font_size = 10.0,
    -- border_left_width = '0.1cell',
    -- border_right_width = '0.1cell',
    -- border_bottom_height = '0.1cell',
    -- border_top_height = '0.1cell',
    border_left_color = '#5A8B11',
    border_right_color = '#5A8B11',
    border_bottom_color = '#5A8B11',
    border_top_color = '#5A8B11'
}

config.colors = {
    cursor_bg = '#deec1d',
    cursor_fg = 'black',
    cursor_border = '#deec1d',
    tab_bar = {
        -- The color of the strip that goes along the top of the window
        -- (does not apply when fancy tab bar is in use)
        -- background = 'red',

        -- The active tab is the one that has focus in the window
        active_tab = {
            -- The color of the background area for the tab
            bg_color = '#585858',
            -- The color of the text for the tab
            fg_color = '#c0c0c0'
        },

        -- Inactive tabs are the tabs that do not have focus
        inactive_tab = {
            bg_color = '#181818',
            fg_color = '#808080'
        },

        -- You can configure some alternate styling when the mouse pointer
        -- moves over inactive tabs
        inactive_tab_hover = {
            bg_color = '#5A8B11',
            fg_color = '#E6E1DC'
        },

        -- The new tab button that let you create new tabs
        new_tab = {
            bg_color = '#181818',
            fg_color = '#808080'

            -- The same options that were listed under the `active_tab` section above
            -- can also be used for `new_tab`.
        },

        -- You can configure some alternate styling when the mouse pointer
        -- moves over the new tab button
        new_tab_hover = {
            bg_color = '#5A8B11',
            fg_color = '#E6E1DC'
        }
    }
}

-- config.window_background_gradient = {

--     -- Can be "Vertical" or "Horizontal".  Specifies the direction

--     orientation = 'Vertical',

--     -- Specifies the set of colors that are interpolated in the gradient.

--     -- Accepts CSS style color specs, from named colors, through rgb

--     -- strings and more

--     colors = {'#000', '#181818', '#24243e'},

--     -- Specifies the interpolation style to be used.

--     -- "Linear", "Basis" and "CatmullRom" as supported.

--     -- The default is "Linear".

--     interpolation = 'Linear',

--     -- How the colors are blended in the gradient.

--     -- "Rgb", "LinearRgb", "Hsv" and "Oklab" are supported.

--     -- The default is "Rgb".

--     blend = 'Rgb'

-- }

config.window_padding = {
    left = 0,
    right = 0,
    top = 2,
    bottom = 0
}

-- config.enable_scroll_bar = true
-- config.min_scroll_bar_height = '2cell'
-- config.colors = {
--     scrollbar_thumb = 'white'
-- }

config.background = { -- This is the deepest/back-most layer. It will be rendered first
{
    source = {
        File = 'D:/Janssen/Imagenes/custom/wezterm_wallpaper2.png'
    },
    -- The texture tiles vertically but not horizontally.
    -- When we repeat it, mirror it so that it appears "more seamless".
    -- An alternative to this is to set `width = "100%"` and have
    -- it stretch across the display
    repeat_x = 'Mirror',
    width = '100%'
    -- hsb = dimmer,
    -- When the viewport scrolls, move this layer 10% of the number of
    -- pixels moved by the main viewport. This makes it appear to be
    -- further behind the text.
    --   attachment = { Parallax = 0.1 }
}}

-- esconder tab en caso solo haya uno
config.hide_tab_bar_if_only_one_tab = false
-- orientacion de los tabs
config.tab_bar_at_bottom = false
-- tabs redondeo
config.use_fancy_tab_bar = true

-- orientacion de los tabs
config.tab_bar_at_bottom = false

config.cursor_blink_rate = 800
config.default_cursor_style = 'BlinkingBlock'

-- term conf varios
config.default_prog = {'C:/msys64/msys2_shell.cmd', '-defterm', '-here', '-no-start', '-msys', '-shell', 'zsh'}

-- config.window_decorations = "NONE"
config.window_decorations = "INTEGRATED_BUTTONS"
config.integrated_title_buttons = {'Hide', 'Maximize', 'Close' }


config.hide_tab_bar_if_only_one_tab = true
config.initial_rows = 25
config.initial_cols = 90
-- config.initial_rows = 20
-- config.initial_cols = 80
-- config.initial_rows = 20
-- config.initial_cols = 70

-- config.automatically_reload_config = true
-- Confirmar al Cerrar terminal
-- config.window_close_confirmation = 'AlwaysPrompt'

-- SHORTCUTS
config.leader = {
    key = 'Space',
    mods = 'CTRL|SHIFT'
}

config.keys = {{
    key = 'l',
    mods = 'ALT',
    action = wezterm.action.ShowLauncher
}, {
    key = '9',
    mods = 'ALT',
    action = wezterm.action.ShowLauncherArgs {
        flags = 'FUZZY|TABS'
    }
}, -- TODO
{
    key = 'F12',
    mods = '',
    action = wezterm.action.ToggleFullScreen
}, {
    key = ':',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitVertical
}, {
    key = 'w',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentTab {
        confirm = false
    }
}}

-- MENU
config.launch_menu = {{
    label = 'Git Bash',
    args = {'C:/Program Files/Git/bin/sh.exe - --login'}
}, {
    label = 'Zsh external',
    args = {'msys2_shell.cmd', '-no-start'}
}, {
    label = 'Powershell',
    args = {'powershell'}
}}

-- CMD
config.set_environment_variables = {
    prompt = '$E]7;file://localhost/$P$E\\$E[32m$T$E[0m $E[35m$P$E[36m$_$G$E[0m '
}
return config
