-- MySQL Workbench Synchronization
-- Generated: 2015-02-08 00:28
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Cristiano

update tblada set gaacod = (select tblgaa.gaacod
                              from tblgaa
							 where tblgaa.gaaanomes = tblada.gaaanomes)
where gaaanomes is not null