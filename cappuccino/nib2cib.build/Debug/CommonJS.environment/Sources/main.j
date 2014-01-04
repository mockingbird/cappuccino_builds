@STATIC;1.0;i;9;Nib2Cib.jt;186;objj_executeFile("Nib2Cib.j", YES);

main = function(args)
{
    var nib2cib = objj_msgSend(objj_msgSend(Nib2Cib, "alloc"), "initWithArgs:", args);

    objj_msgSend(nib2cib, "run");
}

