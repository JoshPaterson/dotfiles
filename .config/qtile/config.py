from typing import List  # noqa: F401
import subprocess
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy

mod = 'mod4'
terminal = 'kitty'

keys = [
    # Switch between windows
    Key([mod], 'h', lazy.layout.left(), desc='Move focus to left'),
    Key([mod], 'Left', lazy.layout.left(), desc='Move focus to left'),
    Key([mod], 'l', lazy.layout.right(), desc='Move focus to right'),
    Key([mod], 'Right', lazy.layout.right(), desc='Move focus to right'),
    Key([mod], 'j', lazy.layout.down(), desc='Move focus down'),
    Key([mod], 'Down', lazy.layout.down(), desc='Move focus down'),
    Key([mod], 'k', lazy.layout.up(), desc='Move focus up'),
    Key([mod], 'Up', lazy.layout.up(), desc='Move focus up'),
    Key([mod], 'space', lazy.layout.next(), desc='Move window focus to other window'),
    Key([mod, 'shift'], 'space', lazy.window.toggle_floating(), desc='Toggle window floating status'),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, 'shift'], 'h', lazy.layout.shuffle_left(), desc='Move window to the left'),
    Key([mod, 'shift'], 'Left', lazy.layout.shuffle_left(), desc='Move window to the left'),
    Key([mod, 'shift'], 'l', lazy.layout.shuffle_right(), desc='Move window to the right'),
    Key([mod, 'shift'], 'Right', lazy.layout.shuffle_right(), desc='Move window to the right'),
    Key([mod, 'shift'], 'j', lazy.layout.shuffle_down(), desc='Move window down'),
    Key([mod, 'shift'], 'Down', lazy.layout.shuffle_down(), desc='Move window down'),
    Key([mod, 'shift'], 'k', lazy.layout.shuffle_up(), desc='Move window up'),
    Key([mod, 'shift'], 'Up', lazy.layout.shuffle_up(), desc='Move window up'),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, 'control'], 'h', lazy.layout.grow_left(), desc='Grow window to the left'),
    Key([mod, 'control'], 'Left', lazy.layout.grow_left(), desc='Grow window to the left'),
    Key([mod, 'control'], 'l', lazy.layout.grow_right(), desc='Grow window to the right'),
    Key([mod, 'control'], 'Right', lazy.layout.grow_right(), desc='Grow window to the right'),
    Key([mod, 'control'], 'j', lazy.layout.grow_down(), desc='Grow window down'),
    Key([mod, 'control'], 'Down', lazy.layout.grow_down(), desc='Grow window down'),
    Key([mod, 'control'], 'k', lazy.layout.grow_up(), desc='Grow window up'),
    Key([mod, 'control'], 'Up', lazy.layout.grow_up(), desc='Grow window up'),
    Key([mod], 'n', lazy.layout.normalize(), desc='Reset all window sizes'),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, 'shift'], 'Return', lazy.layout.toggle_split(),
        desc='Toggle between split and unsplit sides of stack'),

    # Toggle between different layouts as defined below
    Key([mod], 'Tab', lazy.next_layout(), desc='Toggle between layouts'),
    Key([mod], 'w', lazy.window.kill(), desc='Kill focused window'),
    Key([mod], 'v', lazy.hide_show_bar(), desc='Toggle the bar'),
    Key([mod], 'x', lazy.window.toggle_fullscreen(), desc='Toggle window fullscreen'),

    # Start & Shutdown qtile
    Key([mod, 'control'], 'r', lazy.restart(), desc='Restart Qtile'),
    Key([mod, 'control'], 'q', lazy.shutdown(), desc='Shutdown Qtile'),
    Key([mod, 'shift'], 'r', lazy.reload_config(), desc='Reload Qtile Config'),

    # Program launch bindings
    Key([mod], 'r', lazy.spawn('rofi -show run'), desc='Launch Rofi'),
    Key([mod], 'Return', lazy.spawn(terminal), desc='Launch terminal'),
    Key([mod], 'z', lazy.spawn('cheatsheet'), desc='Show cheatsheet'),
    Key([mod], 'b', lazy.spawn('qutebrowser'), desc='Launch Qutebrowser'),
    Key([mod, 'shift'], 'b', lazy.spawn('firefox -private-window'), desc='Launch Firefox private window'),
    Key([mod], 't', lazy.spawn('thunderbird'), desc='Launch Thunderbird'),
    Key([mod, 'shift'], 'f', lazy.spawn('nemo'), desc='Launch Nemo'),
    Key([mod], 'f', lazy.spawn(terminal + ' ranger'), desc='Launch Ranger'),
    Key([mod], 'g', lazy.spawn(terminal + ' lazygit'), desc='Launch Lazygit'),
    Key([mod], 'd', lazy.spawn('free42'), desc='Launch Free42'),
    Key([mod, 'shift'], 'd', lazy.spawn('plus42'), desc='Launch Plus42'),
    Key([mod, 'shift'], 'Return', lazy.spawn(terminal + ' nvim'), desc='Launch Vim'),

    # System monitor bindings
    KeyChord([mod], 'm', [
        Key([], 't', lazy.spawn(terminal + ' top'), desc='Launch top'),
        Key([], 'h', lazy.spawn(terminal + ' htop', desc='Launch htop')),
        Key([], 'b', lazy.spawn(terminal + ' btop'), desc='Launch btop'),
        Key([], 'v', lazy.spawn(terminal + ' --hold vnstat'), desc='Launch vnstat'),
        Key([], 'n', lazy.spawn(terminal + ' ,nethogs'), desc='Launch nethogs'),
        Key([], 'i', lazy.spawn(terminal + ' ,iftop'), desc='Launch iftop for wifi'),
        Key([], 'a', lazy.spawn(terminal + ' sudo bandwhich'), desc='Launch bandwhich'),
        Key([], 'p', lazy.spawn(terminal + ' ,powertop'), desc='Launch powertop'),
        Key([], 'g', lazy.spawn(terminal + ' gdu'), desc='Launch gdu'),
        ],
        name='System Monitors',
    ),
    KeyChord([mod], 'c', [
        Key([], 'q', lazy.spawn(terminal + ' nvim /home/josh/.config/qtile/config.py'), desc='Edit qtile config'),
        Key([], 'p', lazy.spawn(terminal + ' nvim /home/josh/.config/picom/picom.conf'), desc='Edit picom config'),
        Key([], 'r', lazy.spawn(terminal + ' nvim /home/josh/.config/ranger/rc.conf'), desc='Edit ranger config'),
        Key([], 'k', lazy.spawn(terminal + ' nvim /home/josh/.config/kitty/kitty.conf'), desc='Edit kitty config'),
        Key([], 'c', lazy.spawn(terminal + ' nvim /home/josh/cheatsheet.txt'), desc='Edit cheatsheet'),
        ],
        name='Edit Configs',
    ),

    # wiki.archlinux.org/tile/Qtile
    # Key([], "XF86AudioMute", lazy.spawn('amixer -D pulse sset Master toggle')),
    # Key([], "XF86AudioLowerVolume", lazy.spawn('amixer -D pulse sset Master 5%-')),
    # Key([], "XF86AudioRaiseVolume", lazy.spawn('amixer -D pulse sset Master 5%+')),
]

groups = [Group(i) for i in 'yuiop']

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(), desc='Switch to group {}'.format(i.name)),

        # mod1 + shift + letter of group = move focused window to group
        Key([mod, 'shift'], i.name, lazy.window.togroup(i.name, switch_group=False),
            desc='Switch to & move focused window to group {}'.format(i.name)),
    ])

layouts = [
    layout.Columns(border_focus_stack=['#d75f5f', '#8f3d3d'], border_width=0, margin=10), layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='sans',
    fontsize=24,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        'launch': ('#ff0000', '#ffffff'),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.Systray(),
                widget.Clock(format='%a %b %-d %H:%M'),

                # volume commands: askubuntu.com/questions/454955/using-amixer-to-control-volume
                # add user to audio group per wiki.archlinux.org/title/Qtile
                widget.Volume(
                    get_volume_command='amixer -D pulse sget Master',
                    volume_up_command='amixer -D pulse sset Master 5%+',
                    volume_down_command='amixer -D pulse sset Master 5%-',
                    mute_command='amixer -D pulse sset Master toggle',
                    ),
                widget.Wlan(),
            ],
            48,
        ),
        wallpaper = '/home/josh/wallpapers/04020_jetincarina_2560x1600.jpg',
        wallpaper_mode = 'fill',
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], 'Button1', lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], 'Button3', lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], 'Button2', lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = 'smart'
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

@hook.subscribe.startup_once
def start_once():
    subprocess.call(['picom', '--daemon'])
    subprocess.call(['xinput', 'set-prop', 'PIXA3854:00 093A:0274 Touchpad', 'libinput Natural Scrolling Enabled', '1'])
    subprocess.call(['xinput', 'set-prop', 'PIXA3854:00 093A:0274 Touchpad', 'libinput Tapping Enabled', '1'])
    subprocess.call(['xinput', 'set-prop', 'PIXA3854:00 093A:0274 Touchpad', 'libinput Tapping Drag Lock Enabled', '1'])

# Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.

