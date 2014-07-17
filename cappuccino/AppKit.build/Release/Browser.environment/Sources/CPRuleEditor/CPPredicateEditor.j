@STATIC;1.0;i;14;CPRuleEditor.ji;24;_CPPredicateEditorTree.ji;27;_CPPredicateEditorRowNode.ji;30;CPPredicateEditorRowTemplate.jt;25557;objj_executeFile("CPRuleEditor.j", YES);objj_executeFile("_CPPredicateEditorTree.j", YES);objj_executeFile("_CPPredicateEditorRowNode.j", YES);objj_executeFile("CPPredicateEditorRowTemplate.j", YES);{var the_class = objj_allocateClassPair(CPRuleEditor, "CPPredicateEditor"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_allTemplates"), new objj_ivar("_rootTrees"), new objj_ivar("_rootHeaderTrees"), new objj_ivar("_predicateTarget"), new objj_ivar("_predicateAction")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("target"), function $CPPredicateEditor__target(self, _cmd)
{
    return self._predicateTarget;
}
,["id"]), new objj_method(sel_getUid("setTarget:"), function $CPPredicateEditor__setTarget_(self, _cmd, newValue)
{
    self._predicateTarget = newValue;
}
,["void","id"]), new objj_method(sel_getUid("action"), function $CPPredicateEditor__action(self, _cmd)
{
    return self._predicateAction;
}
,["SEL"]), new objj_method(sel_getUid("setAction:"), function $CPPredicateEditor__setAction_(self, _cmd, newValue)
{
    self._predicateAction = newValue;
}
,["void","SEL"]), new objj_method(sel_getUid("rowTemplates"), function $CPPredicateEditor__rowTemplates(self, _cmd)
{
    return self._allTemplates;
}
,["CPArray"]), new objj_method(sel_getUid("setRowTemplates:"), function $CPPredicateEditor__setRowTemplates_(self, _cmd, rowTemplates)
{
    if (self._allTemplates == rowTemplates)
        return;
    self._allTemplates = rowTemplates;
    self.isa.objj_msgSend0(self, "_updateItemsByCompoundTemplates");
    self.isa.objj_msgSend0(self, "_updateItemsBySimpleTemplates");
    if (self.isa.objj_msgSend0(self, "numberOfRows") > 0)
    {
        var predicate = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditor").super_class }, "predicate");
        self.isa.objj_msgSend1(self, "_reflectPredicate:", predicate);
    }
}
,["void","id"]), new objj_method(sel_getUid("_replacementKeyPathForBinding:"), function $CPPredicateEditor___replacementKeyPathForBinding_(self, _cmd, aBinding)
{
    if (aBinding == CPValueBinding)
        return "predicate";
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditor").super_class }, "_replacementKeyPathForBinding:", aBinding);
}
,["CPString","CPString"]), new objj_method(sel_getUid("_initRuleEditorShared"), function $CPPredicateEditor___initRuleEditorShared(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditor").super_class }, "_initRuleEditorShared");
    self._rootTrees = CPArray.isa.objj_msgSend0(CPArray, "array");
    self._rootHeaderTrees = CPArray.isa.objj_msgSend0(CPArray, "array");
}
,["void"]), new objj_method(sel_getUid("initWithFrame:"), function $CPPredicateEditor__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditor").super_class }, "initWithFrame:", aFrame);
    if (self != nil)
    {
        var initialTemplate = ((___r1 = CPPredicateEditorRowTemplate.isa.objj_msgSend0(CPPredicateEditorRowTemplate, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithCompoundTypes:", [CPAndPredicateType, CPOrPredicateType]));
        self._allTemplates = CPArray.isa.objj_msgSend1(CPArray, "arrayWithObject:", initialTemplate);
    }
    return self;
    var ___r1;
}
,["id","CGRect"]), new objj_method(sel_getUid("objectValue"), function $CPPredicateEditor__objectValue(self, _cmd)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditor").super_class }, "predicate");
}
,["id"]), new objj_method(sel_getUid("_updateItemsBySimpleTemplates"), function $CPPredicateEditor___updateItemsBySimpleTemplates(self, _cmd)
{
    var templates = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "array"),
        count = ((___r1 = self._allTemplates), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")),
        t;
    while (count--)
    {
        var t = self._allTemplates[count];
        if ((t == null ? null : t.isa.objj_msgSend0(t, "_rowType")) == CPRuleEditorRowTypeSimple)
            (templates == null ? null : templates.isa.objj_msgSend2(templates, "insertObject:atIndex:", t, 0));
    }
    var trees = self.isa.objj_msgSend1(self, "_constructTreesForTemplates:", templates);
    if ((trees == null ? null : trees.isa.objj_msgSend0(trees, "count")) > 0)
        self._rootTrees = self.isa.objj_msgSend1(self, "_mergeTree:", trees);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_updateItemsByCompoundTemplates"), function $CPPredicateEditor___updateItemsByCompoundTemplates(self, _cmd)
{
    var templates = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "array"),
        count = ((___r1 = self._allTemplates), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")),
        t;
    while (count--)
    {
        var t = self._allTemplates[count];
        if ((t == null ? null : t.isa.objj_msgSend0(t, "_rowType")) == CPRuleEditorRowTypeCompound)
            (templates == null ? null : templates.isa.objj_msgSend2(templates, "insertObject:atIndex:", t, 0));
    }
    var trees = self.isa.objj_msgSend1(self, "_constructTreesForTemplates:", templates);
    if ((trees == null ? null : trees.isa.objj_msgSend0(trees, "count")) > 0)
        self._rootHeaderTrees = self.isa.objj_msgSend1(self, "_mergeTree:", trees);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_constructTreesForTemplates:"), function $CPPredicateEditor___constructTreesForTemplates_(self, _cmd, templates)
{
    var trees = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "array"),
        count = (templates == null ? null : templates.isa.objj_msgSend0(templates, "count"));
    for (var i = 0; i < count; i++)
    {
        var tree = self.isa.objj_msgSend1(self, "_constructTreeForTemplate:", templates[i]);
        (trees == null ? null : trees.isa.objj_msgSend1(trees, "addObjectsFromArray:", tree));
    }
    return trees;
}
,["CPArray","id"]), new objj_method(sel_getUid("_mergeTree:"), function $CPPredicateEditor___mergeTree_(self, _cmd, aTree)
{
    var mergedTree = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "array");
    if (aTree == nil)
        return mergedTree;
    var icount = (aTree == null ? null : aTree.isa.objj_msgSend0(aTree, "count"));
    for (var i = 0; i < icount; i++)
    {
        var anode = (aTree == null ? null : aTree.isa.objj_msgSend1(aTree, "objectAtIndex:", i)),
            jcount = (mergedTree == null ? null : mergedTree.isa.objj_msgSend0(mergedTree, "count")),
            merged = NO;
        for (var j = 0; j < jcount; j++)
        {
            var mergednode = (mergedTree == null ? null : mergedTree.isa.objj_msgSend1(mergedTree, "objectAtIndex:", j));
            if (((___r1 = (mergednode == null ? null : mergednode.isa.objj_msgSend0(mergednode, "title"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqualToString:", (anode == null ? null : anode.isa.objj_msgSend0(anode, "title")))))
            {
                var children1 = (mergednode == null ? null : mergednode.isa.objj_msgSend0(mergednode, "children")),
                    children2 = (anode == null ? null : anode.isa.objj_msgSend0(anode, "children")),
                    children12 = (children1 == null ? null : children1.isa.objj_msgSend1(children1, "arrayByAddingObjectsFromArray:", children2)),
                    mergedChildren = self.isa.objj_msgSend1(self, "_mergeTree:", children12);
                (mergednode == null ? null : mergednode.isa.objj_msgSend1(mergednode, "setChildren:", mergedChildren));
                merged = YES;
            }
        }
        if (!merged)
            (mergedTree == null ? null : mergedTree.isa.objj_msgSend1(mergedTree, "addObject:", anode));
    }
    return mergedTree;
    var ___r1;
}
,["CPMutableArray","CPArray"]), new objj_method(sel_getUid("_constructTreeForTemplate:"), function $CPPredicateEditor___constructTreeForTemplate_(self, _cmd, aTemplate)
{
    var tree = CPArray.isa.objj_msgSend0(CPArray, "array"),
        templateViews = (aTemplate == null ? null : aTemplate.isa.objj_msgSend0(aTemplate, "templateViews")),
        count = (templateViews == null ? null : templateViews.isa.objj_msgSend0(templateViews, "count"));
    while (count--)
    {
        var children = CPArray.isa.objj_msgSend0(CPArray, "array"),
            itemsCount = 0,
            menuIndex = -1,
            itemArray,
            templateView = (templateViews == null ? null : templateViews.isa.objj_msgSend1(templateViews, "objectAtIndex:", count)),
            isPopup = (templateView == null ? null : templateView.isa.objj_msgSend1(templateView, "isKindOfClass:", CPPopUpButton.isa.objj_msgSend0(CPPopUpButton, "class")));
        if (isPopup)
        {
            itemArray = ((___r1 = (templateView == null ? null : templateView.isa.objj_msgSend0(templateView, "itemArray"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "title"));
            itemsCount = (itemArray == null ? null : itemArray.isa.objj_msgSend0(itemArray, "count"));
            menuIndex = 0;
        }
        for (; menuIndex < itemsCount; menuIndex++)
        {
            var item = _CPPredicateEditorTree.isa.objj_msgSend0(_CPPredicateEditorTree, "new");
            (item == null ? null : item.isa.objj_msgSend1(item, "setIndexIntoTemplate:", count));
            (item == null ? null : item.isa.objj_msgSend1(item, "setTemplate:", aTemplate));
            (item == null ? null : item.isa.objj_msgSend1(item, "setMenuItemIndex:", menuIndex));
            if (isPopup)
                (item == null ? null : item.isa.objj_msgSend1(item, "setTitle:", (itemArray == null ? null : itemArray.isa.objj_msgSend1(itemArray, "objectAtIndex:", menuIndex))));
            (children == null ? null : children.isa.objj_msgSend1(children, "addObject:", item));
        }
        (children == null ? null : children.isa.objj_msgSend2(children, "makeObjectsPerformSelector:withObject:", sel_getUid("setChildren:"), tree));
        tree = children;
    }
    return tree;
    var ___r1;
}
,["id","CPPredicateEditorRowTemplate"]), new objj_method(sel_getUid("setObjectValue:"), function $CPPredicateEditor__setObjectValue_(self, _cmd, objectValue)
{
    var ov = self.isa.objj_msgSend0(self, "objectValue");
    if (ov == nil != (objectValue == nil) || !(ov == null ? null : ov.isa.objj_msgSend1(ov, "isEqual:", objectValue)))
    {
        self.isa.objj_msgSend1(self, "_setPredicate:", objectValue);
        self.isa.objj_msgSend1(self, "_reflectPredicate:", objectValue);
    }
}
,["void","id"]), new objj_method(sel_getUid("_reflectPredicate:"), function $CPPredicateEditor___reflectPredicate_(self, _cmd, predicate)
{
    var animation = self._currentAnimation;
    self._currentAnimation = nil;
    self._sendAction = NO;
    if (predicate != nil)
    {
        if ((self._nestingMode == CPRuleEditorNestingModeSimple || self._nestingMode == CPRuleEditorNestingModeCompound) && (predicate == null ? null : predicate.isa.objj_msgSend1(predicate, "isKindOfClass:", CPComparisonPredicate.isa.objj_msgSend0(CPComparisonPredicate, "class"))))
            predicate = ((___r1 = CPCompoundPredicate.isa.objj_msgSend0(CPCompoundPredicate, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithType:subpredicates:", self.isa.objj_msgSend0(self, "_compoundPredicateTypeForRootRows"), CPArray.isa.objj_msgSend1(CPArray, "arrayWithObject:", predicate)));
        var row = self.isa.objj_msgSend1(self, "_rowObjectFromPredicate:", predicate);
        if (row != nil)
            ((___r1 = self._boundArrayOwner), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKey:", CPArray.isa.objj_msgSend1(CPArray, "arrayWithObject:", row), self._boundArrayKeyPath));
    }
    self.isa.objj_msgSend1(self, "setAnimation:", animation);
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("_rowObjectFromPredicate:"), function $CPPredicateEditor___rowObjectFromPredicate_(self, _cmd, predicate)
{
    var quality,
        type,
        matchedTemplate = CPPredicateEditorRowTemplate.isa.objj_msgSend3(CPPredicateEditorRowTemplate, "_bestMatchForPredicate:inTemplates:quality:", predicate, self.isa.objj_msgSend0(self, "rowTemplates"), quality);
    if (matchedTemplate == nil)
        return nil;
    var copyTemplate = (matchedTemplate == null ? null : matchedTemplate.isa.objj_msgSend0(matchedTemplate, "copy")),
        subpredicates = (matchedTemplate == null ? null : matchedTemplate.isa.objj_msgSend1(matchedTemplate, "displayableSubpredicatesOfPredicate:", predicate));
    if (subpredicates == nil)
    {
        (copyTemplate == null ? null : copyTemplate.isa.objj_msgSend1(copyTemplate, "_setComparisonPredicate:", predicate));
        type = CPRuleEditorRowTypeSimple;
    }
    else
    {
        (copyTemplate == null ? null : copyTemplate.isa.objj_msgSend1(copyTemplate, "_setCompoundPredicate:", predicate));
        type = CPRuleEditorRowTypeCompound;
    }
    var row = self.isa.objj_msgSend3(self, "_rowFromTemplate:originalTemplate:withRowType:", copyTemplate, matchedTemplate, type);
    if (subpredicates == nil)
        return row;
    var count = (subpredicates == null ? null : subpredicates.isa.objj_msgSend0(subpredicates, "count")),
        subrows = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "array");
    for (var i = 0; i < count; i++)
    {
        var subrow = self.isa.objj_msgSend1(self, "_rowObjectFromPredicate:", subpredicates[i]);
        if (subrow != nil)
            (subrows == null ? null : subrows.isa.objj_msgSend1(subrows, "addObject:", subrow));
    }
    (row == null ? null : row.isa.objj_msgSend2(row, "setValue:forKey:", subrows, objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditor").super_class }, "subrowsKeyPath")));
    return row;
}
,["id","CPPredicate"]), new objj_method(sel_getUid("_rowFromTemplate:originalTemplate:withRowType:"), function $CPPredicateEditor___rowFromTemplate_originalTemplate_withRowType_(self, _cmd, aTemplate, originalTemplate, rowType)
{
    var criteria = CPArray.isa.objj_msgSend0(CPArray, "array"),
        values = CPArray.isa.objj_msgSend0(CPArray, "array"),
        templateViews = (aTemplate == null ? null : aTemplate.isa.objj_msgSend0(aTemplate, "templateViews")),
        rootItems,
        count;
    rootItems = rowType == CPRuleEditorRowTypeSimple ? self._rootTrees : self._rootHeaderTrees;
    while ((count = (rootItems == null ? null : rootItems.isa.objj_msgSend0(rootItems, "count"))) > 0)
    {
        var treeChild;
        for (var i = 0; i < count; i++)
        {
            treeChild = (rootItems == null ? null : rootItems.isa.objj_msgSend1(rootItems, "objectAtIndex:", i));
            var currentView = (templateViews == null ? null : templateViews.isa.objj_msgSend1(templateViews, "objectAtIndex:", (treeChild == null ? null : treeChild.isa.objj_msgSend0(treeChild, "indexIntoTemplate")))),
                title = (treeChild == null ? null : treeChild.isa.objj_msgSend0(treeChild, "title"));
            if (title == nil || (title == null ? null : title.isa.objj_msgSend1(title, "isEqual:", (currentView == null ? null : currentView.isa.objj_msgSend0(currentView, "titleOfSelectedItem")))))
            {
                var node = _CPPredicateEditorRowNode.isa.objj_msgSend1(_CPPredicateEditorRowNode, "rowNodeFromTree:", treeChild);
                (node == null ? null : node.isa.objj_msgSend3(node, "applyTemplate:withViews:forOriginalTemplate:", aTemplate, templateViews, originalTemplate));
                (criteria == null ? null : criteria.isa.objj_msgSend1(criteria, "addObject:", node));
                (values == null ? null : values.isa.objj_msgSend1(values, "addObject:", (node == null ? null : node.isa.objj_msgSend0(node, "displayValue"))));
                break;
            }
        }
        rootItems = (treeChild == null ? null : treeChild.isa.objj_msgSend0(treeChild, "children"));
    }
    var row = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", criteria, "criteria", values, "displayValues", rowType, "rowType");
    return row;
}
,["id","CPPredicateEditorRowTemplate","CPPredicateEditorRowTemplate","CPRuleEditorRowType"]), new objj_method(sel_getUid("_updatePredicate"), function $CPPredicateEditor___updatePredicate(self, _cmd)
{
    self.isa.objj_msgSend0(self, "_updatePredicateFromRows");
}
,["void"]), new objj_method(sel_getUid("_updatePredicateFromRows"), function $CPPredicateEditor___updatePredicateFromRows(self, _cmd)
{
    var rootRowsArray = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditor").super_class }, "_rootRowsArray"),
        subpredicates = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "array"),
        count,
        count2 = count = (rootRowsArray == null ? null : rootRowsArray.isa.objj_msgSend0(rootRowsArray, "count")),
        predicate;
    while (count--)
    {
        var item = (rootRowsArray == null ? null : rootRowsArray.isa.objj_msgSend1(rootRowsArray, "objectAtIndex:", count)),
            subpredicate = self.isa.objj_msgSend1(self, "_predicateFromRowItem:", item);
        if (subpredicate != nil)
            (subpredicates == null ? null : subpredicates.isa.objj_msgSend2(subpredicates, "insertObject:atIndex:", subpredicate, 0));
    }
    if (self._nestingMode != CPRuleEditorNestingModeList && count2 == 1)
        predicate = (subpredicates == null ? null : subpredicates.isa.objj_msgSend0(subpredicates, "lastObject"));
    else
        predicate = ((___r1 = CPCompoundPredicate.isa.objj_msgSend0(CPCompoundPredicate, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithType:subpredicates:", self.isa.objj_msgSend0(self, "_compoundPredicateTypeForRootRows"), subpredicates));
    self.isa.objj_msgSend1(self, "_setPredicate:", predicate);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_predicateFromRowItem:"), function $CPPredicateEditor___predicateFromRowItem_(self, _cmd, rowItem)
{
    var subpredicates = CPArray.isa.objj_msgSend0(CPArray, "array"),
        rowType = (rowItem == null ? null : rowItem.isa.objj_msgSend1(rowItem, "valueForKey:", self._typeKeyPath));
    if (rowType == CPRuleEditorRowTypeCompound)
    {
        var subrows = (rowItem == null ? null : rowItem.isa.objj_msgSend1(rowItem, "valueForKey:", self._subrowsArrayKeyPath)),
            count = (subrows == null ? null : subrows.isa.objj_msgSend0(subrows, "count"));
        for (var i = 0; i < count; i++)
        {
            var subrow = (subrows == null ? null : subrows.isa.objj_msgSend1(subrows, "objectAtIndex:", i)),
                predicate = self.isa.objj_msgSend1(self, "_predicateFromRowItem:", subrow);
            (subpredicates == null ? null : subpredicates.isa.objj_msgSend1(subpredicates, "addObject:", predicate));
        }
    }
    var criteria = (rowItem == null ? null : rowItem.isa.objj_msgSend1(rowItem, "valueForKey:", self._itemsKeyPath)),
        displayValues = (rowItem == null ? null : rowItem.isa.objj_msgSend1(rowItem, "valueForKey:", self._valuesKeyPath)),
        count = (criteria == null ? null : criteria.isa.objj_msgSend0(criteria, "count")),
        lastItem = (criteria == null ? null : criteria.isa.objj_msgSend0(criteria, "lastObject")),
        template = (lastItem == null ? null : lastItem.isa.objj_msgSend0(lastItem, "templateForRow")),
        templateViews = (template == null ? null : template.isa.objj_msgSend0(template, "templateViews"));
    for (var j = 0; j < count; j++)
    {
        var view = (templateViews == null ? null : templateViews.isa.objj_msgSend1(templateViews, "objectAtIndex:", j)),
            value = (displayValues == null ? null : displayValues.isa.objj_msgSend1(displayValues, "objectAtIndex:", j));
        ((___r1 = (criteria == null ? null : criteria.isa.objj_msgSend1(criteria, "objectAtIndex:", j))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTemplateViews:", templateViews));
        if ((view == null ? null : view.isa.objj_msgSend1(view, "isKindOfClass:", CPPopUpButton.isa.objj_msgSend0(CPPopUpButton, "class"))))
            (view == null ? null : view.isa.objj_msgSend1(view, "selectItemWithTitle:", value));
        else if ((view == null ? null : view.isa.objj_msgSend1(view, "respondsToSelector:", sel_getUid("setObjectValue:"))))
            (view == null ? null : view.isa.objj_msgSend1(view, "setObjectValue:", (value == null ? null : value.isa.objj_msgSend0(value, "objectValue"))));
    }
    return (template == null ? null : template.isa.objj_msgSend1(template, "predicateWithSubpredicates:", subpredicates));
    var ___r1;
}
,["id","id"]), new objj_method(sel_getUid("_compoundPredicateTypeForRootRows"), function $CPPredicateEditor___compoundPredicateTypeForRootRows(self, _cmd)
{
    return CPAndPredicateType;
}
,["CPCompoundPredicateType"]), new objj_method(sel_getUid("_sendRuleAction"), function $CPPredicateEditor___sendRuleAction(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditor").super_class }, "_sendRuleAction");
}
,["void"]), new objj_method(sel_getUid("_sendsActionOnIncompleteTextChange"), function $CPPredicateEditor___sendsActionOnIncompleteTextChange(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("_queryNumberOfChildrenOfItem:withRowType:"), function $CPPredicateEditor___queryNumberOfChildrenOfItem_withRowType_(self, _cmd, rowItem, type)
{
    if (rowItem == nil)
    {
        var trees = type == CPRuleEditorRowTypeSimple ? self._rootTrees : self._rootHeaderTrees;
        return (trees == null ? null : trees.isa.objj_msgSend0(trees, "count"));
    }
    return ((___r1 = (rowItem == null ? null : rowItem.isa.objj_msgSend0(rowItem, "children"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    var ___r1;
}
,["int","id","CPRuleEditorRowType"]), new objj_method(sel_getUid("_queryChild:ofItem:withRowType:"), function $CPPredicateEditor___queryChild_ofItem_withRowType_(self, _cmd, childIndex, rowItem, type)
{
    if (rowItem == nil)
    {
        var trees = type == CPRuleEditorRowTypeSimple ? self._rootTrees : self._rootHeaderTrees;
        return _CPPredicateEditorRowNode.isa.objj_msgSend1(_CPPredicateEditorRowNode, "rowNodeFromTree:", trees[childIndex]);
    }
    return ((___r1 = (rowItem == null ? null : rowItem.isa.objj_msgSend0(rowItem, "children"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", childIndex));
    var ___r1;
}
,["id","int","id","CPRuleEditorRowType"]), new objj_method(sel_getUid("_queryValueForItem:inRow:"), function $CPPredicateEditor___queryValueForItem_inRow_(self, _cmd, rowItem, rowIndex)
{
    return (rowItem == null ? null : rowItem.isa.objj_msgSend0(rowItem, "displayValue"));
}
,["id","id","CPInteger"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_binderClassForBinding:"), function $CPPredicateEditor___binderClassForBinding_(self, _cmd, aBinding)
{
    if (aBinding == CPValueBinding)
        return (CPPredicateEditorValueBinder == null ? null : CPPredicateEditorValueBinder.isa.objj_msgSend0(CPPredicateEditorValueBinder, "class"));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPPredicateEditor").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"])]);
}var CPPredicateTemplatesKey = "CPPredicateTemplates";
{
var the_class = objj_getClass("CPPredicateEditor")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPPredicateEditor\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPPredicateEditor__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditor").super_class }, "initWithCoder:", aCoder);
    if (self != nil)
    {
        var nibTemplates = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPPredicateTemplatesKey));
        if (nibTemplates != nil)
            (self == null ? null : self.isa.objj_msgSend1(self, "setRowTemplates:", nibTemplates));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPPredicateEditor__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditor").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._allTemplates, CPPredicateTemplatesKey));
}
,["void","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPBinder, "CPPredicateEditorValueBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"), function $CPPredicateEditorValueBinder__setPlaceholderValue_withMarker_forBinding_(self, _cmd, aValue, aMarker, aBinding)
{
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_reflectPredicate:", nil));
    var ___r1;
}
,["void","id","CPString","CPString"]), new objj_method(sel_getUid("setValue:forBinding:"), function $CPPredicateEditorValueBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_reflectPredicate:", aValue));
    var ___r1;
}
,["void","id","CPString"])]);
}