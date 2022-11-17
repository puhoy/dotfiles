
# If running from tty1 start sway
set tty_path (tty)
if [ $tty_path = "/dev/tty1" ]
	exec sway
end


set -gx HOSTNAME (hostname)
if status is-interactive;
    keychain --quiet --nogui ~/.ssh/id_rsa ~/.ssh/tide-jan
    [ -e $HOME/.keychain/$HOSTNAME-fish ]; and source $HOME/.keychain/$HOSTNAME-fish
end

contains $HOME/bin $fish_user_paths; or set -Ua fish_user_paths $HOME/bin
contains $HOME/go/bin $fish_user_paths; or set -Ua fish_user_paths $HOME/go/bin
contains $HOME/.yarn/bin $fish_user_paths; or set -Ua fish_user_paths $HOME/.yarn/bin

# set n (node verion manager) base path
set -x N_PREFIX $HOME/n_node_versions
contains $HOME/n_node_versions/bin $fish_user_paths; or set -Ua fish_user_paths $HOME/n_node_versions/bin

function proj
    set folder "$(find ~/code* -name .git -type d -prune | fzf)/../" && cd $folder
end

#function fish_greeting
    # 
    # set get_weather curl --silent "https://wttr.in/?format=%l:+%c++%C+|+%t(%f)+|+%w+|+%S%m%s\n"
    # 
    # set current_date (date +%m%d%Y%H)
    # 
    # set tmp_file "/tmp/wttr_$current_date"

    # if not test -f "$tmp_file" 
        # {$get_weather} > $tmp_file
    # end

    # cat $tmp_file | lolcat -r
# end

fzf_key_bindings

