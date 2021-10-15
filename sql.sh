#!/bin/bash

rm -f versions.db

sqlite3 versions.db <<EOF
CREATE TABLE versions(id INTEGER, name TEXT, version TEXT, md5 TEXT, url TEXT);
EOF

sed '1,/apps=/d; /^)$/,$d; s/^[ \t]*//g' check-upgradable.sh |
awk 'BEGIN {
	q = "\x27"
	n = 0
	id = 0
	name[n]=""
}
/^#/ {
	name[n++] = gensub(/^# /, "", "g")
}

!/^#/ {

	if (length(name))
	{
		split(gensub(/"/, "", "g", $0), a, ",")

		for (i in name)
		{
			if (index(name[i], a[1]))
				version = gensub(/^ */, "", "g", substr(name[i], length(a[1]) + 1))
			else
				version = name[i]

			print "INSERT INTO versions (id, name, version, md5, url) " \
				"VALUES(" ++id "," q a[1] q "," q version q "," q a[2] q "," q a[3] q ");"
		}

		delete name
	}
}
' |
sqlite3 versions.db
