# uninstall gems except for default ones
gem uninstall -axI `gem list --no-versions | egrep -v 'test-unit|rdoc|psych|minitest|io-console|rake|bigdecimal|json'`
