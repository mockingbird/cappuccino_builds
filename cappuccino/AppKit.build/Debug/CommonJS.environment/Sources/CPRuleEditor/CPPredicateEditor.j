@STATIC;1.0;i;14;CPRuleEditor.ji;24;_CPPredicateEditorTree.ji;27;_CPPredicateEditorRowNode.ji;30;CPPredicateEditorRowTemplate.jt;20566;

objj_executeFile("CPRuleEditor.j", YES);
objj_executeFile("_CPPredicateEditorTree.j", YES);
objj_executeFile("_CPPredicateEditorRowNode.j", YES);
objj_executeFile("CPPredicateEditorRowTemplate.j", YES);

{var the_class = objj_allocateClassPair(CPRuleEditor, "CPPredicateEditor"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_allTemplates"), new objj_ivar("_rootTrees"), new objj_ivar("_rootHeaderTrees"), new objj_ivar("_predicateTarget"), new objj_ivar("_predicateAction")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("target"), function $CPPredicateEditor__target(self, _cmd)
{ with(self)
{
return _predicateTarget;
}
},["id"]),
new objj_method(sel_getUid("setTarget:"), function $CPPredicateEditor__setTarget_(self, _cmd, newValue)
{ with(self)
{
_predicateTarget = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("action"), function $CPPredicateEditor__action(self, _cmd)
{ with(self)
{
return _predicateAction;
}
},["id"]),
new objj_method(sel_getUid("setAction:"), function $CPPredicateEditor__setAction_(self, _cmd, newValue)
{ with(self)
{
_predicateAction = newValue;
}
},["void","id"]), new objj_method(sel_getUid("rowTemplates"), function $CPPredicateEditor__rowTemplates(self, _cmd)
{ with(self)
{
    return _allTemplates;
}
},["CPArray"]), new objj_method(sel_getUid("setRowTemplates:"), function $CPPredicateEditor__setRowTemplates_(self, _cmd, rowTemplates)
{ with(self)
{
    if (_allTemplates == rowTemplates)
        return;

    _allTemplates = rowTemplates;

    objj_msgSend(self, "_updateItemsByCompoundTemplates");
    objj_msgSend(self, "_updateItemsBySimpleTemplates");

    if (objj_msgSend(self, "numberOfRows") > 0)
    {
        var predicate = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditor").super_class }, "predicate");
        objj_msgSend(self, "_reflectPredicate:", predicate);
    }
}
},["void","id"]), new objj_method(sel_getUid("_replacementKeyPathForBinding:"), function $CPPredicateEditor___replacementKeyPathForBinding_(self, _cmd, aBinding)
{ with(self)
{
    if (aBinding == CPValueBinding)
        return "predicate";

    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditor").super_class }, "_replacementKeyPathForBinding:", aBinding);
}
},["id","CPString"]), new objj_method(sel_getUid("_initRuleEditorShared"), function $CPPredicateEditor___initRuleEditorShared(self, _cmd)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditor").super_class }, "_initRuleEditorShared");

    _rootTrees = objj_msgSend(CPArray, "array");
    _rootHeaderTrees = objj_msgSend(CPArray, "array");
}
},["void"]), new objj_method(sel_getUid("initWithFrame:"), function $CPPredicateEditor__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditor").super_class }, "initWithFrame:", aFrame);
    if (self != nil)
    {
        var initialTemplate = objj_msgSend(objj_msgSend(CPPredicateEditorRowTemplate, "alloc"), "initWithCompoundTypes:", [CPAndPredicateType, CPOrPredicateType]);
        _allTemplates = objj_msgSend(CPArray, "arrayWithObject:", initialTemplate);
    }

    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("objectValue"), function $CPPredicateEditor__objectValue(self, _cmd)
{ with(self)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditor").super_class }, "predicate");
}
},["id"]), new objj_method(sel_getUid("_updateItemsBySimpleTemplates"), function $CPPredicateEditor___updateItemsBySimpleTemplates(self, _cmd)
{ with(self)
{
    var templates = objj_msgSend(CPMutableArray, "array"),
        count = objj_msgSend(_allTemplates, "count"),
        t;

    while (count--)
    {
        var t = _allTemplates[count];
        if (objj_msgSend(t, "_rowType") == CPRuleEditorRowTypeSimple)
            objj_msgSend(templates, "insertObject:atIndex:", t, 0);
    }

    var trees = objj_msgSend(self, "_constructTreesForTemplates:", templates);
    if (objj_msgSend(trees, "count") > 0)
        _rootTrees = objj_msgSend(self, "_mergeTree:", trees);
}
},["void"]), new objj_method(sel_getUid("_updateItemsByCompoundTemplates"), function $CPPredicateEditor___updateItemsByCompoundTemplates(self, _cmd)
{ with(self)
{
    var templates = objj_msgSend(CPMutableArray, "array"),
        count = objj_msgSend(_allTemplates, "count"),
        t;

    while (count--)
    {
        var t = _allTemplates[count];
        if (objj_msgSend(t, "_rowType") == CPRuleEditorRowTypeCompound)
            objj_msgSend(templates, "insertObject:atIndex:", t, 0);
    }

    var trees = objj_msgSend(self, "_constructTreesForTemplates:", templates);
    if (objj_msgSend(trees, "count") > 0)
        _rootHeaderTrees = objj_msgSend(self, "_mergeTree:", trees);
}
},["void"]), new objj_method(sel_getUid("_constructTreesForTemplates:"), function $CPPredicateEditor___constructTreesForTemplates_(self, _cmd, templates)
{ with(self)
{
    var trees = objj_msgSend(CPMutableArray, "array"),
        count = objj_msgSend(templates, "count");

    for (var i = 0; i < count; i++)
    {
        var tree = objj_msgSend(self, "_constructTreeForTemplate:", templates[i]);
        objj_msgSend(trees, "addObjectsFromArray:", tree);
    }

    return trees;
}
},["CPArray","id"]), new objj_method(sel_getUid("_mergeTree:"), function $CPPredicateEditor___mergeTree_(self, _cmd, aTree)
{ with(self)
{
    var mergedTree = objj_msgSend(CPMutableArray, "array");
    if (aTree == nil)
        return mergedTree;

    var icount = objj_msgSend(aTree, "count");
    for (var i = 0; i < icount; i++)
    {
        var anode = objj_msgSend(aTree, "objectAtIndex:", i),
            jcount = objj_msgSend(mergedTree, "count"),
            merged = NO;

        for (var j = 0; j < jcount; j++)
        {
            var mergednode = objj_msgSend(mergedTree, "objectAtIndex:", j);

            if (objj_msgSend(objj_msgSend(mergednode, "title"), "isEqualToString:", objj_msgSend(anode, "title")))
            {
                var children1 = objj_msgSend(mergednode, "children"),
                    children2 = objj_msgSend(anode, "children"),
                    children12 = objj_msgSend(children1, "arrayByAddingObjectsFromArray:", children2),
                    mergedChildren = objj_msgSend(self, "_mergeTree:", children12);

                objj_msgSend(mergednode, "setChildren:", mergedChildren);
                merged = YES;
            }
        }

        if (!merged)
            objj_msgSend(mergedTree, "addObject:", anode);
    }

    return mergedTree;
}
},["CPMutableArray","CPArray"]), new objj_method(sel_getUid("_constructTreeForTemplate:"), function $CPPredicateEditor___constructTreeForTemplate_(self, _cmd, aTemplate)
{ with(self)
{
    var tree = objj_msgSend(CPArray, "array"),
        templateViews = objj_msgSend(aTemplate, "templateViews"),
        count = objj_msgSend(templateViews, "count");

    while (count--)
    {
        var children = objj_msgSend(CPArray, "array"),
            itemsCount = 0,
            menuIndex = -1,
            itemsArray,

            templateView = objj_msgSend(templateViews, "objectAtIndex:", count),
            isPopup = objj_msgSend(templateView, "isKindOfClass:", objj_msgSend(CPPopUpButton, "class"));

        if (isPopup)
        {
            itemArray = objj_msgSend(objj_msgSend(templateView, "itemArray"), "valueForKey:", "title");
            itemsCount = objj_msgSend(itemArray, "count");
            menuIndex = 0;
        }

        for (; menuIndex < itemsCount; menuIndex++)
        {
            var item = objj_msgSend(_CPPredicateEditorTree, "new");
            objj_msgSend(item, "setIndexIntoTemplate:", count);
            objj_msgSend(item, "setTemplate:", aTemplate);
            objj_msgSend(item, "setMenuItemIndex:", menuIndex);
            if (isPopup)
                objj_msgSend(item, "setTitle:", objj_msgSend(itemArray, "objectAtIndex:", menuIndex));

            objj_msgSend(children, "addObject:", item);
        }

        objj_msgSend(children, "makeObjectsPerformSelector:withObject:", sel_getUid("setChildren:"), tree);
        tree = children;
    }

    return tree;
}
},["id","CPPredicateEditorRowTemplate"]), new objj_method(sel_getUid("setObjectValue:"), function $CPPredicateEditor__setObjectValue_(self, _cmd, objectValue)
{ with(self)
{
    var ov = objj_msgSend(self, "objectValue");
    if ((ov == nil) != (objectValue == nil) || !objj_msgSend(ov, "isEqual:", objectValue))
    {
        objj_msgSend(self, "_setPredicate:", objectValue);
        objj_msgSend(self, "_reflectPredicate:", objectValue);
    }
}
},["void","id"]), new objj_method(sel_getUid("_reflectPredicate:"), function $CPPredicateEditor___reflectPredicate_(self, _cmd, predicate)
{ with(self)
{
    var animation = _currentAnimation;
    _currentAnimation = nil;
    _sendAction = NO;

    if (predicate != nil)
    {
        if ((_nestingMode == CPRuleEditorNestingModeSimple || _nestingMode == CPRuleEditorNestingModeCompound)
            && objj_msgSend(predicate, "isKindOfClass:", objj_msgSend(CPComparisonPredicate, "class")))
            predicate = objj_msgSend(objj_msgSend(CPCompoundPredicate, "alloc"), "initWithType:subpredicates:", objj_msgSend(self, "_compoundPredicateTypeForRootRows"), objj_msgSend(CPArray, "arrayWithObject:", predicate));

        var row = objj_msgSend(self, "_rowObjectFromPredicate:", predicate);
        if (row != nil)
            objj_msgSend(_boundArrayOwner, "setValue:forKey:", objj_msgSend(CPArray, "arrayWithObject:", row), _boundArrayKeyPath);
    }

    objj_msgSend(self, "setAnimation:", animation);
}
},["void","id"]), new objj_method(sel_getUid("_rowObjectFromPredicate:"), function $CPPredicateEditor___rowObjectFromPredicate_(self, _cmd, predicate)
{ with(self)
{
    var quality,
        type,
        matchedTemplate = objj_msgSend(CPPredicateEditorRowTemplate, "_bestMatchForPredicate:inTemplates:quality:", predicate, objj_msgSend(self, "rowTemplates"), quality);

    if (matchedTemplate == nil)
        return nil;

    var copyTemplate = objj_msgSend(matchedTemplate, "copy"),
        subpredicates = objj_msgSend(matchedTemplate, "displayableSubpredicatesOfPredicate:", predicate);

    if (subpredicates == nil)
    {
        objj_msgSend(copyTemplate, "_setComparisonPredicate:", predicate);
        type = CPRuleEditorRowTypeSimple;
    }
    else
    {
        objj_msgSend(copyTemplate, "_setCompoundPredicate:", predicate);
        type = CPRuleEditorRowTypeCompound;
    }

    var row = objj_msgSend(self, "_rowFromTemplate:originalTemplate:withRowType:", copyTemplate, matchedTemplate, type);

    if (subpredicates == nil)
        return row;

    var count = objj_msgSend(subpredicates, "count"),
        subrows = objj_msgSend(CPMutableArray, "array");

    for (var i = 0; i < count; i++)
    {
        var subrow = objj_msgSend(self, "_rowObjectFromPredicate:", subpredicates[i]);
        if (subrow != nil)
            objj_msgSend(subrows, "addObject:", subrow);
    }

    objj_msgSend(row, "setValue:forKey:", subrows, objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditor").super_class }, "subrowsKeyPath"));

    return row;
}
},["id","CPPredicate"]), new objj_method(sel_getUid("_rowFromTemplate:originalTemplate:withRowType:"), function $CPPredicateEditor___rowFromTemplate_originalTemplate_withRowType_(self, _cmd, aTemplate, originalTemplate, rowType)
{ with(self)
{
    var criteria = objj_msgSend(CPArray, "array"),
        values = objj_msgSend(CPArray, "array"),
        templateViews = objj_msgSend(aTemplate, "templateViews"),
        rootItems,
        count;

    rootItems = (rowType == CPRuleEditorRowTypeSimple) ? _rootTrees : _rootHeaderTrees;

    while ((count = objj_msgSend(rootItems, "count")) > 0)
    {
        var treeChild;
        for (var i = 0; i < count; i++)
        {
            treeChild = objj_msgSend(rootItems, "objectAtIndex:", i);

            var currentView = objj_msgSend(templateViews, "objectAtIndex:", objj_msgSend(treeChild, "indexIntoTemplate")),
                title = objj_msgSend(treeChild, "title");

            if (title == nil || objj_msgSend(title, "isEqual:", objj_msgSend(currentView, "titleOfSelectedItem")))
            {
                var node = objj_msgSend(_CPPredicateEditorRowNode, "rowNodeFromTree:", treeChild);
                objj_msgSend(node, "applyTemplate:withViews:forOriginalTemplate:", aTemplate, templateViews, originalTemplate);

                objj_msgSend(criteria, "addObject:", node);
                objj_msgSend(values, "addObject:", objj_msgSend(node, "displayValue"));
                break;
            }
        }

        rootItems = objj_msgSend(treeChild, "children");
    }

    var row = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", criteria, "criteria", values, "displayValues", rowType, "rowType");

    return row;
}
},["id","CPPredicateEditorRowTemplate","CPPredicateEditorRowTemplate","CPRuleEditorRowType"]), new objj_method(sel_getUid("_updatePredicate"), function $CPPredicateEditor___updatePredicate(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "_updatePredicateFromRows");
}
},["void"]), new objj_method(sel_getUid("_updatePredicateFromRows"), function $CPPredicateEditor___updatePredicateFromRows(self, _cmd)
{ with(self)
{
    var rootRowsArray = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditor").super_class }, "_rootRowsArray"),
        subpredicates = objj_msgSend(CPMutableArray, "array"),
        count,
        count2 = count = objj_msgSend(rootRowsArray, "count"),
        predicate;

    while (count--)
    {
        var item = objj_msgSend(rootRowsArray, "objectAtIndex:", count),
            subpredicate = objj_msgSend(self, "_predicateFromRowItem:", item);

        if (subpredicate != nil)
            objj_msgSend(subpredicates, "insertObject:atIndex:", subpredicate, 0);
    }

    if (_nestingMode != CPRuleEditorNestingModeList && count2 == 1)
        predicate = objj_msgSend(subpredicates, "lastObject");
    else
        predicate = objj_msgSend(objj_msgSend(CPCompoundPredicate, "alloc"), "initWithType:subpredicates:", objj_msgSend(self, "_compoundPredicateTypeForRootRows"), subpredicates);

    objj_msgSend(self, "_setPredicate:", predicate);
}
},["void"]), new objj_method(sel_getUid("_predicateFromRowItem:"), function $CPPredicateEditor___predicateFromRowItem_(self, _cmd, rowItem)
{ with(self)
{
    var subpredicates = objj_msgSend(CPArray, "array"),
        rowType = objj_msgSend(rowItem, "valueForKey:", _typeKeyPath);

    if (rowType == CPRuleEditorRowTypeCompound)
    {
        var subrows = objj_msgSend(rowItem, "valueForKey:", _subrowsArrayKeyPath),
            count = objj_msgSend(subrows, "count");

        for (var i = 0; i < count; i++)
        {
            var subrow = objj_msgSend(subrows, "objectAtIndex:", i),
                predicate = objj_msgSend(self, "_predicateFromRowItem:", subrow);

            objj_msgSend(subpredicates, "addObject:", predicate);
        }
    }

    var criteria = objj_msgSend(rowItem, "valueForKey:", _itemsKeyPath),
        displayValues = objj_msgSend(rowItem, "valueForKey:", _valuesKeyPath),
        count = objj_msgSend(criteria, "count"),
        lastItem = objj_msgSend(criteria, "lastObject"),
        template = objj_msgSend(lastItem, "templateForRow"),
        templateViews = objj_msgSend(template, "templateViews");

    for (var j = 0; j < count; j++)
    {
        var view = objj_msgSend(templateViews, "objectAtIndex:", j),
            value = objj_msgSend(displayValues, "objectAtIndex:", j);
        objj_msgSend(objj_msgSend(criteria, "objectAtIndex:", j), "setTemplateViews:", templateViews);

        if (objj_msgSend(view, "isKindOfClass:", objj_msgSend(CPPopUpButton, "class")))
            objj_msgSend(view, "selectItemWithTitle:", value);
        else if (objj_msgSend(view, "respondsToSelector:", sel_getUid("setObjectValue:")))
            objj_msgSend(view, "setObjectValue:", objj_msgSend(value, "objectValue"));
    }

    return objj_msgSend(template, "predicateWithSubpredicates:", subpredicates);
}
},["id","id"]), new objj_method(sel_getUid("_compoundPredicateTypeForRootRows"), function $CPPredicateEditor___compoundPredicateTypeForRootRows(self, _cmd)
{ with(self)
{
    return CPAndPredicateType;
}
},["CPCompoundPredicateType"]), new objj_method(sel_getUid("_sendRuleAction"), function $CPPredicateEditor___sendRuleAction(self, _cmd)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditor").super_class }, "_sendRuleAction");
}
},["void"]), new objj_method(sel_getUid("_sendsActionOnIncompleteTextChange"), function $CPPredicateEditor___sendsActionOnIncompleteTextChange(self, _cmd)
{ with(self)
{
    return NO;
}
},["BOOL"]), new objj_method(sel_getUid("_queryNumberOfChildrenOfItem:withRowType:"), function $CPPredicateEditor___queryNumberOfChildrenOfItem_withRowType_(self, _cmd, rowItem, type)
{ with(self)
{
    if (rowItem == nil)
    {
        var trees = (type == CPRuleEditorRowTypeSimple) ? _rootTrees : _rootHeaderTrees;
        return objj_msgSend(trees, "count");
    }
    return objj_msgSend(objj_msgSend(rowItem, "children"), "count");
}
},["int","id","int"]), new objj_method(sel_getUid("_queryChild:ofItem:withRowType:"), function $CPPredicateEditor___queryChild_ofItem_withRowType_(self, _cmd, childIndex, rowItem, type)
{ with(self)
{
    if (rowItem == nil)
    {
        var trees = (type == CPRuleEditorRowTypeSimple) ? _rootTrees : _rootHeaderTrees;
        return objj_msgSend(_CPPredicateEditorRowNode, "rowNodeFromTree:", trees[childIndex]);
    }

    return objj_msgSend(objj_msgSend(rowItem, "children"), "objectAtIndex:", childIndex);
}
},["id","int","id","int"]), new objj_method(sel_getUid("_queryValueForItem:inRow:"), function $CPPredicateEditor___queryValueForItem_inRow_(self, _cmd, rowItem, rowIndex)
{ with(self)
{
    return objj_msgSend(rowItem, "displayValue");
}
},["id","id","int"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_binderClassForBinding:"), function $CPPredicateEditor___binderClassForBinding_(self, _cmd, theBinding)
{ with(self)
{
    if (theBinding == CPValueBinding)
        return objj_msgSend(CPPredicateEditorValueBinder, "class");

    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPPredicateEditor").super_class }, "_binderClassForBinding:", theBinding);
}
},["Class","CPString"])]);
}

var CPPredicateTemplatesKey = "CPPredicateTemplates";

{
var the_class = objj_getClass("CPPredicateEditor")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPPredicateEditor\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPPredicateEditor__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditor").super_class }, "initWithCoder:", aCoder);

    if (self != nil)
    {
        var nibTemplates = objj_msgSend(aCoder, "decodeObjectForKey:", CPPredicateTemplatesKey);

        if (nibTemplates != nil)
            objj_msgSend(self, "setRowTemplates:", nibTemplates);
    }

    return self;
}
},["id","id"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPPredicateEditor__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditor").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", _allTemplates, CPPredicateTemplatesKey);
}
},["void","id"])]);
}

{var the_class = objj_allocateClassPair(CPBinder, "CPPredicateEditorValueBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"), function $CPPredicateEditorValueBinder__setPlaceholderValue_withMarker_forBinding_(self, _cmd, aValue, aMarker, aBinding)
{ with(self)
{
    objj_msgSend(_source, "_reflectPredicate:", nil);
}
},["void","id","CPString","CPString"]), new objj_method(sel_getUid("setValue:forBinding:"), function $CPPredicateEditorValueBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{ with(self)
{
    objj_msgSend(_source, "_reflectPredicate:", aValue);
}
},["void","id","CPString"])]);
}

