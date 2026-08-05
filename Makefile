PREFIX ?= /usr/local

install:
	install -d $(DESTDIR)$(PREFIX)/bin
	ln -sf $(CURDIR)/sopranos $(DESTDIR)$(PREFIX)/bin/sopranos

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/sopranos

.PHONY: install uninstall
