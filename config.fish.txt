if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

abbr "in" "sudo xbps-install"
abbr "up" "sudo xbps-install -Syu"
abbr "rem" "sudo xbps-remove -R"
abbr "ser" "sudo xbps-query -Rs"

abbr "reboot" "sudo reboot"
abbr "poweroff" "sudo poweroff"
