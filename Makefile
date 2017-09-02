all: libsystemuiplugin_alarm_dialog.so

clean:
	$(RM) libsystemuiplugin_alarm_dialog.so

install: libsystemuiplugin_alarm_dialog.so
	install -d $(DESTDIR)/usr/lib/systemui
	install -m 644 libsystemuiplugin_alarm_dialog.so $(DESTDIR)/usr/lib/systemui

libsystemuiplugin_alarm_dialog.so: osso-systemui-alarm.c
	$(CC) $^ -o $@ -shared -fPIC $(CFLAGS) $(LDFLAGS) $(shell pkg-config --libs --cflags osso-systemui hildon-plugins-notify-sv hildon-1 gconf-2.0 alarm libnotify gtk+-2.0 dbus-1 glib-2.0) -ltime  -L/usr/lib/hildon-desktop -Wl,-soname -Wl,$@ -Wl,-rpath -Wl,/usr/lib/hildon-desktop

.PHONY: all clean install
