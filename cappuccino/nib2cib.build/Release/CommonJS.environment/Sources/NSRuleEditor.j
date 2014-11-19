@STATIC;1.0;I;21;AppKit/CPRuleEditor.jI;20;AppKit/CPTextField.ji;8;NSCell.ji;11;NSControl.jt;5191;objj_executeFile("AppKit/CPRuleEditor.j", NO);objj_executeFile("AppKit/CPTextField.j", NO);objj_executeFile("NSCell.j", YES);objj_executeFile("NSControl.j", YES);{
var the_class = objj_getClass("CPRuleEditor")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPRuleEditor\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPRuleEditor__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRuleEditor").super_class }, "NS_initWithCoder:", aCoder);
    if (self)
    {
        self._alignmentGridWidth = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", "NSRuleEditorAlignmentGridWidth"));
        self._sliceHeight = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeDoubleForKey:", "NSRuleEditorSliceHeight"));
        self._stringsFilename = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSRuleEditorStringsFileName"));
        self._editable = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSRuleEditorEditable"));
        self._allowsEmptyCompoundRows = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSRuleEditorAllowsEmptyCompoundRows"));
        self._disallowEmpty = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSRuleEditorDisallowEmpty"));
        self._nestingMode = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSRuleEditorNestingMode"));
        self._typeKeyPath = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSRuleEditorRowTypeKeyPath"));
        self._itemsKeyPath = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSRuleEditorItemsKeyPath"));
        self._valuesKeyPath = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSRuleEditorValuesKeyPath"));
        self._subrowsArrayKeyPath = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSRuleEditorSubrowsArrayKeyPath"));
        self._boundArrayKeyPath = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSRuleEditorBoundArrayKeyPath"));
        self._boundArrayOwner = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSRuleEditorBoundArrayOwner"));
        self._slices = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSRuleEditorSlices"));
        self._ruleDelegate = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSRuleEditorDelegate"));
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPRuleEditor, "NSRuleEditor"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSRuleEditor__initWithCoder_(self, _cmd, aCoder)
{
    self = (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder));
    if (self)
    {
        var cell = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSCell"));
        (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCell:", cell));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSRuleEditor__classForKeyedArchiver(self, _cmd)
{
    return CPRuleEditor.isa.objj_msgSend0(CPRuleEditor, "class");
}
,["Class"])]);
}{var the_class = objj_allocateClassPair(_CPRuleEditorViewSliceHolder, "_NSRuleEditorViewSliceHolder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_NSRuleEditorViewSliceHolder__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $_NSRuleEditorViewSliceHolder__classForKeyedArchiver(self, _cmd)
{
    return _CPRuleEditorViewSliceHolder.isa.objj_msgSend0(_CPRuleEditorViewSliceHolder, "class");
}
,["Class"])]);
}{var the_class = objj_allocateClassPair(_CPRuleEditorViewUnboundRowHolder, "_NSRuleEditorViewUnboundRowHolder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_NSRuleEditorViewUnboundRowHolder__initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_NSRuleEditorViewUnboundRowHolder").super_class }, "init"))
        self.boundArray = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSBoundArray"));
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $_NSRuleEditorViewUnboundRowHolder__classForKeyedArchiver(self, _cmd)
{
    return _CPRuleEditorViewUnboundRowHolder.isa.objj_msgSend0(_CPRuleEditorViewUnboundRowHolder, "class");
}
,["Class"])]);
}