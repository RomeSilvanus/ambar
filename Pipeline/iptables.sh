iptables -F
iptables -X
iptables -Z
iptables -L
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
#����SSH 22�˿�
#����ping
iptables -A INPUT -p icmp -j ACCEPT
iptables -A OUTPUT -p icmp -j ACCEPT
#������ָ����վ�ķ���
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
#iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -p tcp -d 172.17.0.1/24 -j ACCEPT
iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -p tcp -d ${LANIP}/24 -j ACCEPT
#������
iptables -A INPUT -i lo -p all -j ACCEPT
iptables -A OUTPUT -o lo -p all -j ACCEPT
