@STATIC;1.0;t;6390;







;
{var the_class = objj_allocateClassPair(CPObject, "_CPPredicateEditorRowNode"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("tree"), new objj_ivar("templateViews"), new objj_ivar("copiedTemplateContainer"), new objj_ivar("children")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("tree"), function $_CPPredicateEditorRowNode__tree(self, _cmd)
{ with(self)
{
return tree;
}
},["id"]),
new objj_method(sel_getUid("setTree:"), function $_CPPredicateEditorRowNode__setTree_(self, _cmd, newValue)
{ with(self)
{
tree = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("templateViews"), function $_CPPredicateEditorRowNode__templateViews(self, _cmd)
{ with(self)
{
return templateViews;
}
},["id"]),
new objj_method(sel_getUid("setTemplateViews:"), function $_CPPredicateEditorRowNode__setTemplateViews_(self, _cmd, newValue)
{ with(self)
{
templateViews = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("copiedTemplateContainer"), function $_CPPredicateEditorRowNode__copiedTemplateContainer(self, _cmd)
{ with(self)
{
return copiedTemplateContainer;
}
},["id"]),
new objj_method(sel_getUid("setCopiedTemplateContainer:"), function $_CPPredicateEditorRowNode__setCopiedTemplateContainer_(self, _cmd, newValue)
{ with(self)
{
copiedTemplateContainer = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("children"), function $_CPPredicateEditorRowNode__children(self, _cmd)
{ with(self)
{
return children;
}
},["id"]),
new objj_method(sel_getUid("setChildren:"), function $_CPPredicateEditorRowNode__setChildren_(self, _cmd, newValue)
{ with(self)
{
if (children !== newValue)
children = objj_msgSend(newValue, "copy");
}
},["void","id"]), new objj_method(sel_getUid("applyTemplate:withViews:forOriginalTemplate:"), function $_CPPredicateEditorRowNode__applyTemplate_withViews_forOriginalTemplate_(self, _cmd, template, views, originalTemplate)
{ with(self)
{
    var t = objj_msgSend(tree, "template"),
        count = objj_msgSend(children, "count");

    if (t !== template)
    {
        objj_msgSend(templateViews, "setArray:", views);
        objj_msgSend(copiedTemplateContainer, "removeAllObjects");
        objj_msgSend(copiedTemplateContainer, "addObject:", template);
    }

    for (var i = 0; i < count; i++)
        objj_msgSend(children[i], "applyTemplate:withViews:forOriginalTemplate:", template, views, originalTemplate);
}
},["BOOL","id","id","id"]), new objj_method(sel_getUid("isEqual:"), function $_CPPredicateEditorRowNode__isEqual_(self, _cmd, node)
{ with(self)
{
    if (!objj_msgSend(node, "isKindOfClass:", objj_msgSend(_CPPredicateEditorRowNode, "class")))
        return NO;

    return (tree === objj_msgSend(node, "tree"));
}
},["BOOL","id"]), new objj_method(sel_getUid("copyTemplateIfNecessary"), function $_CPPredicateEditorRowNode__copyTemplateIfNecessary(self, _cmd)
{ with(self)
{
    if (objj_msgSend(copiedTemplateContainer, "count") === 0)
    {
        var copy = objj_msgSend(objj_msgSend(tree, "template"), "copy");
        objj_msgSend(copiedTemplateContainer, "addObject:", copy);
        objj_msgSend(templateViews, "addObjectsFromArray:", objj_msgSend(copy, "templateViews"));
    }
}
},["void"]), new objj_method(sel_getUid("templateView"), function $_CPPredicateEditorRowNode__templateView(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "copyTemplateIfNecessary");
    return objj_msgSend(templateViews, "objectAtIndex:", objj_msgSend(tree, "indexIntoTemplate"));
}
},["CPView"]), new objj_method(sel_getUid("templateForRow"), function $_CPPredicateEditorRowNode__templateForRow(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "copyTemplateIfNecessary");
    return objj_msgSend(copiedTemplateContainer, "lastObject");
}
},["id"]), new objj_method(sel_getUid("title"), function $_CPPredicateEditorRowNode__title(self, _cmd)
{ with(self)
{
    return objj_msgSend(tree, "title");
}
},["CPString"]), new objj_method(sel_getUid("displayValue"), function $_CPPredicateEditorRowNode__displayValue(self, _cmd)
{ with(self)
{
    var title = objj_msgSend(self, "title");

    if (title !== nil)
        return title;

    return objj_msgSend(self, "templateView");
}
},["id"]), new objj_method(sel_getUid("description"), function $_CPPredicateEditorRowNode__description(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPString, "stringWithFormat:", "<%@ %@ %@ tree:%@ tviews:%@", objj_msgSend(self, "className"),objj_msgSend(self, "UID"), objj_msgSend(self, "title"), objj_msgSend(tree, "UID"), objj_msgSend(templateViews, "description"));
}
},["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("rowNodeFromTree:"), function $_CPPredicateEditorRowNode__rowNodeFromTree_(self, _cmd, aTree)
{ with(self)
{
    return objj_msgSend(_CPPredicateEditorRowNode, "_rowNodeFromTree:withTemplateTable:", aTree, {});
}
},["id","id"]), new objj_method(sel_getUid("_rowNodeFromTree:withTemplateTable:"), function $_CPPredicateEditorRowNode___rowNodeFromTree_withTemplateTable_(self, _cmd, aTree, templateTable)
{ with(self)
{
    var views,
        copiedContainer;

    var uuid = objj_msgSend(objj_msgSend(aTree, "template"), "UID"),
        cachedNode = templateTable[uuid],
        node = objj_msgSend(objj_msgSend(_CPPredicateEditorRowNode, "alloc"), "init");

    objj_msgSend(node, "setTree:", aTree);

    if (!cachedNode)
    {
        views = objj_msgSend(CPMutableArray, "array");
        copiedContainer = objj_msgSend(CPMutableArray, "array");
        templateTable[uuid] = node;
    }
    else
    {
        views = objj_msgSend(cachedNode, "templateViews");
        copiedContainer = objj_msgSend(cachedNode, "copiedTemplateContainer");
    }

    objj_msgSend(node, "setTemplateViews:", views);
    objj_msgSend(node, "setCopiedTemplateContainer:", copiedContainer);

    var nodeChildren = objj_msgSend(CPMutableArray, "array"),
        treeChildren = objj_msgSend(aTree, "children"),
        count = objj_msgSend(treeChildren, "count");

    for (var i = 0; i < count; i++)
    {
        var treeChild = treeChildren[i],
            child = objj_msgSend(_CPPredicateEditorRowNode, "_rowNodeFromTree:withTemplateTable:", treeChild, templateTable);

        objj_msgSend(nodeChildren, "addObject:", child);
    }

    objj_msgSend(node, "setChildren:", nodeChildren);

    return node;
}
},["id","id","id"])]);
}

