@STATIC;1.0;I;21;Foundation/CPBundle.jI;25;Foundation/CPDictionary.jI;21;Foundation/CPString.ji;7;CPCib.jt;4927;objj_executeFile("Foundation/CPBundle.j", NO);objj_executeFile("Foundation/CPDictionary.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("CPCib.j", YES);var CPCibOwner = "CPCibOwner";
{
var the_class = objj_getClass("CPObject")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("awakeFromCib"), function $CPObject__awakeFromCib(self, _cmd)
{
}
,["void"])]);
}{
var the_class = objj_getClass("CPBundle")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPBundle\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("loadCibFile:externalNameTable:"), function $CPBundle__loadCibFile_externalNameTable_(self, _cmd, aFileName, aNameTable)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(CPCib, "alloc"), "initWithContentsOfURL:", aFileName), "instantiateCibWithExternalNameTable:", aNameTable);
}
,["CPCib","CPString","CPDictionary"]), new objj_method(sel_getUid("loadCibFile:externalNameTable:loadDelegate:"), function $CPBundle__loadCibFile_externalNameTable_loadDelegate_(self, _cmd, aFileName, aNameTable, aDelegate)
{
    return objj_msgSend(objj_msgSend(CPCib, "alloc"), "initWithCibNamed:bundle:loadDelegate:", aFileName, self, objj_msgSend(objj_msgSend(_CPCibLoadDelegate, "alloc"), "initWithLoadDelegate:externalNameTable:", aDelegate, aNameTable));
}
,["CPCib","CPString","CPDictionary","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("loadCibFile:externalNameTable:"), function $CPBundle__loadCibFile_externalNameTable_(self, _cmd, anAbsolutePath, aNameTable)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(CPCib, "alloc"), "initWithContentsOfURL:", anAbsolutePath), "instantiateCibWithExternalNameTable:", aNameTable);
}
,["CPCib","CPString","CPDictionary"]), new objj_method(sel_getUid("loadCibNamed:owner:"), function $CPBundle__loadCibNamed_owner_(self, _cmd, aName, anOwner)
{
    if (!objj_msgSend(aName, "hasSuffix:", ".cib"))
        aName = objj_msgSend(aName, "stringByAppendingString:", ".cib");
    var bundle = anOwner ? objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(anOwner, "class")) : objj_msgSend(CPBundle, "mainBundle"),
        path = objj_msgSend(bundle, "pathForResource:", aName);
    return objj_msgSend(self, "loadCibFile:externalNameTable:", path, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", anOwner, CPCibOwner));
}
,["CPCib","CPString","id"]), new objj_method(sel_getUid("loadCibFile:externalNameTable:loadDelegate:"), function $CPBundle__loadCibFile_externalNameTable_loadDelegate_(self, _cmd, anAbsolutePath, aNameTable, aDelegate)
{
    return objj_msgSend(objj_msgSend(CPCib, "alloc"), "initWithContentsOfURL:loadDelegate:", anAbsolutePath, objj_msgSend(objj_msgSend(_CPCibLoadDelegate, "alloc"), "initWithLoadDelegate:externalNameTable:", aDelegate, aNameTable));
}
,["CPCib","CPString","CPDictionary",null]), new objj_method(sel_getUid("loadCibNamed:owner:loadDelegate:"), function $CPBundle__loadCibNamed_owner_loadDelegate_(self, _cmd, aName, anOwner, aDelegate)
{
    if (!objj_msgSend(aName, "hasSuffix:", ".cib"))
        aName = objj_msgSend(aName, "stringByAppendingString:", ".cib");
    var bundle = anOwner ? objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(anOwner, "class")) : objj_msgSend(CPBundle, "mainBundle"),
        path = objj_msgSend(bundle, "pathForResource:", aName);
    return objj_msgSend(self, "loadCibFile:externalNameTable:loadDelegate:", path, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", anOwner, CPCibOwner), aDelegate);
}
,["CPCib","CPString","id","id"])]);
}{var the_class = objj_allocateClassPair(CPObject, "_CPCibLoadDelegate"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_loadDelegate"), new objj_ivar("_externalNameTable")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithLoadDelegate:externalNameTable:"), function $_CPCibLoadDelegate__initWithLoadDelegate_externalNameTable_(self, _cmd, aLoadDelegate, anExternalNameTable)
{
    self = objj_msgSend(self, "init");
    if (self)
    {
        self._loadDelegate = aLoadDelegate;
        self._externalNameTable = anExternalNameTable;
    }
    return self;
}
,["id","id","id"]), new objj_method(sel_getUid("cibDidFinishLoading:"), function $_CPCibLoadDelegate__cibDidFinishLoading_(self, _cmd, aCib)
{
    objj_msgSend(aCib, "instantiateCibWithExternalNameTable:", self._externalNameTable);
    objj_msgSend(self._loadDelegate, "cibDidFinishLoading:", aCib);
}
,["void","CPCib"]), new objj_method(sel_getUid("cibDidFailToLoad:"), function $_CPCibLoadDelegate__cibDidFailToLoad_(self, _cmd, aCib)
{
    objj_msgSend(self._loadDelegate, "cibDidFailToLoad:", aCib);
}
,["void","CPCib"])]);
}