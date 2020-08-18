
# If running from tty1 start sway
set tty_path (tty)
if [ $tty_path = "/dev/tty1" ]
	exec sway
end


set -gx HOSTNAME (hostname)
if status --is-interactive;
    keychain --quiet --nogui ~/.ssh/id_rsa ~/.ssh/tide-jan
    [ -e $HOME/.keychain/$HOSTNAME-fish ]; and source $HOME/.keychain/$HOSTNAME-fish
end

set -gx PATH /home/meatpuppet/go/bin $PATH

