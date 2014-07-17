@STATIC;1.0;I;26;AppKit/CPPredicateEditor.jt;3966;objj_executeFile("AppKit/CPPredicateEditor.j", NO);{
var the_class = objj_getClass("CPPredicateEditor")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPPredicateEditor\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPPredicateEditor__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditor").super_class }, "NS_initWithCoder:", aCoder);
    if (self)
    {
        self._allTemplates = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSPredicateTemplates"));
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPPredicateEditor, "NSPredicateEditor"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSPredicateEditor__initWithCoder_(self, _cmd, aCoder)
{
    self = (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder));
    if (self)
    {
        var cell = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSCell"));
        (self == null ? null : self.isa.objj_msgSend1(self, "NS_initWithCell:", cell));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSPredicateEditor__classForKeyedArchiver(self, _cmd)
{
    return CPPredicateEditor.isa.objj_msgSend0(CPPredicateEditor, "class");
}
,["Class"])]);
}{
var the_class = objj_getClass("CPPredicateEditorRowTemplate")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPPredicateEditorRowTemplate\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPPredicateEditorRowTemplate__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditorRowTemplate").super_class }, "init");
    if (self)
    {
        self._templateType = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSPredicateTemplateType"));
        self._predicateOptions = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSPredicateTemplateOptions"));
        self._predicateModifier = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSPredicateTemplateModifier"));
        self._leftAttributeType = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSPredicateTemplateLeftAttributeType"));
        self._rightAttributeType = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", "NSPredicateTemplateRightAttributeType"));
        self._leftIsWildcard = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSPredicateTemplateLeftIsWildcard"));
        self._rightIsWildcard = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", "NSPredicateTemplateRightIsWildcard"));
        self._views = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSPredicateTemplateViews"));
    }
    return self;
}
,["id","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPPredicateEditorRowTemplate, "NSPredicateEditorRowTemplate"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSPredicateEditorRowTemplate__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend1(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSPredicateEditorRowTemplate__classForKeyedArchiver(self, _cmd)
{
    return CPPredicateEditorRowTemplate.isa.objj_msgSend0(CPPredicateEditorRowTemplate, "class");
}
,["Class"])]);
}