## The folder structure in the repo:

```text
.
└── syncit-arduino-core
    ├── Making the boards manager package.md
    ├── README.md
    ├── hardware
    │   └── syncit
    │       └── avr
    │           ├── boards.txt
    │           ├── bootloaders
    │           ├── platform.txt
    │           └── variants
    ├── package_syncit_index.json
    └── syncit-avr-1.0.0.zip
```
## What needs to go in the package zip file:
```text
└── avr <-- ✅ zip from here and rename to syncit-avr-1.0.0.zip
    ├── boards.txt
    ├── bootloaders
    │   └── optiboot
    │       ├── optiboot_atmega328pb_UART0_57600_.hex
    │       ├── optiboot_syncit_led2_57600.hex
    │       ├── optiboot_syncit_led4_57600.hex
    │       └── optiboot_syncit_led6_57600.hex
    ├── platform.txt
    └── variants
        └── syncit
            └── pins_arduino.h
```

Get the SHA-256 checksum and the size for the zip file:
```bash
shasum -a 256 syncit-avr-1.0.0.zip
stat -f%z syncit-avr-1.0.0.zip
```
add it to package_syncit_index.json

Go to the repo https://github.com/Cedar7766/syncit-arduino-core/tree/gh-pages (⚠️gh-pages branch) and re-upload the zip and json (or just change the SHA-266 checksum and size), this will publish the files to pages so you can link to them like this:

https://Cedar7766.github.io/syncit-arduino-core/package_syncit_index.json
 Go to Arduino IDE, in settings insert the link above in Additional boards manager URLs and click OK. In Boards manager you should now see the package to install. Check for errors, checksum, size etc and if successful the install button should change to remove.