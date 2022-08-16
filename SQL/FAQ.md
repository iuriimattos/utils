persimist lock

SELECT FOR UPDATE * FROM balance WHERE id = 1

Row is locked while UPDATE is not finished

optimist lock

SELECT * FROM balance WHERE id = 1 and version = 1

UPDATE balance SET value = 2 and version = 2

version is like timestamp