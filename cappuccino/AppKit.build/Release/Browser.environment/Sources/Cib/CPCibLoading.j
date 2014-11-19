@STATIC;1.0;I;21;Foundation/CPBundle.jI;25;Foundation/CPDictionary.jI;21;Foundation/CPString.ji;7;CPCib.jt;6187;objj_executeFile("Foundation/CPBundle.j", NO);objj_executeFile("Foundation/CPDictionary.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("CPCib.j", YES);var CPCibOwner = "CPCibOwner";
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
    return ((___r1 = ((___r2 = CPCib.isa.objj_msgSend0(CPCib, "alloc")), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "initWithContentsOfURL:", aFileName))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "instantiateCibWithExternalNameTable:", aNameTable));
    var ___r1, ___r2;
}
,["CPCib","CPString","CPDictionary"]), new objj_method(sel_getUid("loadCibFile:externalNameTable:loadDelegate:"), function $CPBundle__loadCibFile_externalNameTable_loadDelegate_(self, _cmd, aFileName, aNameTable, aDelegate)
{
    return ((___r1 = CPCib.isa.objj_msgSend0(CPCib, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithCibNamed:bundle:loadDelegate:", aFileName, self, ((___r2 = (_CPCibLoadDelegate == null ? null : _CPCibLoadDelegate.isa.objj_msgSend0(_CPCibLoadDelegate, "alloc"))), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "initWithLoadDelegate:externalNameTable:", aDelegate, aNameTable))));
    var ___r1, ___r2;
}
,["CPCib","CPString","CPDictionary","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("loadCibFile:externalNameTable:"), function $CPBundle__loadCibFile_externalNameTable_(self, _cmd, anAbsolutePath, aNameTable)
{
    return ((___r1 = ((___r2 = CPCib.isa.objj_msgSend0(CPCib, "alloc")), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "initWithContentsOfURL:", anAbsolutePath))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "instantiateCibWithExternalNameTable:", aNameTable));
    var ___r1, ___r2;
}
,["CPCib","CPString","CPDictionary"]), new objj_method(sel_getUid("loadCibNamed:owner:"), function $CPBundle__loadCibNamed_owner_(self, _cmd, aName, anOwner)
{
    if (!(aName == null ? null : aName.isa.objj_msgSend1(aName, "hasSuffix:", ".cib")))
        aName = (aName == null ? null : aName.isa.objj_msgSend1(aName, "stringByAppendingString:", ".cib"));
    var bundle = anOwner ? CPBundle.isa.objj_msgSend1(CPBundle, "bundleForClass:", (anOwner == null ? null : anOwner.isa.objj_msgSend0(anOwner, "class"))) : CPBundle.isa.objj_msgSend0(CPBundle, "mainBundle"),
        path = (bundle == null ? null : bundle.isa.objj_msgSend1(bundle, "pathForResource:", aName));
    return self.isa.objj_msgSend2(self, "loadCibFile:externalNameTable:", path, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", anOwner, CPCibOwner));
}
,["CPCib","CPString","id"]), new objj_method(sel_getUid("loadCibFile:externalNameTable:loadDelegate:"), function $CPBundle__loadCibFile_externalNameTable_loadDelegate_(self, _cmd, anAbsolutePath, aNameTable, aDelegate)
{
    return ((___r1 = CPCib.isa.objj_msgSend0(CPCib, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentsOfURL:loadDelegate:", anAbsolutePath, ((___r2 = (_CPCibLoadDelegate == null ? null : _CPCibLoadDelegate.isa.objj_msgSend0(_CPCibLoadDelegate, "alloc"))), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "initWithLoadDelegate:externalNameTable:", aDelegate, aNameTable))));
    var ___r1, ___r2;
}
,["CPCib","CPString","CPDictionary","id"]), new objj_method(sel_getUid("loadCibNamed:owner:loadDelegate:"), function $CPBundle__loadCibNamed_owner_loadDelegate_(self, _cmd, aName, anOwner, aDelegate)
{
    if (!(aName == null ? null : aName.isa.objj_msgSend1(aName, "hasSuffix:", ".cib")))
        aName = (aName == null ? null : aName.isa.objj_msgSend1(aName, "stringByAppendingString:", ".cib"));
    var bundle = anOwner ? CPBundle.isa.objj_msgSend1(CPBundle, "bundleForClass:", (anOwner == null ? null : anOwner.isa.objj_msgSend0(anOwner, "class"))) : CPBundle.isa.objj_msgSend0(CPBundle, "mainBundle"),
        path = (bundle == null ? null : bundle.isa.objj_msgSend1(bundle, "pathForResource:", aName));
    return self.isa.objj_msgSend3(self, "loadCibFile:externalNameTable:loadDelegate:", path, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", anOwner, CPCibOwner), aDelegate);
}
,["CPCib","CPString","id","id"])]);
}{var the_class = objj_allocateClassPair(CPObject, "_CPCibLoadDelegate"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_loadDelegate"), new objj_ivar("_externalNameTable")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithLoadDelegate:externalNameTable:"), function $_CPCibLoadDelegate__initWithLoadDelegate_externalNameTable_(self, _cmd, aLoadDelegate, anExternalNameTable)
{
    self = (self == null ? null : self.isa.objj_msgSend0(self, "init"));
    if (self)
    {
        self._loadDelegate = aLoadDelegate;
        self._externalNameTable = anExternalNameTable;
    }
    return self;
}
,["id","id","id"]), new objj_method(sel_getUid("cibDidFinishLoading:"), function $_CPCibLoadDelegate__cibDidFinishLoading_(self, _cmd, aCib)
{
    (aCib == null ? null : aCib.isa.objj_msgSend1(aCib, "instantiateCibWithExternalNameTable:", self._externalNameTable));
    ((___r1 = self._loadDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "cibDidFinishLoading:", aCib));
    var ___r1;
}
,["void","CPCib"]), new objj_method(sel_getUid("cibDidFailToLoad:"), function $_CPCibLoadDelegate__cibDidFailToLoad_(self, _cmd, aCib)
{
    ((___r1 = self._loadDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "cibDidFailToLoad:", aCib));
    var ___r1;
}
,["void","CPCib"])]);
}