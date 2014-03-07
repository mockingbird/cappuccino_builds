@STATIC;1.0;I;21;Foundation/CPString.jt;984;objj_executeFile("Foundation/CPString.j", NO);var SharedWorkspace = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPWorkspace"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("openFile:"), function $CPWorkspace__openFile_(self, _cmd, fullPath)
{
    var url = objj_msgSend(CPURL, "URLWithString:", fullPath);
    return objj_msgSend(self, "openURL:", url);
}
,["BOOL","CPString"]), new objj_method(sel_getUid("openURL:"), function $CPWorkspace__openURL_(self, _cmd, url)
{
    if (!url || !objj_msgSend(url, "absoluteURL"))
        return NO;
    window.open(objj_msgSend(url, "absoluteURL"));
    return YES;
}
,["BOOL","CPURL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sharedWorkspace"), function $CPWorkspace__sharedWorkspace(self, _cmd)
{
    if (!SharedWorkspace)
        SharedWorkspace = objj_msgSend(CPWorkspace, "new");
    return SharedWorkspace;
}
,["CPWorkspace"])]);
}