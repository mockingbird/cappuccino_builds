@STATIC;1.0;i;9;CPPanel.jt;4006;objj_executeFile("CPPanel.j", YES);{var the_class = objj_allocateClassPair(CPPanel, "CPSavePanel"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_URL"), new objj_ivar("_isExtensionHidden"), new objj_ivar("_canSelectHiddenExtension"), new objj_ivar("_allowsOtherFileTypes"), new objj_ivar("_canCreateDirectories"), new objj_ivar("_allowedFileTypes")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("isExtensionHidden"), function $CPSavePanel__isExtensionHidden(self, _cmd)
{
    return self._isExtensionHidden;
}
,["BOOL"]), new objj_method(sel_getUid("setExtensionHidden:"), function $CPSavePanel__setExtensionHidden_(self, _cmd, newValue)
{
    self._isExtensionHidden = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("canSelectHiddenExtension"), function $CPSavePanel__canSelectHiddenExtension(self, _cmd)
{
    return self._canSelectHiddenExtension;
}
,["BOOL"]), new objj_method(sel_getUid("setCanSelectHiddenExtension:"), function $CPSavePanel__setCanSelectHiddenExtension_(self, _cmd, newValue)
{
    self._canSelectHiddenExtension = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("allowsOtherFileTypes"), function $CPSavePanel__allowsOtherFileTypes(self, _cmd)
{
    return self._allowsOtherFileTypes;
}
,["BOOL"]), new objj_method(sel_getUid("setAllowsOtherFileTypes:"), function $CPSavePanel__setAllowsOtherFileTypes_(self, _cmd, newValue)
{
    self._allowsOtherFileTypes = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("canCreateDirectories"), function $CPSavePanel__canCreateDirectories(self, _cmd)
{
    return self._canCreateDirectories;
}
,["BOOL"]), new objj_method(sel_getUid("setCanCreateDirectories:"), function $CPSavePanel__setCanCreateDirectories_(self, _cmd, newValue)
{
    self._canCreateDirectories = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("allowedFileTypes"), function $CPSavePanel__allowedFileTypes(self, _cmd)
{
    return self._allowedFileTypes;
}
,["CPArray"]), new objj_method(sel_getUid("setAllowedFileTypes:"), function $CPSavePanel__setAllowedFileTypes_(self, _cmd, newValue)
{
    self._allowedFileTypes = newValue;
}
,["void","CPArray"]), new objj_method(sel_getUid("init"), function $CPSavePanel__init(self, _cmd)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSavePanel").super_class }, "init"))
    {
        self._canCreateDirectories = YES;
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("runModal"), function $CPSavePanel__runModal(self, _cmd)
{
    ((___r1 = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "currentRunLoop")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "limitDateForMode:", CPDefaultRunLoopMode));
    if (typeof window["cpSavePanel"] === "function")
    {
        var resultObject = window.cpSavePanel({isExtensionHidden: self._isExtensionHidden, canSelectHiddenExtension: self._canSelectHiddenExtension, allowsOtherFileTypes: self._allowsOtherFileTypes, canCreateDirectories: self._canCreateDirectories, allowedFileTypes: self._allowedFileTypes}),
            result = resultObject.button;
        self._URL = result ? CPURL.isa.objj_msgSend1(CPURL, "URLWithString:", resultObject.URL) : nil;
    }
    else
    {
        var documentName = window.prompt("Document Name:"),
            result = documentName !== null;
        self._URL = result ? ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "proposedFileURLWithDocumentName:", documentName)) : nil;
    }
    return result;
    var ___r1;
}
,["CPInteger"]), new objj_method(sel_getUid("URL"), function $CPSavePanel__URL(self, _cmd)
{
    return self._URL;
}
,["CPURL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("savePanel"), function $CPSavePanel__savePanel(self, _cmd)
{
    return ((___r1 = CPSavePanel.isa.objj_msgSend0(CPSavePanel, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    var ___r1;
}
,["id"])]);
}