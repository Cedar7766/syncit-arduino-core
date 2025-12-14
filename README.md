# Sync-it Arduino Quick Start

This repository provides **Arduino IDE support for the Sync-it PCB** (ATmega328PB), allowing firmware to be edited, compiled, and uploaded without requiring VS Code or PlatformIO.

The Arduino setup is intended for **end users and quick testing**.  
The **primary development workflow** remains VS Code / PlatformIO.

---

## Requirements

- Sync-it PCB (ATmega328PB)
- USB-to-UART adapter connected to the Sync-it programming header
- Arduino IDE (1.8.x or 2.x)
- This Sync-it Arduino hardware package

---

## Hardware reset requirement (important)

Sync-it requires a **standard Arduino-compatible auto-reset circuit**.

```
DTR ── 100 nF ── RESET
RESET ── 10 kΩ ── VCC
```

**Notes:**
- DTR must be used (not RTS)
- Capacitor must be 100 nF
- Reset must have a 10 kΩ pull-up to VCC

Earlier Sync-it board revisions used a non-standard reset circuit that shouls also work with this package.

---

## Installing the Sync-it board package

### Boards Manager (recommended)

1. Open **Arduino IDE**
2. Go to **Preferences**
3. Add this URL to **Additional Boards Manager URLs**:

```
https://Cedar7766.github.io/syncit-arduino/package_syncit_index.json
```

4. Open **Tools → Board → Boards Manager**
5. Search for **Sync-it**
6. Install the package
7. Restart the Arduino IDE

---

### Manual installation (advanced)

Clone or copy this repository into your Arduino sketchbook:

```
<Sketchbook>/hardware/syncit/avr/
```

Restart the Arduino IDE.

---

## Selecting the board

From **Tools → Board**:

```
Sync-it → Sync-it (ATmega328PB)
```

Once selected, Sync-it-specific options appear under the **Tools** menu.

---

## Board options

### Bootloader LED flashes

Controls how many times the LED flashes at reset (bootloader delay):

- 2 flashes
- 4 flashes (recommended)
- 6 flashes

Changing this option requires **burning the bootloader again**.

---

### Upload baud rate

- 57600 (default)
- 115200

---

## Burning the bootloader (first-time setup)

1. Connect an ISP programmer (e.g. USBasp)
2. Select **Tools → Programmer → USBasp**
3. Click **Tools → Burn Bootloader**

This will:
- Flash the Sync-it Optiboot bootloader
- Program the correct fuse settings
- Protect the bootloader from overwrite

---

## Uploading firmware over USB

1. Disconnect the ISP programmer
2. Connect the USB-to-UART adapter
3. Select the correct **Port** under **Tools → Port**
4. Click **Upload**

Notes:
- EEPROM is preserved
- Bootloader is protected
- No ISP access required after setup

---

## Exporting a compiled HEX file

Use:

```
Sketch → Export Compiled Binary
```

The `.hex` file will be created in the sketch folder.

---

## Supported configurations

| Bootloader        | Upload method        | Status |
|------------------|----------------------|--------|
| Sync-it Optiboot | Arduino IDE (USB)    | ✅ Supported |
| Sync-it Optiboot | VS Code / PlatformIO | ✅ Primary |
| Watterott        | Arduino IDE (USB)    | ⚠️ Limited |
| MiniCore         | Arduino IDE (USB)    | ❌ Unsupported |

---

## Troubleshooting

### Upload works once but fails later

- Confirm DTR is used, not RTS
- Confirm 10 kΩ reset pull-up is fitted
- Re-burn the bootloader if unsure

---

## License

Provided as-is for use with Sync-it hardware.
