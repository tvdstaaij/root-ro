#/bin/sh
rm /disable-root-ro
journalctl --rotate
journalctl --vacuum-time=1s
rm /root/.bash_history
rm /home/*/.bash_history
systemctl stop systemd-random-seed.service
if [ -f /var/lib/systemd/random-seed ]; then
  rm -f /var/lib/systemd/random-seed
fi
reboot
