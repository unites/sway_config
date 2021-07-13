

# Prevent against Fork bomb and limit user active process 
echo "* soft nproc 100" > /etc/security/limits.conf
echo "* hard nproc 200" >> /etc/security/limits.conf

# Increase timeout on login attempts
echo "auth optional pam_faildelay.so delay=4000000" >> /etc/pam.d/system-login