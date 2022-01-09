# /etc/exports: the access control list for filesystems which may be exported
#		to NFS clients.  See exports(5).
#
# Example for NFSv2 and NFSv3:
# /srv/homes       hostname1(rw,sync,no_subtree_check) hostname2(ro,sync,no_subtree_check)
#
# Example for NFSv4:
# /srv/nfs4        gss/krb5i(rw,sync,fsid=0,crossmnt,no_subtree_check)
# /srv/nfs4/homes  gss/krb5i(rw,sync,no_subtree_check)
#
/home/antonios/Documents *(rw,sync,no_subtree_check,no_root_squash) 
/home/antonios/Downloads *(rw,sync,no_subtree_check,no_root_squash) 
/home/antonios/Pictures *(rw,sync,no_subtree_check,no_root_squash) 
/home/antonios/Videos *(rw,sync,no_subtree_check,no_root_squash) 