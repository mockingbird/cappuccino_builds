@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jt;3128;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPString.j", NO);{var the_class = objj_allocateClassPair(CPObject, "_CPPredicateEditorTree"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("template"), new objj_ivar("title"), new objj_ivar("children"), new objj_ivar("indexIntoTemplate"), new objj_ivar("menuItemIndex")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("template"), function $_CPPredicateEditorTree__template(self, _cmd)
{
    return self.template;
}
,["CPPredicateEditorRowTemplate"]), new objj_method(sel_getUid("setTemplate:"), function $_CPPredicateEditorTree__setTemplate_(self, _cmd, newValue)
{
    self.template = newValue;
}
,["void","CPPredicateEditorRowTemplate"]), new objj_method(sel_getUid("title"), function $_CPPredicateEditorTree__title(self, _cmd)
{
    return self.title;
}
,["CPString"]), new objj_method(sel_getUid("setTitle:"), function $_CPPredicateEditorTree__setTitle_(self, _cmd, newValue)
{
    if (self.title !== newValue)
        self.title = objj_msgSend(newValue, "copy");
}
,["void","CPString"]), new objj_method(sel_getUid("children"), function $_CPPredicateEditorTree__children(self, _cmd)
{
    return self.children;
}
,["CPArray"]), new objj_method(sel_getUid("setChildren:"), function $_CPPredicateEditorTree__setChildren_(self, _cmd, newValue)
{
    if (self.children !== newValue)
        self.children = objj_msgSend(newValue, "copy");
}
,["void","CPArray"]), new objj_method(sel_getUid("indexIntoTemplate"), function $_CPPredicateEditorTree__indexIntoTemplate(self, _cmd)
{
    return self.indexIntoTemplate;
}
,["CPInteger"]), new objj_method(sel_getUid("setIndexIntoTemplate:"), function $_CPPredicateEditorTree__setIndexIntoTemplate_(self, _cmd, newValue)
{
    self.indexIntoTemplate = newValue;
}
,["void","CPInteger"]), new objj_method(sel_getUid("menuItemIndex"), function $_CPPredicateEditorTree__menuItemIndex(self, _cmd)
{
    return self.menuItemIndex;
}
,["CPInteger"]), new objj_method(sel_getUid("setMenuItemIndex:"), function $_CPPredicateEditorTree__setMenuItemIndex_(self, _cmd, newValue)
{
    self.menuItemIndex = newValue;
}
,["void","CPInteger"]), new objj_method(sel_getUid("copy"), function $_CPPredicateEditorTree__copy(self, _cmd)
{
    var tree = objj_msgSend(objj_msgSend(_CPPredicateEditorTree, "alloc"), "init");
    objj_msgSend(tree, "setTemplate:", self.template);
    objj_msgSend(tree, "setTitle:", self.title);
    objj_msgSend(tree, "setMenuItemIndex:", self.menuItemIndex);
    objj_msgSend(tree, "setIndexIntoTemplate:", self.indexIntoTemplate);
    objj_msgSend(tree, "setChildren:", self.children);
    return tree;
}
,["id"]), new objj_method(sel_getUid("description"), function $_CPPredicateEditorTree__description(self, _cmd)
{
    return objj_msgSend(CPString, "stringWithFormat:", "<%@: %p (%@) [%d-%d] T:%p at:%d> [\r%@\r]", objj_msgSend(self, "className"), self, self.title, self.indexIntoTemplate, self.menuItemIndex, self.template, objj_msgSend(self.template, "rightExpressionAttributeType"), self.children);
}
,["CPString"])]);
}