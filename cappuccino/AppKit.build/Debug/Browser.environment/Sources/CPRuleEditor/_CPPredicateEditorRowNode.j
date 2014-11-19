@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jt;8407;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPString.j", NO);{var the_class = objj_allocateClassPair(CPObject, "_CPPredicateEditorRowNode"),
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
        self.children = (newValue == null ? null : newValue.isa.objj_msgSend0(newValue, "copy"));
}
,["void","CPArray"]), new objj_method(sel_getUid("applyTemplate:withViews:forOriginalTemplate:"), function $_CPPredicateEditorRowNode__applyTemplate_withViews_forOriginalTemplate_(self, _cmd, template, views, originalTemplate)
{
    var t = ((___r1 = self.tree), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "template")),
        count = ((___r1 = self.children), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    if (t !== template)
    {
        ((___r1 = self.templateViews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setArray:", views));
        ((___r1 = self.copiedTemplateContainer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeAllObjects"));
        ((___r1 = self.copiedTemplateContainer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", template));
    }
    for (var i = 0; i < count; i++)
        ((___r1 = self.children[i]), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "applyTemplate:withViews:forOriginalTemplate:", template, views, originalTemplate));
    var ___r1;
}
,["BOOL","id","id","id"]), new objj_method(sel_getUid("isEqual:"), function $_CPPredicateEditorRowNode__isEqual_(self, _cmd, node)
{
    if (!(node == null ? null : node.isa.objj_msgSend1(node, "isKindOfClass:", _CPPredicateEditorRowNode.isa.objj_msgSend0(_CPPredicateEditorRowNode, "class"))))
        return NO;
    return self.tree === (node == null ? null : node.isa.objj_msgSend0(node, "tree"));
}
,["BOOL","id"]), new objj_method(sel_getUid("copyTemplateIfNecessary"), function $_CPPredicateEditorRowNode__copyTemplateIfNecessary(self, _cmd)
{
    if (((___r1 = self.copiedTemplateContainer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) === 0)
    {
        var copy = ((___r1 = ((___r2 = self.tree), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "template"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
        ((___r1 = self.copiedTemplateContainer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", copy));
        ((___r1 = self.templateViews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObjectsFromArray:", (copy == null ? null : copy.isa.objj_msgSend0(copy, "templateViews"))));
    }
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("templateView"), function $_CPPredicateEditorRowNode__templateView(self, _cmd)
{
    self.isa.objj_msgSend0(self, "copyTemplateIfNecessary");
    return ((___r1 = self.templateViews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", ((___r2 = self.tree), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "indexIntoTemplate"))));
    var ___r1, ___r2;
}
,["CPView"]), new objj_method(sel_getUid("templateForRow"), function $_CPPredicateEditorRowNode__templateForRow(self, _cmd)
{
    self.isa.objj_msgSend0(self, "copyTemplateIfNecessary");
    return ((___r1 = self.copiedTemplateContainer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lastObject"));
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("title"), function $_CPPredicateEditorRowNode__title(self, _cmd)
{
    return ((___r1 = self.tree), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "title"));
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("displayValue"), function $_CPPredicateEditorRowNode__displayValue(self, _cmd)
{
    var title = self.isa.objj_msgSend0(self, "title");
    if (title !== nil)
        return title;
    return self.isa.objj_msgSend0(self, "templateView");
}
,["id"]), new objj_method(sel_getUid("description"), function $_CPPredicateEditorRowNode__description(self, _cmd)
{
    return CPString.isa.objj_msgSend(CPString, "stringWithFormat:", "<%@ %@ %@ tree:%@ tviews:%@", self.isa.objj_msgSend0(self, "className"), self.isa.objj_msgSend0(self, "UID"), self.isa.objj_msgSend0(self, "title"), ((___r1 = self.tree), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "UID")), ((___r1 = self.templateViews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "description")));
    var ___r1;
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("rowNodeFromTree:"), function $_CPPredicateEditorRowNode__rowNodeFromTree_(self, _cmd, aTree)
{
    return _CPPredicateEditorRowNode.isa.objj_msgSend2(_CPPredicateEditorRowNode, "_rowNodeFromTree:withTemplateTable:", aTree, {});
}
,["id","id"]), new objj_method(sel_getUid("_rowNodeFromTree:withTemplateTable:"), function $_CPPredicateEditorRowNode___rowNodeFromTree_withTemplateTable_(self, _cmd, aTree, templateTable)
{
    var views,
        copiedContainer;
    var uuid = ((___r1 = (aTree == null ? null : aTree.isa.objj_msgSend0(aTree, "template"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "UID")),
        cachedNode = templateTable[uuid],
        node = ((___r1 = _CPPredicateEditorRowNode.isa.objj_msgSend0(_CPPredicateEditorRowNode, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    (node == null ? null : node.isa.objj_msgSend1(node, "setTree:", aTree));
    if (!cachedNode)
    {
        views = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "array");
        copiedContainer = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "array");
        templateTable[uuid] = node;
    }
    else
    {
        views = (cachedNode == null ? null : cachedNode.isa.objj_msgSend0(cachedNode, "templateViews"));
        copiedContainer = (cachedNode == null ? null : cachedNode.isa.objj_msgSend0(cachedNode, "copiedTemplateContainer"));
    }
    (node == null ? null : node.isa.objj_msgSend1(node, "setTemplateViews:", views));
    (node == null ? null : node.isa.objj_msgSend1(node, "setCopiedTemplateContainer:", copiedContainer));
    var nodeChildren = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "array"),
        treeChildren = (aTree == null ? null : aTree.isa.objj_msgSend0(aTree, "children")),
        count = (treeChildren == null ? null : treeChildren.isa.objj_msgSend0(treeChildren, "count"));
    for (var i = 0; i < count; i++)
    {
        var treeChild = treeChildren[i],
            child = _CPPredicateEditorRowNode.isa.objj_msgSend2(_CPPredicateEditorRowNode, "_rowNodeFromTree:withTemplateTable:", treeChild, templateTable);
        (nodeChildren == null ? null : nodeChildren.isa.objj_msgSend1(nodeChildren, "addObject:", child));
    }
    (node == null ? null : node.isa.objj_msgSend1(node, "setChildren:", nodeChildren));
    return node;
    var ___r1;
}
,["id","id","id"])]);
}