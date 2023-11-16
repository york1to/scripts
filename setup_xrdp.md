# Setup Xrdp

source: https://help.ubuntu.com/community/xrdp

`sudo apt-get -y install xrdp`

`sudo nano /etc/xrdp/xrdp.ini`

Customize the port

`sudo vim /etc/polkit-1/localauthority.conf.d/02-allow-colord.conf` New file

This step is really important! Forbad annoying block warning.
```
polkit.addRule(function(action, subject) {
if ((action.id == “org.freedesktop.color-manager.create-device” || action.id == “org.freedesktop.color-manager.create-profile” || action.id == “org.freedesktop.color-manager.delete-device” || action.id == “org.freedesktop.color-manager.delete-profile” || action.id == “org.freedesktop.color-manager.modify-device” || action.id == “org.freedesktop.color-manager.modify-profile”) && subject.isInGroup(“{group}”))
{
return polkit.Result.YES;
}
});
```

`sudo /etc/init.d/xrdp restart` Remind that you should log out in order to use xrdp
