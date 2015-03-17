updaterc.js: updaterc.coffee
	coffee -c updaterc.coffee

.cszorc: updaterc.js qw.rc
	casperjs updaterc.js
	touch .cszorc

cszo_key:
	wget http://dobrazupa.org/cszo_key
	chmod 600 cszo_key

all: .cszorc cszo_key
	./sqw.exp
