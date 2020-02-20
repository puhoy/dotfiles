
set -gx HOSTNAME (hostname)
if status --is-interactive;
    keychain --quiet --nogui --clear ~/.ssh/id_rsa ~/.ssh/tide-jan
    [ -e $HOME/.keychain/$HOSTNAME-fish ]; and source $HOME/.keychain/$HOSTNAME-fish
end

