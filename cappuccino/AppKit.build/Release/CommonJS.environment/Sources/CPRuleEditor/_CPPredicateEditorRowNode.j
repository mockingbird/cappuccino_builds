@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jt;6470;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPString.j", NO);{var the_class = objj_allocateClassPair(CPObject, "_CPPredicateEditorRowNode"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("tree"), new objj_ivar("templateViews"), new objj_ivar("copiedTemplateContainer"), new objj_ivar("children")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("tree"), function $_CPPredicateEditorRowNode__tree(self, _cmd)
{
    return self.tree;
}
,["_CPPredicateEditorTree"]), new objj_method(sel_getUid("setTree:"), function $_CPPredicateEditorRowNode__setTree_(self, _cmd, newValue)
{
    self.tree = newValue;
}
,["void","_CPPredicateEditorTree"]), new objj_method(sel_getUid("templateViews"), function $_CPPredicateEditorRowNode__templateViews(self, _cmd)
{
    return self.templateViews;
}
,["CPMutableArray"]), new objj_method(sel_getUid("setTemplateViews:"), function $_CPPredicateEditorRowNode__setTemplateViews_(self, _cmd, newValue)
{
    self.templateViews = newValue;
}
,["void","CPMutableArray"]), new objj_method(sel_getUid("copiedTemplateContainer"), function $_CPPredicateEditorRowNode__copiedTemplateContainer(self, _cmd)
{
    return self.copiedTemplateContainer;
}
,["CPMutableArray"]), new objj_method(sel_getUid("setCopiedTemplateContainer:"), function $_CPPredicateEditorRowNode__setCopiedTemplateContainer_(self, _cmd, newValue)
{
    self.copiedTemplateContainer = newValue;
}
,["void","CPMutableArray"]), new objj_method(sel_getUid("children"), function $_CPPredicateEditorRowNode__children(self, _cmd)
{
    return self.children;
}
,["CPArray"]), new objj_method(sel_getUid("setChildren:"), function $_CPPredicateEditorRowNode__setChildren_(self, _cmd, newValue)
{
    if (self.children !== newValue)
        self.children = objj_msgSend(newValue, "copy");
}
,["void","CPArray"]), new objj_method(sel_getUid("applyTemplate:withViews:forOriginalTemplate:"), function $_CPPredicateEditorRowNode__applyTemplate_withViews_forOriginalTemplate_(self, _cmd, template, views, originalTemplate)
{
    var t = objj_msgSend(self.tree, "template"),
        count = objj_msgSend(self.children, "count");
    if (t !== template)
    {
        objj_msgSend(self.templateViews, "setArray:", views);
        objj_msgSend(self.copiedTemplateContainer, "removeAllObjects");
        objj_msgSend(self.copiedTemplateContainer, "addObject:", template);
    }
    for (var i = 0; i < count; i++)
        objj_msgSend(self.children[i], "applyTemplate:withViews:forOriginalTemplate:", template, views, originalTemplate);
}
,["BOOL","id","id","id"]), new objj_method(sel_getUid("isEqual:"), function $_CPPredicateEditorRowNode__isEqual_(self, _cmd, node)
{
    if (!objj_msgSend(node, "isKindOfClass:", objj_msgSend(_CPPredicateEditorRowNode, "class")))
        return NO;
    return self.tree === objj_msgSend(node, "tree");
}
,["BOOL","id"]), new objj_method(sel_getUid("copyTemplateIfNecessary"), function $_CPPredicateEditorRowNode__copyTemplateIfNecessary(self, _cmd)
{
    if (objj_msgSend(self.copiedTemplateContainer, "count") === 0)
    {
        var copy = objj_msgSend(objj_msgSend(self.tree, "template"), "copy");
        objj_msgSend(self.copiedTemplateContainer, "addObject:", copy);
        objj_msgSend(self.templateViews, "addObjectsFromArray:", objj_msgSend(copy, "templateViews"));
    }
}
,["void"]), new objj_method(sel_getUid("templateView"), function $_CPPredicateEditorRowNode__templateView(self, _cmd)
{
    objj_msgSend(self, "copyTemplateIfNecessary");
    return objj_msgSend(self.templateViews, "objectAtIndex:", objj_msgSend(self.tree, "indexIntoTemplate"));
}
,["CPView"]), new objj_method(sel_getUid("templateForRow"), function $_CPPredicateEditorRowNode__templateForRow(self, _cmd)
{
    objj_msgSend(self, "copyTemplateIfNecessary");
    return objj_msgSend(self.copiedTemplateContainer, "lastObject");
}
,["id"]), new objj_method(sel_getUid("title"), function $_CPPredicateEditorRowNode__title(self, _cmd)
{
    return objj_msgSend(self.tree, "title");
}
,["CPString"]), new objj_method(sel_getUid("displayValue"), function $_CPPredicateEditorRowNode__displayValue(self, _cmd)
{
    var title = objj_msgSend(self, "title");
    if (title !== nil)
        return title;
    return objj_msgSend(self, "templateView");
}
,["id"]), new objj_method(sel_getUid("description"), function $_CPPredicateEditorRowNode__description(self, _cmd)
{
    return objj_msgSend(CPString, "stringWithFormat:", "<%@ %@ %@ tree:%@ tviews:%@", objj_msgSend(self, "className"), objj_msgSend(self, "UID"), objj_msgSend(self, "title"), objj_msgSend(self.tree, "UID"), objj_msgSend(self.templateViews, "description"));
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("rowNodeFromTree:"), function $_CPPredicateEditorRowNode__rowNodeFromTree_(self, _cmd, aTree)
{
    return objj_msgSend(_CPPredicateEditorRowNode, "_rowNodeFromTree:withTemplateTable:", aTree, {});
}
,["id","id"]), new objj_method(sel_getUid("_rowNodeFromTree:withTemplateTable:"), function $_CPPredicateEditorRowNode___rowNodeFromTree_withTemplateTable_(self, _cmd, aTree, templateTable)
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
,["id","id","id"])]);
}