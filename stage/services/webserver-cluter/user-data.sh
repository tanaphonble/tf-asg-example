#!/bin/bash

cat > index.html <<EOF
<p>----------------</p>
<h1>Hello, World</h1>
<p>DB addres: ${db_address}</p>
<p>DB port: ${db_port}</p>
<p>----------------</p>
EOF

busybox httpd -f -p ${server_port} &