@STATIC;1.0;t;2943;







{var the_class = objj_allocateClassPair(CPObject, "_CPPredicateEditorTree"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("template"), new objj_ivar("title"), new objj_ivar("children"), new objj_ivar("indexIntoTemplate"), new objj_ivar("menuItemIndex")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("template"), function $_CPPredicateEditorTree__template(self, _cmd)
{ with(self)
{
return template;
}
},["id"]),
new objj_method(sel_getUid("setTemplate:"), function $_CPPredicateEditorTree__setTemplate_(self, _cmd, newValue)
{ with(self)
{
template = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("title"), function $_CPPredicateEditorTree__title(self, _cmd)
{ with(self)
{
return title;
}
},["id"]),
new objj_method(sel_getUid("setTitle:"), function $_CPPredicateEditorTree__setTitle_(self, _cmd, newValue)
{ with(self)
{
if (title !== newValue)
title = objj_msgSend(newValue, "copy");
}
},["void","id"]),
new objj_method(sel_getUid("children"), function $_CPPredicateEditorTree__children(self, _cmd)
{ with(self)
{
return children;
}
},["id"]),
new objj_method(sel_getUid("setChildren:"), function $_CPPredicateEditorTree__setChildren_(self, _cmd, newValue)
{ with(self)
{
if (children !== newValue)
children = objj_msgSend(newValue, "copy");
}
},["void","id"]),
new objj_method(sel_getUid("indexIntoTemplate"), function $_CPPredicateEditorTree__indexIntoTemplate(self, _cmd)
{ with(self)
{
return indexIntoTemplate;
}
},["id"]),
new objj_method(sel_getUid("setIndexIntoTemplate:"), function $_CPPredicateEditorTree__setIndexIntoTemplate_(self, _cmd, newValue)
{ with(self)
{
indexIntoTemplate = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("menuItemIndex"), function $_CPPredicateEditorTree__menuItemIndex(self, _cmd)
{ with(self)
{
return menuItemIndex;
}
},["id"]),
new objj_method(sel_getUid("setMenuItemIndex:"), function $_CPPredicateEditorTree__setMenuItemIndex_(self, _cmd, newValue)
{ with(self)
{
menuItemIndex = newValue;
}
},["void","id"]), new objj_method(sel_getUid("copy"), function $_CPPredicateEditorTree__copy(self, _cmd)
{ with(self)
{
    var tree = objj_msgSend(objj_msgSend(_CPPredicateEditorTree, "alloc"), "init");
    objj_msgSend(tree, "setTemplate:", template);
    objj_msgSend(tree, "setTitle:", title);
    objj_msgSend(tree, "setMenuItemIndex:", menuItemIndex);
    objj_msgSend(tree, "setIndexIntoTemplate:", indexIntoTemplate);
    objj_msgSend(tree, "setChildren:", children);

    return tree;
}
},["id"]), new objj_method(sel_getUid("description"), function $_CPPredicateEditorTree__description(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPString, "stringWithFormat:", "<%@: %p (%@) [%d-%d] T:%p at:%d> [\r%@\r]", objj_msgSend(self, "className"), self, title, indexIntoTemplate, menuItemIndex, template, objj_msgSend(template, "rightExpressionAttributeType"), children);
}
},["CPString"])]);
}

