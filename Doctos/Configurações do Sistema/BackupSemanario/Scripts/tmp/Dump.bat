mysqldump -uroot -p$em4n4r10D4t4b4$e --dump-date semanario > C:\BackupSemanario\Dumps\Semanario-%1.sql

7z a -tzip C:\BackupSemanario\Dumps\Semanario-%1.zip C:\BackupSemanario\Dumps\Semanario-%1.sql

copy C:\BackupSemanario\Dumps\Semanario-%1.zip D:\

exit