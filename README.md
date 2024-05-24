# rpi-setup

bash scripts for setting up the rpi hosting the ROV.

## setup ROV

```sh
source <(curl -s https://raw.githubusercontent.com/deep-sea-tactics/rpi-setup/main/rov.sh)
```

## open camera

```sh
libcamerify ustreamer --host :: --encoder=m2m-image
```
