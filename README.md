Hardware & Bootloader Notes (Important)
Reset Circuit (v7.15–v7.17 Boards)

Earlier board revisions used a non-standard reset circuit that relied on undefined behaviour:

Old (incorrect) design

RTS → 100 nF → RESET

470 kΩ pulldown

No pull-up (5V rail unpowered during reset)

Worked intermittently by chance

Current (correct) design

DTR → 100 nF → RESET

10 kΩ pull-up to VCC

Arduino-standard auto-reset topology

Reliable and future-proof

This change is required for consistent USB uploads and compatibility with standard Arduino tooling.

Schematic reference:
DTR — 100 nF — RESET, with 10 kΩ pull-up to VCC

Bootloader Behaviour

Custom Optiboot build for ATmega328PB

UART0 @ 57600 baud

Bootloader LED flash count configurable at build time:

2 / 4 / 6 flashes (testing variants)

4 flashes currently recommended

Increased LED_START_FLASHES improves USB upload reliability

Bootloader is protected from overwrite using lock bits

Lock Bits & Protection

Bootloader is protected against accidental overwrite

Application code cannot overwrite bootloader

ISP access remains available for factory recovery

Flash read-out protection is not enabled (intentional, to allow recovery)

Lock bits are applied during Burn Bootloader only.

Upload Behaviour & Erase Notes

USB uploads

Erase application flash only

Bootloader, EEPROM, and fuses are preserved

ISP programming

Full chip erase unless -D is specified

Used only for factory programming and recovery

Once a board is programmed and calibrated, all future updates are via USB only.

Supported Programming Configurations
Bootloader	Tool / IDE	Method	Result
Sync-it Optiboot	PlatformIO / VS Code	USB	✅ Recommended
Sync-it Optiboot	Arduino IDE (custom board)	USB	✅ Supported
Watterott Optiboot	Arduino IDE (Watterott defs)	USB	✅ Works
MiniCore	Arduino IDE	USB	❌ Not supported
Any	ISP (USBasp)	ISP	✅ Factory / recovery only
Arduino IDE Support

Custom Sync-it board package provided

Minimal platform.txt and boards.txt

Supports:

Compile to .hex (no bootloader)

USB upload

Burn Bootloader

Menu options included for:

Bootloader LED flash count

Upload baud rate

This avoids requiring users to install PlatformIO or MiniCore.

Known Limitations

MiniCore board definitions are not compatible with this hardware’s USB reset behaviour

Only one board definition is intentionally exposed to avoid user confusion

ISP should not be used after production programming unless recovery is required

Key Takeaway

The current reset hardware + custom Optiboot + Arduino-standard DTR reset
is now stable, repeatable, and production-safe.