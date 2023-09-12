if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias nvmetmp='sudo nvme smart-log /dev/nvme0n1 | rg ^temperature'

mcfly init fish | source
starship init fish | source
