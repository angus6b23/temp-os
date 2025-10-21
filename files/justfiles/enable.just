alias autologin := enable-autologin

# enable auto login with sddm
[group('enable')]
enable-autologin:
    #!/usr/bin/env sh
    config_file="/etc/sddm.conf.d/autologin.conf"
    select session in `ls /usr/share/wayland-sessions`
    do
    if [ -f "/usr/share/wayland-sessions/$session" ]; then
      name=`echo $session | sed "s/\.desktop//"`
      user=`whoami`
      if [ -f $config_file ]; then
        echo "sddm autologin conf file already exist"
      else 
        echo -e "[Autologin]\nUser=$user\nSession=$name" | sudo tee /etc/sddm.conf.d/autologin.conf
      fi
    fi
    break;
    done
