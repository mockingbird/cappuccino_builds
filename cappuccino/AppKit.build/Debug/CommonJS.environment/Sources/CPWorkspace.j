@STATIC;1.0;I;21;Foundation/CPString.jt;1086;objj_executeFile("Foundation/CPString.j", NO);var SharedWorkspace = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPWorkspace"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("openFile:"), function $CPWorkspace__openFile_(self, _cmd, fullPath)
{
    var url = CPURL.isa.objj_msgSend1(CPURL, "URLWithString:", fullPath);
    return self.isa.objj_msgSend1(self, "openURL:", url);
}
,["BOOL","CPString"]), new objj_method(sel_getUid("openURL:"), function $CPWorkspace__openURL_(self, _cmd, url)
{
    if (!url || !(url == null ? null : url.isa.objj_msgSend0(url, "absoluteURL")))
        return NO;
    window.open((url == null ? null : url.isa.objj_msgSend0(url, "absoluteURL")));
    return YES;
}
,["BOOL","CPURL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sharedWorkspace"), function $CPWorkspace__sharedWorkspace(self, _cmd)
{
    if (!SharedWorkspace)
        SharedWorkspace = CPWorkspace.isa.objj_msgSend0(CPWorkspace, "new");
    return SharedWorkspace;
}
,["CPWorkspace"])]);
}