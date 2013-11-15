@STATIC;1.0;i;9;CPPanel.jt;2769;objj_executeFile("CPPanel.j", YES);{var the_class = objj_allocateClassPair(CPPanel, "CPOpenPanel"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_canChooseFiles"), new objj_ivar("_canChooseDirectories"), new objj_ivar("_allowsMultipleSelection"), new objj_ivar("_directoryURL"), new objj_ivar("_URLs")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("canChooseFiles"), function $CPOpenPanel__canChooseFiles(self, _cmd)
{
    return self._canChooseFiles;
}
,["BOOL"]), new objj_method(sel_getUid("setCanChooseFiles:"), function $CPOpenPanel__setCanChooseFiles_(self, _cmd, newValue)
{
    self._canChooseFiles = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("canChooseDirectories"), function $CPOpenPanel__canChooseDirectories(self, _cmd)
{
    return self._canChooseDirectories;
}
,["BOOL"]), new objj_method(sel_getUid("setCanChooseDirectories:"), function $CPOpenPanel__setCanChooseDirectories_(self, _cmd, newValue)
{
    self._canChooseDirectories = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("allowsMultipleSelection"), function $CPOpenPanel__allowsMultipleSelection(self, _cmd)
{
    return self._allowsMultipleSelection;
}
,["BOOL"]), new objj_method(sel_getUid("setAllowsMultipleSelection:"), function $CPOpenPanel__setAllowsMultipleSelection_(self, _cmd, newValue)
{
    self._allowsMultipleSelection = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("directoryURL"), function $CPOpenPanel__directoryURL(self, _cmd)
{
    return self._directoryURL;
}
,["CPURL"]), new objj_method(sel_getUid("setDirectoryURL:"), function $CPOpenPanel__setDirectoryURL_(self, _cmd, newValue)
{
    self._directoryURL = newValue;
}
,["void","CPURL"]), new objj_method(sel_getUid("runModal"), function $CPOpenPanel__runModal(self, _cmd)
{
    if (typeof window["cpOpenPanel"] === "function")
    {
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
        var options = {directoryURL: objj_msgSend(self, "directoryURL"), canChooseFiles: objj_msgSend(self, "canChooseFiles"), canChooseDirectories: objj_msgSend(self, "canChooseDirectories"), allowsMultipleSelection: objj_msgSend(self, "allowsMultipleSelection")},
            result = window.cpOpenPanel(options);
        self._URLs = result.URLs;
        return result.button;
    }
    throw "-runModal is unimplemented.";
}
,["CPInteger"]), new objj_method(sel_getUid("URLs"), function $CPOpenPanel__URLs(self, _cmd)
{
    return self._URLs;
}
,["CPArray"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("openPanel"), function $CPOpenPanel__openPanel(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPOpenPanel, "alloc"), "init");
}
,["id"])]);
}