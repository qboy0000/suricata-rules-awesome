#!/bin/bash
# git submodule foreach git pull
d=$(date +%Y-%m-%d)
echo $d
rm -f local.rules

echo "# merge by $d" >> local.rules
echo '
' >> local.rules

echo "#1. cobaltstrike-suricata-rules" >> local.rules
cat ./cobaltstrike-suricata-rules/suricata/*.rules >> local.rules

echo '
' >> local.rules
echo "#2. hunting-rules" >> local.rules
cat ./hunting-rules/hunting.rules >> local.rules

echo '
' >> local.rules
echo "#3. JJyyy/suricata-rules" >> local.rules
cat ./JJyyy/surica-rules/*.rules >> local.rules

echo '
' >> local.rules
echo "#4. suricata-rules" >> local.rules
cat ./suricata-rules/suricata-ids.rules >> local.rules

echo '
' >> local.rules
echo "#5. Suricata-Detect-DoS-Attack" >> local.rules
cat ./Suricata-Detect-DoS-Attack/*.rules >> local.rules

echo '
' >> local.rules
echo "#6. opnsense-suricata-nmaps" >> local.rules
cat ./opnsense-suricata-nmaps/*.rules >> local.rules



# echo '
# ' >> local.rules
# echo "#6. suricata-rules" >> local.rules
# cat ./suricata-rules/suricata-rules.rules >> local.rules


git add local.rules
git commit -m "merge by $d"
git push