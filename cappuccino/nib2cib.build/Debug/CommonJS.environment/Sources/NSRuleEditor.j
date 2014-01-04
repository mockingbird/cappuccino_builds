@STATIC;1.0;I;21;AppKit/CPRuleEditor.jI;20;AppKit/CPTextField.ji;8;NSCell.ji;11;NSControl.jt;4242;objj_executeFile("AppKit/CPRuleEditor.j", NO);
objj_executeFile("AppKit/CPTextField.j", NO);

objj_executeFile("NSCell.j", YES);
objj_executeFile("NSControl.j", YES);

{
var the_class = objj_getClass("CPRuleEditor")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPRuleEditor\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPRuleEditor__NS_initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRuleEditor").super_class }, "NS_initWithCoder:", aCoder);

    if (self)
    {
        _alignmentGridWidth = objj_msgSend(aCoder, "decodeFloatForKey:", "NSRuleEditorAlignmentGridWidth");
        _sliceHeight = objj_msgSend(aCoder, "decodeDoubleForKey:", "NSRuleEditorSliceHeight");
        _stringsFilename = objj_msgSend(aCoder, "decodeObjectForKey:", "NSRuleEditorStringsFileName");
        _editable = objj_msgSend(aCoder, "decodeBoolForKey:", "NSRuleEditorEditable");
        _allowsEmptyCompoundRows = objj_msgSend(aCoder, "decodeBoolForKey:", "NSRuleEditorAllowsEmptyCompoundRows");
        _disallowEmpty = objj_msgSend(aCoder, "decodeBoolForKey:", "NSRuleEditorDisallowEmpty");
        _nestingMode = objj_msgSend(aCoder, "decodeIntForKey:", "NSRuleEditorNestingMode");
        _typeKeyPath = objj_msgSend(aCoder, "decodeObjectForKey:", "NSRuleEditorRowTypeKeyPath");
        _itemsKeyPath = objj_msgSend(aCoder, "decodeObjectForKey:", "NSRuleEditorItemsKeyPath");
        _valuesKeyPath = objj_msgSend(aCoder, "decodeObjectForKey:", "NSRuleEditorValuesKeyPath");
        _subrowsArrayKeyPath = objj_msgSend(aCoder, "decodeObjectForKey:", "NSRuleEditorSubrowsArrayKeyPath");
        _boundArrayKeyPath = objj_msgSend(aCoder, "decodeObjectForKey:", "NSRuleEditorBoundArrayKeyPath");


        _boundArrayOwner = objj_msgSend(aCoder, "decodeObjectForKey:", "NSRuleEditorBoundArrayOwner");
        _slices = objj_msgSend(aCoder, "decodeObjectForKey:", "NSRuleEditorSlices");
        _ruleDelegate = objj_msgSend(aCoder, "decodeObjectForKey:", "NSRuleEditorDelegate");
    }

    return self;
}
},["id","CPCoder"])]);
}

{var the_class = objj_allocateClassPair(CPRuleEditor, "NSRuleEditor"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSRuleEditor__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
},["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSRuleEditor__classForKeyedArchiver(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPRuleEditor, "class");
}
},["Class"])]);
}

{var the_class = objj_allocateClassPair(_CPRuleEditorViewSliceHolder, "_NSRuleEditorViewSliceHolder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_NSRuleEditorViewSliceHolder__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
},["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $_NSRuleEditorViewSliceHolder__classForKeyedArchiver(self, _cmd)
{ with(self)
{
    return objj_msgSend(_CPRuleEditorViewSliceHolder, "class");
}
},["Class"])]);
}

{var the_class = objj_allocateClassPair(_CPRuleEditorViewUnboundRowHolder, "_NSRuleEditorViewUnboundRowHolder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_NSRuleEditorViewUnboundRowHolder__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_NSRuleEditorViewUnboundRowHolder").super_class }, "init"))
        boundArray = objj_msgSend(aCoder, "decodeObjectForKey:", "NSBoundArray");

    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $_NSRuleEditorViewUnboundRowHolder__classForKeyedArchiver(self, _cmd)
{ with(self)
{
    return objj_msgSend(_CPRuleEditorViewUnboundRowHolder, "class");
}
},["Class"])]);
}

