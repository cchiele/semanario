update tblada set gaaanomes = (select gaaanomes from tblgaa where gaadtgerauto = adadtgerauto)
where adadtgerauto is not null