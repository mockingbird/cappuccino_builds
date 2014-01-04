@STATIC;1.0;I;26;AppKit/CPPredicateEditor.jt;3333;objj_executeFile("AppKit/CPPredicateEditor.j", NO);

{
var the_class = objj_getClass("CPPredicateEditor")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPPredicateEditor\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPPredicateEditor__NS_initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditor").super_class }, "NS_initWithCoder:", aCoder);

    if (self)
    {
        _allTemplates = objj_msgSend(aCoder, "decodeObjectForKey:", "NSPredicateTemplates");
    }

    return self;
}
},["id","CPCoder"])]);
}

{var the_class = objj_allocateClassPair(CPPredicateEditor, "NSPredicateEditor"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSPredicateEditor__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
},["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSPredicateEditor__classForKeyedArchiver(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPPredicateEditor, "class");
}
},["Class"])]);
}

{
var the_class = objj_getClass("CPPredicateEditorRowTemplate")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPPredicateEditorRowTemplate\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $CPPredicateEditorRowTemplate__NS_initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditorRowTemplate").super_class }, "init");

    if (self)
    {
        _templateType = objj_msgSend(aCoder, "decodeIntForKey:", "NSPredicateTemplateType");
        _predicateOptions = objj_msgSend(aCoder, "decodeIntForKey:", "NSPredicateTemplateOptions");
        _predicateModifier = objj_msgSend(aCoder, "decodeIntForKey:", "NSPredicateTemplateModifier");
        _leftAttributeType = objj_msgSend(aCoder, "decodeIntForKey:", "NSPredicateTemplateLeftAttributeType");
        _rightAttributeType = objj_msgSend(aCoder, "decodeIntForKey:", "NSPredicateTemplateRightAttributeType");
        _leftIsWildcard = objj_msgSend(aCoder, "decodeBoolForKey:", "NSPredicateTemplateLeftIsWildcard");
        _rightIsWildcard = objj_msgSend(aCoder, "decodeBoolForKey:", "NSPredicateTemplateRightIsWildcard");
        _views = objj_msgSend(aCoder, "decodeObjectForKey:", "NSPredicateTemplateViews");
    }

    return self;
}
},["id","CPCoder"])]);
}

{var the_class = objj_allocateClassPair(CPPredicateEditorRowTemplate, "NSPredicateEditorRowTemplate"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSPredicateEditorRowTemplate__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
},["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSPredicateEditorRowTemplate__classForKeyedArchiver(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPPredicateEditorRowTemplate, "class");
}
},["Class"])]);
}

