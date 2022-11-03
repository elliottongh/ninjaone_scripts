#!/bin/sh
SCServer="something.screenconnect.com"
SCRelay="instance-someinstanceid-relay.screenconnect.com"
SCPort="443"
SCKey="some really long value from k= from the access install URL"
ninjaOrgName="$(perl -MURI::Escape -e 'print uri_escape($ARGV[0]);' "$NINJA_ORGANIZATION_NAME")"
ninjaLocationName="$(perl -MURI::Escape -e 'print uri_escape($ARGV[0]);' "$NINJA_LOCATION_NAME")"

URL="https://$SCServer/Bin/ConnectWiseControl.ClientSetup.pkg?h=$SCRelay&p=$SCPort&k=$SCKey&e=Access&y=Guest&t=&c=$ninjaOrgName&c=$ninjaLocationName&c=&c=&c=&c=&c=&c="
echo $URL
curl $URL -o /tmp/ConnectWiseControl.ClientSetup.pkg
installer -pkg /tmp/ConnectWiseControl.ClientSetup.pkg -target /
