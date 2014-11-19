@STATIC;1.0;i;9;CPPanel.jt;2977;objj_executeFile("CPPanel.j", YES);{var the_class = objj_allocateClassPair(CPPanel, "CPOpenPanel"),
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
        ((___r1 = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "currentRunLoop")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "limitDateForMode:", CPDefaultRunLoopMode));
        var options = {directoryURL: self.isa.objj_msgSend0(self, "directoryURL"), canChooseFiles: self.isa.objj_msgSend0(self, "canChooseFiles"), canChooseDirectories: self.isa.objj_msgSend0(self, "canChooseDirectories"), allowsMultipleSelection: self.isa.objj_msgSend0(self, "allowsMultipleSelection")},
            result = window.cpOpenPanel(options);
        self._URLs = result.URLs;
        return result.button;
    }
    throw "-runModal is unimplemented.";
    var ___r1;
}
,["CPInteger"]), new objj_method(sel_getUid("URLs"), function $CPOpenPanel__URLs(self, _cmd)
{
    return self._URLs;
}
,["CPArray"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("openPanel"), function $CPOpenPanel__openPanel(self, _cmd)
{
    return ((___r1 = CPOpenPanel.isa.objj_msgSend0(CPOpenPanel, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    var ___r1;
}
,["id"])]);
}