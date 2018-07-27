
mysqldump -uroot -proot --dump-date --default-character-set=utf8 semanario > C:\BackupSemanario\Dumps\Semanario-%date:~0,2%-%date:~3,2%-%date:~6,4%.sql

pause
