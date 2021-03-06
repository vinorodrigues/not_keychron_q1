# Copyright 2022 Vino Rodrigues (@vinorodrigues)
# SPDX-License-Identifier: GPL-3.0-or-later

# Build Options
#   change yes to no to disable
#   the remaining set is is the `info.json` file

EEPROM ?= yes
ifneq ($(strip $(EEPROM)), yes)
	EEPROM_DRIVER = i2c        # Dynamic keymap and settings stored in EEPROM
else
	EEPROM_DRIVER = wear_leveling
	WEAR_LEVELING_DRIVER = embedded_flash
endif

DIP_SWITCH_ENABLE = yes		   # Enabel DIP switch (mac/win slider)
ENCODER_ENABLE = yes           # Enable Encoder
RGB_MATRIX_ENABLE = yes        # Enable RGB Matrix, with..
RGB_MATRIX_DRIVER = CKLED2001  # ..custom RGB driver

FACTORY_RESET = yes  # Enable Fn+J+Z factory reset hot keys

# Enter lower-power sleep mode when on the ChibiOS idle thread
OPT_DEFS += -DCORTEX_ENABLE_WFI_IDLE=TRUE

# custom matrix setup
CUSTOM_MATRIX = lite

SRC += matrix.c \
       keymaps.c
