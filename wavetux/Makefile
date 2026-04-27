CC      = gcc
CFLAGS  = -O2 -Wall -Wextra -Wpedantic
LDFLAGS = -lm
TARGET  = wave
PREFIX  ?= /usr/local

# ── Default target ──────────────────────────────────────────────────
$(TARGET): wave.c
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)

# ── Debug build with sanitizers ─────────────────────────────────────
debug: wave.c
	$(CC) -g -O0 -Wall -Wextra -Wpedantic -fsanitize=address,undefined \
		-o $(TARGET) $< $(LDFLAGS)

# ── Install / Uninstall ────────────────────────────────────────────
install: $(TARGET)
	install -Dm755 $(TARGET) $(PREFIX)/bin/$(TARGET)

uninstall:
	rm -f $(PREFIX)/bin/$(TARGET)

# ── Housekeeping ───────────────────────────────────────────────────
clean:
	rm -f $(TARGET)

format:
	clang-format -i wave.c

.PHONY: clean debug install uninstall format
