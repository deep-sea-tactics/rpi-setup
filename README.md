# rpi-setup

bash scripts for setting up the rpi hosting the ROV.

to get `libcamera-v4l2` working, you need [Debian Bookworm](https://www.debian.org/releases/bookworm/), not bullseye.

## setup ROV

```sh
source <(curl -s https://raw.githubusercontent.com/deep-sea-tactics/rpi-setup/main/rov.sh)
```

## open camera

```sh
ustreamer --host ::
```
