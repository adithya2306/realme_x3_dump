#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:83886080:e8d128f9d029b369f9e08c1a1c6b193dbff34907; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:a5f35e6f2f53c2bbc4546e5b5c2dcca6caad447c \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:83886080:e8d128f9d029b369f9e08c1a1c6b193dbff34907 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
