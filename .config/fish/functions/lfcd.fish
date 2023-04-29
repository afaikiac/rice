function lfcd
    set tmp (mktemp)
    set fid (mktemp)
    command lf -command '$printf $id > '"$fid"'' -last-dir-path=$tmp $argv

    set id (cat $fid)
    rm -f $fid
    set archivemount_dir "/tmp/__lf_archivemount_$id"
    if test -f "$archivemount_dir"
        cat "$archivemount_dir" | while read -L line
            fusermount -u "$line"
            rmdir "$line"
        end
        rm -f "$archivemount_dir"
    end              
            
    set dir (cat $tmp)
    rm -f $tmp
    if test -d "$dir" 
      and test "$dir" != (pwd)
        cd $dir
    end
end
