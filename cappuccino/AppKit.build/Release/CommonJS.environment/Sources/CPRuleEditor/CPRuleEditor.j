@STATIC;1.0;I;24;Foundation/CPPredicate.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;23;Foundation/CPIndexSet.ji;14;CPPasteboard.ji;24;CPRuleEditor_Constants.ji;13;CPTextField.ji;17;CPViewAnimation.ji;8;CPView.ji;27;_CPRuleEditorViewSliceRow.ji;24;_CPRuleEditorLocalizer.jt;95903;objj_executeFile("Foundation/CPPredicate.j", NO);objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("Foundation/CPDictionary.j", NO);objj_executeFile("Foundation/CPIndexSet.j", NO);objj_executeFile("CPPasteboard.j", YES);objj_executeFile("CPRuleEditor_Constants.j", YES);objj_executeFile("CPTextField.j", YES);objj_executeFile("CPViewAnimation.j", YES);objj_executeFile("CPView.j", YES);objj_executeFile("_CPRuleEditorViewSliceRow.j", YES);objj_executeFile("_CPRuleEditorLocalizer.j", YES);var CPRuleEditorItemPBoardType = "CPRuleEditorItemPBoardType",
    itemsContext = "items",
    valuesContext = "values",
    subrowsContext = "subrows_array",
    boundArrayContext = "bound_array";
{var the_class = objj_allocateClassPair(CPControl, "CPRuleEditor"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_suppressKeyDownHandling"), new objj_ivar("_allowsEmptyCompoundRows"), new objj_ivar("_disallowEmpty"), new objj_ivar("_delegateWantsValidation"), new objj_ivar("_editable"), new objj_ivar("_sendAction"), new objj_ivar("_rowClass"), new objj_ivar("_draggingRows"), new objj_ivar("_subviewIndexOfDropLine"), new objj_ivar("_dropLineView"), new objj_ivar("_rowCache"), new objj_ivar("_slices"), new objj_ivar("_predicate"), new objj_ivar("_itemsKeyPath"), new objj_ivar("_subrowsArrayKeyPath"), new objj_ivar("_typeKeyPath"), new objj_ivar("_valuesKeyPath"), new objj_ivar("_boundArrayKeyPath"), new objj_ivar("_slicesHolder"), new objj_ivar("_currentAnimation"), new objj_ivar("_lastRow"), new objj_ivar("_nestingMode"), new objj_ivar("_alignmentGridWidth"), new objj_ivar("_sliceHeight"), new objj_ivar("_ruleDataSource"), new objj_ivar("_ruleDelegate"), new objj_ivar("_boundArrayOwner"), new objj_ivar("_stringsFilename"), new objj_ivar("_isKeyDown"), new objj_ivar("_nestingModeDidChange"), new objj_ivar("_standardLocalizer"), new objj_ivar("_itemsAndValuesToAddForRowType")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("boundArrayKeyPath"), function $CPRuleEditor__boundArrayKeyPath(self, _cmd)
{
    return self._boundArrayKeyPath;
}
,["CPString"]), new objj_method(sel_getUid("setBoundArrayKeyPath:"), function $CPRuleEditor__setBoundArrayKeyPath_(self, _cmd, newValue)
{
    self._boundArrayKeyPath = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("standardLocalizer"), function $CPRuleEditor__standardLocalizer(self, _cmd)
{
    return self._standardLocalizer;
}
,["_CPRuleEditorLocalizer"]), new objj_method(sel_getUid("setStandardLocalizer:"), function $CPRuleEditor__setStandardLocalizer_(self, _cmd, newValue)
{
    self._standardLocalizer = newValue;
}
,["void","_CPRuleEditorLocalizer"]), new objj_method(sel_getUid("initWithFrame:"), function $CPRuleEditor__initWithFrame_(self, _cmd, frame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRuleEditor").super_class }, "initWithFrame:", frame);
    if (self !== nil)
    {
        self._slices = objj_msgSend(objj_msgSend(CPMutableArray, "alloc"), "init");
        self._sliceHeight = 26.;
        self._nestingMode = CPRuleEditorNestingModeSimple;
        self._editable = YES;
        self._allowsEmptyCompoundRows = NO;
        self._disallowEmpty = NO;
        objj_msgSend(self, "setFormattingStringsFilename:", nil);
        objj_msgSend(self, "setCriteriaKeyPath:", "criteria");
        objj_msgSend(self, "setSubrowsKeyPath:", "subrows");
        objj_msgSend(self, "setRowTypeKeyPath:", "rowType");
        objj_msgSend(self, "setDisplayValuesKeyPath:", "displayValues");
        objj_msgSend(self, "setBoundArrayKeyPath:", "boundArray");
        self._slicesHolder = objj_msgSend(objj_msgSend(_CPRuleEditorViewSliceHolder, "alloc"), "initWithFrame:", objj_msgSend(self, "bounds"));
        objj_msgSend(self, "addSubview:", self._slicesHolder);
        self._boundArrayOwner = objj_msgSend(objj_msgSend(_CPRuleEditorViewUnboundRowHolder, "alloc"), "init");
        objj_msgSend(self, "_initRuleEditorShared");
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("_initRuleEditorShared"), function $CPRuleEditor___initRuleEditorShared(self, _cmd)
{
    self._rowCache = objj_msgSend(objj_msgSend(CPMutableArray, "alloc"), "init");
    self._rowClass = objj_msgSend(_CPRuleEditorRowObject, "class");
    self._isKeyDown = NO;
    self._subviewIndexOfDropLine = CPNotFound;
    self._lastRow = 0;
    self._delegateWantsValidation = YES;
    self._suppressKeyDownHandling = NO;
    self._nestingModeDidChange = NO;
    self._sendAction = YES;
    self._itemsAndValuesToAddForRowType = {};
    var animation = objj_msgSend(objj_msgSend(CPViewAnimation, "alloc"), "initWithDuration:animationCurve:", 0.5, CPAnimationEaseInOut);
    objj_msgSend(self, "setAnimation:", animation);
    objj_msgSend(self._slicesHolder, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    self._dropLineView = objj_msgSend(self, "_createSliceDropSeparator");
    objj_msgSend(self._slicesHolder, "addSubview:", self._dropLineView);
    objj_msgSend(self, "registerForDraggedTypes:", objj_msgSend(CPArray, "arrayWithObjects:", CPRuleEditorItemPBoardType, nil));
    objj_msgSend(self._boundArrayOwner, "addObserver:forKeyPath:options:context:", self, self._boundArrayKeyPath, CPKeyValueObservingOptionOld | CPKeyValueObservingOptionNew, boundArrayContext);
}
,["void"]), new objj_method(sel_getUid("delegate"), function $CPRuleEditor__delegate(self, _cmd)
{
    return self._ruleDelegate;
}
,["id"]), new objj_method(sel_getUid("setDelegate:"), function $CPRuleEditor__setDelegate_(self, _cmd, aDelegate)
{
    if (self._ruleDelegate === aDelegate)
        return;
    var nc = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (self._ruleDelegate)
        objj_msgSend(nc, "removeObserver:name:object:", self._ruleDelegate, nil, self);
    self._ruleDelegate = aDelegate;
    if (objj_msgSend(self._ruleDelegate, "respondsToSelector:", sel_getUid("ruleEditorRowsDidChange:")))
        objj_msgSend(nc, "addObserver:selector:name:object:", self._ruleDelegate, sel_getUid("ruleEditorRowsDidChange:"), CPRuleEditorRowsDidChangeNotification, nil);
}
,["void","id"]), new objj_method(sel_getUid("isEditable"), function $CPRuleEditor__isEditable(self, _cmd)
{
    return self._editable;
}
,["BOOL"]), new objj_method(sel_getUid("setEditable:"), function $CPRuleEditor__setEditable_(self, _cmd, editable)
{
    if (editable === self._editable)
        return;
    self._editable = editable;
    if (!self._editable)
        objj_msgSend(self, "_deselectAll");
    objj_msgSend(self._slices, "makeObjectsPerformSelector:withObject:", sel_getUid("setEditable:"), self._editable);
}
,["void","BOOL"]), new objj_method(sel_getUid("nestingMode"), function $CPRuleEditor__nestingMode(self, _cmd)
{
    return self._nestingMode;
}
,["CPRuleEditorNestingMode"]), new objj_method(sel_getUid("setNestingMode:"), function $CPRuleEditor__setNestingMode_(self, _cmd, mode)
{
    if (mode !== self._nestingMode)
    {
        self._nestingMode = mode;
        if (objj_msgSend(self, "numberOfRows") > 0)
            self._nestingModeDidChange = YES;
    }
}
,["void","CPRuleEditorNestingMode"]), new objj_method(sel_getUid("canRemoveAllRows"), function $CPRuleEditor__canRemoveAllRows(self, _cmd)
{
    return !self._disallowEmpty;
}
,["BOOL"]), new objj_method(sel_getUid("setCanRemoveAllRows:"), function $CPRuleEditor__setCanRemoveAllRows_(self, _cmd, canRemove)
{
    self._disallowEmpty = !canRemove;
    objj_msgSend(self, "_updateButtonVisibilities");
}
,["void","BOOL"]), new objj_method(sel_getUid("allowsEmptyCompoundRows"), function $CPRuleEditor__allowsEmptyCompoundRows(self, _cmd)
{
    return self._allowsEmptyCompoundRows;
}
,["BOOL"]), new objj_method(sel_getUid("setAllowsEmptyCompoundRows:"), function $CPRuleEditor__setAllowsEmptyCompoundRows_(self, _cmd, allows)
{
    self._allowsEmptyCompoundRows = allows;
    objj_msgSend(self, "_updateButtonVisibilities");
}
,["void","BOOL"]), new objj_method(sel_getUid("rowHeight"), function $CPRuleEditor__rowHeight(self, _cmd)
{
    return self._sliceHeight;
}
,["CPInteger"]), new objj_method(sel_getUid("setRowHeight:"), function $CPRuleEditor__setRowHeight_(self, _cmd, height)
{
    if (height === self._sliceHeight)
        return;
    self._sliceHeight = MAX(objj_msgSend(self, "_minimumFrameHeight"), height);
    objj_msgSend(self, "_reconfigureSubviewsAnimate:", NO);
}
,["void","float"]), new objj_method(sel_getUid("formattingDictionary"), function $CPRuleEditor__formattingDictionary(self, _cmd)
{
    return objj_msgSend(self._standardLocalizer, "dictionary");
}
,["CPDictionary"]), new objj_method(sel_getUid("setFormattingDictionary:"), function $CPRuleEditor__setFormattingDictionary_(self, _cmd, dictionary)
{
    objj_msgSend(self._standardLocalizer, "setDictionary:", dictionary);
    self._stringsFilename = nil;
}
,["void","CPDictionary"]), new objj_method(sel_getUid("formattingStringsFilename"), function $CPRuleEditor__formattingStringsFilename(self, _cmd)
{
    return self._stringsFilename;
}
,["CPString"]), new objj_method(sel_getUid("setFormattingStringsFilename:"), function $CPRuleEditor__setFormattingStringsFilename_(self, _cmd, stringsFilename)
{
    if (self._standardLocalizer === nil)
        self._standardLocalizer = objj_msgSend(_CPRuleEditorLocalizer, "new");
    if (self._stringsFilename !== stringsFilename)
    {
        self._stringsFilename = stringsFilename || nil;
        if (stringsFilename !== nil)
        {
            if (!objj_msgSend(stringsFilename, "hasSuffix:", ".strings"))
                stringsFilename = stringsFilename + ".strings";
            var path = objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "pathForResource:", stringsFilename);
            if (path !== nil)
                objj_msgSend(self._standardLocalizer, "loadContentOfURL:", objj_msgSend(CPURL, "URLWithString:", path));
        }
    }
}
,["void","CPString"]), new objj_method(sel_getUid("reloadCriteria"), function $CPRuleEditor__reloadCriteria(self, _cmd)
{
    var current_rows = objj_msgSend(self._boundArrayOwner, "valueForKey:", self._boundArrayKeyPath);
    objj_msgSend(self, "_stopObservingRowObjectsRecursively:", current_rows);
    objj_msgSend(self._boundArrayOwner, "setValue:forKey:", objj_msgSend(CPArray, "arrayWithArray:", current_rows), self._boundArrayKeyPath);
}
,["void"]), new objj_method(sel_getUid("setCriteria:andDisplayValues:forRowAtIndex:"), function $CPRuleEditor__setCriteria_andDisplayValues_forRowAtIndex_(self, _cmd, criteria, values, rowIndex)
{
    if (criteria === nil || values === nil)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, _cmd + ". criteria and values parameters must not be nil.");
    if (rowIndex < 0 || rowIndex >= objj_msgSend(self, "numberOfRows"))
        objj_msgSend(CPException, "raise:reason:", CPRangeException, _cmd + ". rowIndex is out of bounds.");
    var rowObject = objj_msgSend(objj_msgSend(self, "_rowCacheForIndex:", rowIndex), "rowObject");
    objj_msgSend(rowObject, "setValue:forKey:", criteria, self._itemsKeyPath);
    objj_msgSend(rowObject, "setValue:forKey:", values, self._valuesKeyPath);
    objj_msgSend(self, "reloadCriteria");
}
,["void","CPArray","CPArray","int"]), new objj_method(sel_getUid("criteriaForRow:"), function $CPRuleEditor__criteriaForRow_(self, _cmd, row)
{
    var rowcache = objj_msgSend(self, "_rowCacheForIndex:", row);
    if (rowcache)
        return objj_msgSend(objj_msgSend(rowcache, "rowObject"), "valueForKey:", self._itemsKeyPath);
    return nil;
}
,["id","CPInteger"]), new objj_method(sel_getUid("displayValuesForRow:"), function $CPRuleEditor__displayValuesForRow_(self, _cmd, row)
{
    var rowcache = objj_msgSend(self, "_rowCacheForIndex:", row);
    if (rowcache)
        return objj_msgSend(objj_msgSend(rowcache, "rowObject"), "valueForKey:", self._valuesKeyPath);
    return nil;
}
,["CPMutableArray","CPInteger"]), new objj_method(sel_getUid("numberOfRows"), function $CPRuleEditor__numberOfRows(self, _cmd)
{
    return objj_msgSend(self._slices, "count");
}
,["int"]), new objj_method(sel_getUid("parentRowForRow:"), function $CPRuleEditor__parentRowForRow_(self, _cmd, rowIndex)
{
    if (rowIndex < 0 || rowIndex >= objj_msgSend(self, "numberOfRows"))
        objj_msgSend(CPException, "raise:reason:", CPRangeException, _cmd + " row " + rowIndex + " is out of range");
    var targetObject = objj_msgSend(objj_msgSend(self, "_rowCacheForIndex:", rowIndex), "rowObject");
    for (var current_index = 0; current_index < rowIndex; current_index++)
    {
        if (objj_msgSend(self, "rowTypeForRow:", current_index) === CPRuleEditorRowTypeCompound)
        {
            var candidate = objj_msgSend(objj_msgSend(self, "_rowCacheForIndex:", current_index), "rowObject"),
                subObjects = objj_msgSend(objj_msgSend(self, "_subrowObjectsOfObject:", candidate), "_representedObject");
            if (objj_msgSend(subObjects, "indexOfObjectIdenticalTo:", targetObject) !== CPNotFound)
                return current_index;
        }
    }
    return -1;
}
,["int","CPInteger"]), new objj_method(sel_getUid("rowTypeForRow:"), function $CPRuleEditor__rowTypeForRow_(self, _cmd, rowIndex)
{
    if (rowIndex < 0 || rowIndex > objj_msgSend(self, "numberOfRows"))
        objj_msgSend(CPException, "raise:reason:", CPRangeException, _cmd + "row " + rowIndex + " is out of range");
    var rowcache = objj_msgSend(self, "_rowCacheForIndex:", rowIndex);
    if (rowcache)
    {
        var rowobject = objj_msgSend(rowcache, "rowObject");
        return objj_msgSend(rowobject, "valueForKey:", self._typeKeyPath);
    }
    return CPNotFound;
}
,["CPRuleEditorRowType","CPInteger"]), new objj_method(sel_getUid("subrowIndexesForRow:"), function $CPRuleEditor__subrowIndexesForRow_(self, _cmd, rowIndex)
{
    var object;
    if (rowIndex === -1)
        object = self._boundArrayOwner;
    else
        object = objj_msgSend(objj_msgSend(self, "_rowCacheForIndex:", rowIndex), "rowObject");
    var subobjects = objj_msgSend(self, "_subrowObjectsOfObject:", object),
        objectsCount = objj_msgSend(subobjects, "count"),
        indexes = objj_msgSend(CPMutableIndexSet, "indexSet"),
        count = objj_msgSend(self, "numberOfRows");
    for (var i = rowIndex + 1; i < count; i++)
    {
        var candidate = objj_msgSend(objj_msgSend(self, "_rowCacheForIndex:", i), "rowObject"),
            indexInSubrows = objj_msgSend(objj_msgSend(subobjects, "_representedObject"), "indexOfObjectIdenticalTo:", candidate);
        if (indexInSubrows !== CPNotFound)
        {
            objj_msgSend(indexes, "addIndex:", i);
            objectsCount--;
            if (objj_msgSend(self, "rowTypeForRow:", i) === CPRuleEditorRowTypeCompound)
                i += objj_msgSend(objj_msgSend(self, "subrowIndexesForRow:", i), "count");
        }
        if (objectsCount === 0)
            break;
    }
    return indexes;
}
,["CPIndexSet","CPInteger"]), new objj_method(sel_getUid("selectedRowIndexes"), function $CPRuleEditor__selectedRowIndexes(self, _cmd)
{
    return objj_msgSend(self, "_selectedSliceIndices");
}
,["CPIndexSet"]), new objj_method(sel_getUid("selectRowIndexes:byExtendingSelection:"), function $CPRuleEditor__selectRowIndexes_byExtendingSelection_(self, _cmd, indexes, extend)
{
    var count = objj_msgSend(self._slices, "count"),
        lastSelected = objj_msgSend(indexes, "lastIndex");
    if (lastSelected >= objj_msgSend(self, "numberOfRows"))
        objj_msgSend(CPException, "raise:reason:", CPRangeException, "row indexes " + indexes + " are out of range");
    if (!extend)
        objj_msgSend(self, "_deselectAll");
    while (count--)
    {
        var slice = self._slices[count],
            rowIndex = objj_msgSend(slice, "rowIndex"),
            contains = objj_msgSend(indexes, "containsIndex:", rowIndex),
            shouldSelect = contains && !(extend && objj_msgSend(slice, "_isSelected"));
        if (contains)
            objj_msgSend(slice, "_setSelected:", shouldSelect);
        objj_msgSend(slice, "_setLastSelected:", rowIndex === lastSelected);
        objj_msgSend(slice, "setNeedsDisplay:", YES);
    }
}
,["void","CPIndexSet","BOOL"]), new objj_method(sel_getUid("addRow:"), function $CPRuleEditor__addRow_(self, _cmd, sender)
{
    var parentRowIndex = -1,
        rowtype,
        numberOfRows = objj_msgSend(self, "numberOfRows"),
        hasRows = numberOfRows > 0,
        nestingMode = objj_msgSend(self, "_applicableNestingMode");
    switch(nestingMode) {
    case CPRuleEditorNestingModeSimple:
        rowtype = hasRows ? CPRuleEditorRowTypeSimple : CPRuleEditorRowTypeCompound;
        if (hasRows)
            parentRowIndex = 0;
        break;
    case CPRuleEditorNestingModeSingle:
        if (hasRows)
            return;
    case CPRuleEditorNestingModeList:
        rowtype = CPRuleEditorRowTypeSimple;
        break;
    case CPRuleEditorNestingModeCompound:
        rowtype = CPRuleEditorRowTypeCompound;
        if (hasRows)
            parentRowIndex = 0;
        break;
default:
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "Not supported CPRuleEditorNestingMode " + nestingMode);
    }
    objj_msgSend(self, "insertRowAtIndex:withType:asSubrowOfRow:animate:", numberOfRows, rowtype, parentRowIndex, YES);
}
,["void","id"]), new objj_method(sel_getUid("insertRowAtIndex:withType:asSubrowOfRow:animate:"), function $CPRuleEditor__insertRowAtIndex_withType_asSubrowOfRow_animate_(self, _cmd, rowIndex, rowType, parentRow, shouldAnimate)
{
    var newObject = objj_msgSend(self, "_insertNewRowAtIndex:ofType:withParentRow:", rowIndex, rowType, parentRow);
    if (rowType === CPRuleEditorRowTypeCompound && !self._allowsEmptyCompoundRows)
    {
        var subrow = objj_msgSend(self, "_insertNewRowAtIndex:ofType:withParentRow:", rowIndex + 1, CPRuleEditorRowTypeSimple, rowIndex);
    }
}
,["void","int","unsigned int","CPInteger","BOOL"]), new objj_method(sel_getUid("removeRowAtIndex:"), function $CPRuleEditor__removeRowAtIndex_(self, _cmd, rowIndex)
{
    if (rowIndex < 0 || rowIndex >= objj_msgSend(self, "numberOfRows"))
        objj_msgSend(CPException, "raise:reason:", CPRangeException, "row " + rowIndex + " is out of range");
    objj_msgSend(self, "removeRowsAtIndexes:includeSubrows:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", rowIndex), NO);
}
,["void","int"]), new objj_method(sel_getUid("removeRowsAtIndexes:includeSubrows:"), function $CPRuleEditor__removeRowsAtIndexes_includeSubrows_(self, _cmd, rowIndexes, includeSubrows)
{
    if (objj_msgSend(rowIndexes, "count") === 0)
        return;
    if (objj_msgSend(rowIndexes, "lastIndex") >= objj_msgSend(self, "numberOfRows"))
        objj_msgSend(CPException, "raise:reason:", CPRangeException, "rows indexes " + rowIndexes + " are out of range");
    var current_index = objj_msgSend(rowIndexes, "firstIndex"),
        parentRowIndex = objj_msgSend(self, "parentRowForRow:", current_index),
        childsIndexes = objj_msgSend(CPMutableIndexSet, "indexSet"),
        subrows;
    if (parentRowIndex === -1)
        subrows = objj_msgSend(self, "_rootRowsArray");
    else
    {
        var parentRowObject = objj_msgSend(objj_msgSend(self, "_rowCacheForIndex:", parentRowIndex), "rowObject");
        subrows = objj_msgSend(self, "_subrowObjectsOfObject:", parentRowObject);
    }
    while (current_index !== CPNotFound)
    {
        var rowObject = objj_msgSend(objj_msgSend(self, "_rowCacheForIndex:", current_index), "rowObject"),
            relativeChildIndex = objj_msgSend(objj_msgSend(subrows, "_representedObject"), "indexOfObjectIdenticalTo:", rowObject);
        if (relativeChildIndex !== CPNotFound)
            objj_msgSend(childsIndexes, "addIndex:", relativeChildIndex);
        if (includeSubrows && objj_msgSend(self, "rowTypeForRow:", current_index) === CPRuleEditorRowTypeCompound)
        {
            var more_childs = objj_msgSend(self, "subrowIndexesForRow:", current_index);
            objj_msgSend(self, "removeRowsAtIndexes:includeSubrows:", more_childs, includeSubrows);
        }
        current_index = objj_msgSend(rowIndexes, "indexGreaterThanIndex:", current_index);
    }
    objj_msgSend(subrows, "removeObjectsAtIndexes:", childsIndexes);
}
,["void","CPIndexSet","BOOL"]), new objj_method(sel_getUid("predicate"), function $CPRuleEditor__predicate(self, _cmd)
{
    return self._predicate;
}
,["CPPredicate"]), new objj_method(sel_getUid("reloadPredicate"), function $CPRuleEditor__reloadPredicate(self, _cmd)
{
    objj_msgSend(self, "_updatePredicate");
}
,["void"]), new objj_method(sel_getUid("predicateForRow:"), function $CPRuleEditor__predicateForRow_(self, _cmd, aRow)
{
    var predicateParts = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init"),
        items = objj_msgSend(self, "criteriaForRow:", aRow),
        count = objj_msgSend(items, "count"),
        predicate,
        i;
    for (i = 0; i < count; i++)
    {
        var item = objj_msgSend(items, "objectAtIndex:", i),
            displayValue = objj_msgSend(objj_msgSend(self, "displayValuesForRow:", aRow), "objectAtIndex:", i),
            predpart = objj_msgSend(self._ruleDelegate, "ruleEditor:predicatePartsForCriterion:withDisplayValue:inRow:", self, item, displayValue, aRow);
        if (predpart)
            objj_msgSend(predicateParts, "addEntriesFromDictionary:", predpart);
    }
    if (objj_msgSend(self, "rowTypeForRow:", aRow) === CPRuleEditorRowTypeCompound)
    {
        var compoundPredicate,
            subpredicates = objj_msgSend(CPMutableArray, "array"),
            subrowsIndexes = objj_msgSend(self, "subrowIndexesForRow:", aRow);
        if (objj_msgSend(subrowsIndexes, "count") === 0)
            return nil;
        var current_index = objj_msgSend(subrowsIndexes, "firstIndex");
        while (current_index !== CPNotFound)
        {
            var subpredicate = objj_msgSend(self, "predicateForRow:", current_index);
            if (subpredicate !== nil)
                objj_msgSend(subpredicates, "addObject:", subpredicate);
            current_index = objj_msgSend(subrowsIndexes, "indexGreaterThanIndex:", current_index);
        }
        var compoundType = objj_msgSend(predicateParts, "objectForKey:", CPRuleEditorPredicateCompoundType);
        if (objj_msgSend(subpredicates, "count") === 0)
            return nil;
        else
        {
            try            {
                compoundPredicate = objj_msgSend(objj_msgSend(CPCompoundPredicate, "alloc"), "initWithType:subpredicates:", compoundType, subpredicates);
            }
            catch(error)             {
                CPLogConsole("Compound predicate error: [%@]\npredicateType:%i", objj_msgSend(error, "description"), compoundType);
                compoundPredicate = nil;
            }            finally             {
                return compoundPredicate;
            }
        }
    }
    var lhs = objj_msgSend(predicateParts, "objectForKey:", CPRuleEditorPredicateLeftExpression),
        rhs = objj_msgSend(predicateParts, "objectForKey:", CPRuleEditorPredicateRightExpression),
        operator = objj_msgSend(predicateParts, "objectForKey:", CPRuleEditorPredicateOperatorType),
        options = objj_msgSend(predicateParts, "objectForKey:", CPRuleEditorPredicateOptions),
        modifier = objj_msgSend(predicateParts, "objectForKey:", CPRuleEditorPredicateComparisonModifier),
        selector = CPSelectorFromString(objj_msgSend(predicateParts, "objectForKey:", CPRuleEditorPredicateCustomSelector));
    if (lhs === nil)
    {
        CPLogConsole("missing left expression in predicate parts dictionary");
        return NULL;
    }
    if (rhs === nil)
    {
        CPLogConsole("missing right expression in predicate parts dictionary");
        return NULL;
    }
    if (selector === nil && operator === nil)
    {
        CPLogConsole("missing operator and selector in predicate parts dictionary");
        return NULL;
    }
    if (modifier === nil)
        CPLogConsole("missing modifier in predicate parts dictionary. Setting default: CPDirectPredicateModifier");
    if (options === nil)
        CPLogConsole("missing options in predicate parts dictionary. Setting default: CPCaseInsensitivePredicateOption");
    try    {
        if (selector !== nil)
            predicate = objj_msgSend(CPComparisonPredicate, "predicateWithLeftExpression:rightExpression:customSelector:", lhs, rhs, selector);
        else
            predicate = objj_msgSend(CPComparisonPredicate, "predicateWithLeftExpression:rightExpression:modifier:type:options:", lhs, rhs, modifier || CPDirectPredicateModifier, operator, options || CPCaseInsensitivePredicateOption);
    }
    catch(error)     {
        CPLogConsole("Row predicate error: [" + objj_msgSend(error, "description") + "] for row " + aRow);
        predicate = nil;
    }    finally     {
        return predicate;
    }
}
,["CPPredicate","CPInteger"]), new objj_method(sel_getUid("rowClass"), function $CPRuleEditor__rowClass(self, _cmd)
{
    return self._rowClass;
}
,["Class"]), new objj_method(sel_getUid("setRowClass:"), function $CPRuleEditor__setRowClass_(self, _cmd, rowClass)
{
    if (rowClass === objj_msgSend(CPMutableDictionary, "class"))
        rowClass = objj_msgSend(_CPRuleEditorRowObject, "class");
    self._rowClass = rowClass;
}
,["void","Class"]), new objj_method(sel_getUid("rowTypeKeyPath"), function $CPRuleEditor__rowTypeKeyPath(self, _cmd)
{
    return self._typeKeyPath;
}
,["CPString"]), new objj_method(sel_getUid("setRowTypeKeyPath:"), function $CPRuleEditor__setRowTypeKeyPath_(self, _cmd, keyPath)
{
    if (self._typeKeyPath !== keyPath)
        self._typeKeyPath = keyPath;
}
,["void","CPString"]), new objj_method(sel_getUid("subrowsKeyPath"), function $CPRuleEditor__subrowsKeyPath(self, _cmd)
{
    return self._subrowsArrayKeyPath;
}
,["CPString"]), new objj_method(sel_getUid("setSubrowsKeyPath:"), function $CPRuleEditor__setSubrowsKeyPath_(self, _cmd, keyPath)
{
    if (self._subrowsArrayKeyPath !== keyPath)
        self._subrowsArrayKeyPath = keyPath;
}
,["void","CPString"]), new objj_method(sel_getUid("criteriaKeyPath"), function $CPRuleEditor__criteriaKeyPath(self, _cmd)
{
    return self._itemsKeyPath;
}
,["CPString"]), new objj_method(sel_getUid("setCriteriaKeyPath:"), function $CPRuleEditor__setCriteriaKeyPath_(self, _cmd, keyPath)
{
    if (self._itemsKeyPath !== keyPath)
        self._itemsKeyPath = keyPath;
}
,["void","CPString"]), new objj_method(sel_getUid("displayValuesKeyPath"), function $CPRuleEditor__displayValuesKeyPath(self, _cmd)
{
    return self._valuesKeyPath;
}
,["CPString"]), new objj_method(sel_getUid("setDisplayValuesKeyPath:"), function $CPRuleEditor__setDisplayValuesKeyPath_(self, _cmd, keyPath)
{
    if (self._valuesKeyPath !== keyPath)
        self._valuesKeyPath = keyPath;
}
,["void","CPString"]), new objj_method(sel_getUid("animation"), function $CPRuleEditor__animation(self, _cmd)
{
    return self._currentAnimation;
}
,["id"]), new objj_method(sel_getUid("setAnimation:"), function $CPRuleEditor__setAnimation_(self, _cmd, animation)
{
    self._currentAnimation = animation;
    objj_msgSend(self._currentAnimation, "setDelegate:", self);
}
,["void","CPViewAnimation"]), new objj_method(sel_getUid("acceptsFirstResponder"), function $CPRuleEditor__acceptsFirstResponder(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("keyDown:"), function $CPRuleEditor__keyDown_(self, _cmd, event)
{
    if (!self._suppressKeyDownHandling && objj_msgSend(self, "_applicableNestingMode") === CPRuleEditorNestingModeCompound && !self._isKeyDown && objj_msgSend(event, "modifierFlags") & CPAlternateKeyMask)
    {
        objj_msgSend(self._slices, "makeObjectsPerformSelector:withObject:", sel_getUid("_configurePlusButtonByRowType:"), CPRuleEditorRowTypeCompound);
    }
    self._isKeyDown = YES;
}
,["void","CPEvent"]), new objj_method(sel_getUid("keyUp:"), function $CPRuleEditor__keyUp_(self, _cmd, event)
{
    if (!self._suppressKeyDownHandling)
    {
        objj_msgSend(self._slices, "makeObjectsPerformSelector:withObject:", sel_getUid("_configurePlusButtonByRowType:"), CPRuleEditorRowTypeSimple);
    }
    self._isKeyDown = NO;
}
,["void","CPEvent"]), new objj_method(sel_getUid("_createSliceDropSeparator"), function $CPRuleEditor___createSliceDropSeparator(self, _cmd)
{
    var view = objj_msgSend(objj_msgSend(_CPRuleEditorViewSliceDropSeparator, "alloc"), "initWithFrame:", CGRectMake(0, -10, objj_msgSend(self, "frame").size.width, 2));
    objj_msgSend(view, "setAutoresizingMask:", CPViewWidthSizable);
    return view;
}
,["_CPRuleEditorViewSliceDropSeparator"]), new objj_method(sel_getUid("_suppressKeyDownHandling"), function $CPRuleEditor___suppressKeyDownHandling(self, _cmd)
{
    return self._suppressKeyDownHandling;
}
,["BOOL"]), new objj_method(sel_getUid("_wantsRowAnimations"), function $CPRuleEditor___wantsRowAnimations(self, _cmd)
{
    return self._currentAnimation !== nil;
}
,["BOOL"]), new objj_method(sel_getUid("_updateButtonVisibilities"), function $CPRuleEditor___updateButtonVisibilities(self, _cmd)
{
    objj_msgSend(self._slices, "makeObjectsPerformSelector:", sel_getUid("_updateButtonVisibilities"));
}
,["void"]), new objj_method(sel_getUid("_alignmentGridWidth"), function $CPRuleEditor___alignmentGridWidth(self, _cmd)
{
    return self._alignmentGridWidth;
}
,["float"]), new objj_method(sel_getUid("_minimumFrameHeight"), function $CPRuleEditor___minimumFrameHeight(self, _cmd)
{
    return 26.;
}
,["float"]), new objj_method(sel_getUid("_applicableNestingMode"), function $CPRuleEditor___applicableNestingMode(self, _cmd)
{
    if (!self._nestingModeDidChange)
        return self._nestingMode;
    var a = self._nestingMode === CPRuleEditorNestingModeCompound || self._nestingMode === CPRuleEditorNestingModeSimple,
        b = objj_msgSend(self, "rowTypeForRow:", 0) === CPRuleEditorRowTypeCompound;
    if (a === b)
        return self._nestingMode;
    return a ? CPRuleEditorNestingModeList : CPRuleEditorNestingModeSimple;
}
,["CPRuleEditorNestingMode"]), new objj_method(sel_getUid("_shouldHideAddButtonForSlice:"), function $CPRuleEditor___shouldHideAddButtonForSlice_(self, _cmd, slice)
{
    return !self._editable || objj_msgSend(self, "_applicableNestingMode") === CPRuleEditorNestingModeSingle;
}
,["BOOL","id"]), new objj_method(sel_getUid("_shouldHideSubtractButtonForSlice:"), function $CPRuleEditor___shouldHideSubtractButtonForSlice_(self, _cmd, slice)
{
    if (!self._editable)
        return YES;
    if (!self._disallowEmpty)
        return NO;
    var shouldHide,
        rowIndex = objj_msgSend(slice, "rowIndex"),
        parentIndex = objj_msgSend(self, "parentRowForRow:", rowIndex),
        subrowsIndexes = objj_msgSend(self, "subrowIndexesForRow:", parentIndex),
        nestingMode = objj_msgSend(self, "_applicableNestingMode");
    switch(nestingMode) {
    case CPRuleEditorNestingModeCompound:
    case CPRuleEditorNestingModeSimple:
        shouldHide = objj_msgSend(subrowsIndexes, "count") === 1 && !self._allowsEmptyCompoundRows || parentIndex === -1;
        break;
    case CPRuleEditorNestingModeList:
        shouldHide = objj_msgSend(self, "numberOfRows") === 1;
        break;
    case CPRuleEditorNestingModeSingle:
        shouldHide = YES;
        break;
default:
        shouldHide = NO;
    }
    return shouldHide;
}
,["BOOL","id"]), new objj_method(sel_getUid("_rowCacheForIndex:"), function $CPRuleEditor___rowCacheForIndex_(self, _cmd, index)
{
    return objj_msgSend(self._rowCache, "objectAtIndex:", index);
}
,["id","int"]), new objj_method(sel_getUid("_searchCacheForRowObject:"), function $CPRuleEditor___searchCacheForRowObject_(self, _cmd, rowObject)
{
    var count = objj_msgSend(self._rowCache, "count"),
        i;
    for (i = 0; i < count; i++)
    {
        var cache = self._rowCache[i];
        if (objj_msgSend(cache, "rowObject") === rowObject)
            return cache;
    }
    return nil;
}
,["id","id"]), new objj_method(sel_getUid("_rowIndexForRowObject:"), function $CPRuleEditor___rowIndexForRowObject_(self, _cmd, rowobject)
{
    if (rowobject === self._boundArrayOwner)
        return -1;
    return objj_msgSend(objj_msgSend(self, "_searchCacheForRowObject:", rowobject), "rowIndex");
}
,["int","id"]), new objj_method(sel_getUid("_subrowObjectsOfObject:"), function $CPRuleEditor___subrowObjectsOfObject_(self, _cmd, object)
{
    if (object === self._boundArrayOwner)
        return objj_msgSend(self, "_rootRowsArray");
    return objj_msgSend(object, "mutableArrayValueForKey:", self._subrowsArrayKeyPath);
}
,["CPMutableArray","id"]), new objj_method(sel_getUid("_childlessParentsIfSlicesWereDeletedAtIndexes:"), function $CPRuleEditor___childlessParentsIfSlicesWereDeletedAtIndexes_(self, _cmd, indexes)
{
    var childlessParents = objj_msgSend(CPIndexSet, "indexSet"),
        current_index = objj_msgSend(indexes, "firstIndex");
    while (current_index !== CPNotFound)
    {
        var parentIndex = objj_msgSend(self, "parentRowForRow:", current_index),
            subrowsIndexes = objj_msgSend(self, "subrowIndexesForRow:", parentIndex);
        if (objj_msgSend(subrowsIndexes, "count") === 1)
        {
            if (parentIndex !== -1)
                return objj_msgSend(CPIndexSet, "indexSetWithIndex:", 0);
            var childlessGranPa = objj_msgSend(self, "_childlessParentsIfSlicesWereDeletedAtIndexes:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", parentIndex));
            objj_msgSend(childlessParents, "addIndexes:", childlessGranPa);
        }
        current_index = objj_msgSend(indexes, "indexGreaterThanIndex:", current_index);
    }
    return childlessParents;
}
,["CPIndexSet","id"]), new objj_method(sel_getUid("_includeSubslicesForSlicesAtIndexes:"), function $CPRuleEditor___includeSubslicesForSlicesAtIndexes_(self, _cmd, indexes)
{
    var subindexes = objj_msgSend(indexes, "copy"),
        current_index = objj_msgSend(indexes, "firstIndex");
    while (current_index !== CPNotFound)
    {
        var sub = objj_msgSend(self, "subrowIndexesForRow:", current_index);
        objj_msgSend(subindexes, "addIndexes:", objj_msgSend(self, "_includeSubslicesForSlicesAtIndexes:", sub));
        current_index = objj_msgSend(indexes, "indexGreaterThanIndex:", current_index);
    }
    return subindexes;
}
,["CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("_deleteSlice:"), function $CPRuleEditor___deleteSlice_(self, _cmd, slice)
{
    var rowindexes = objj_msgSend(CPIndexSet, "indexSetWithIndex:", objj_msgSend(slice, "rowIndex"));
    if (!self._allowsEmptyCompoundRows)
    {
        var childlessIndexes = objj_msgSend(self, "_childlessParentsIfSlicesWereDeletedAtIndexes:", rowindexes);
        if (objj_msgSend(childlessIndexes, "count") > 0)
            rowindexes = childlessIndexes;
    }
    objj_msgSend(self, "removeRowsAtIndexes:includeSubrows:", rowindexes, YES);
    objj_msgSend(self, "_updatePredicate");
    objj_msgSend(self, "_sendRuleAction");
    objj_msgSend(self, "_postRuleOptionChangedNotification");
    objj_msgSend(self, "_postRowCountChangedNotificationOfType:indexes:", CPRuleEditorRowsDidChangeNotification, rowindexes);
}
,["void","id"]), new objj_method(sel_getUid("_rootRowsArray"), function $CPRuleEditor___rootRowsArray(self, _cmd)
{
    return objj_msgSend(self._boundArrayOwner, "mutableArrayValueForKey:", self._boundArrayKeyPath);
}
,["CPArray"]), new objj_method(sel_getUid("_nextUnusedItems:andValues:forRow:forRowType:"), function $CPRuleEditor___nextUnusedItems_andValues_forRow_forRowType_(self, _cmd, items, values, rowIndex, type)
{
    var parentItem = objj_msgSend(items, "lastObject"),
        childrenCount = objj_msgSend(self, "_queryNumberOfChildrenOfItem:withRowType:", parentItem, type),
        foundIndex = CPNotFound;
    if (childrenCount === 0)
        return NO;
    var current_criterions = objj_msgSend(CPMutableArray, "array"),
        count = objj_msgSend(self, "numberOfRows"),
        row;
    for (row = 0; row < count; row++)
    {
        var aCriteria = objj_msgSend(self, "criteriaForRow:", row),
            itemIndex = objj_msgSend(items, "count");
        if (objj_msgSend(self, "rowTypeForRow:", row) === type && itemIndex < objj_msgSend(aCriteria, "count"))
        {
            var crit = objj_msgSend(aCriteria, "objectAtIndex:", itemIndex);
            objj_msgSend(current_criterions, "addObject:", crit);
        }
    }
    while (foundIndex === CPNotFound)
    {
        var buffer = objj_msgSend(CPMutableArray, "arrayWithArray:", current_criterions),
            i;
        for (i = 0; i < childrenCount; i++)
        {
            var child = objj_msgSend(self, "_queryChild:ofItem:withRowType:", i, parentItem, type);
            if (objj_msgSend(current_criterions, "indexOfObject:", child) === CPNotFound)
            {
                foundIndex = i;
                break;
            }
        }
        if (foundIndex === CPNotFound)
        {
            for (var k = 0; k < childrenCount; k++)
            {
                var anobject = objj_msgSend(self, "_queryChild:ofItem:withRowType:", k, parentItem, type),
                    index = objj_msgSend(buffer, "indexOfObject:", anobject);
                if (index !== CPNotFound)
                    objj_msgSend(buffer, "removeObjectAtIndex:", index);
            }
            current_criterions = buffer;
        }
    }
    var foundItem = objj_msgSend(self, "_queryChild:ofItem:withRowType:", foundIndex, parentItem, type),
        foundValue = objj_msgSend(self, "_queryValueForItem:inRow:", foundItem, rowIndex);
    objj_msgSend(items, "addObject:", foundItem);
    objj_msgSend(values, "addObject:", foundValue);
    return YES;
}
,["BOOL","CPArray","CPArray","CPInteger","unsigned int"]), new objj_method(sel_getUid("_getItemsAndValuesToAddForRow:ofType:"), function $CPRuleEditor___getItemsAndValuesToAddForRow_ofType_(self, _cmd, rowIndex, type)
{
    var itemsAndValues = objj_msgSend(CPMutableArray, "array"),
        items = objj_msgSend(CPMutableArray, "array"),
        values = objj_msgSend(CPMutableArray, "array"),
        unusedItems = YES;
    while (unusedItems)
        unusedItems = objj_msgSend(self, "_nextUnusedItems:andValues:forRow:forRowType:", items, values, rowIndex, type);
    var count = objj_msgSend(items, "count");
    for (var i = 0; i < count; i++)
    {
        var item = objj_msgSend(items, "objectAtIndex:", i),
            value = objj_msgSend(values, "objectAtIndex:", i),
            itemAndValue = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", item, "item", value, "value");
        objj_msgSend(itemsAndValues, "addObject:", itemAndValue);
    }
    return itemsAndValues;
}
,["CPMutableArray","CPInteger","CPRuleEditorRowType"]), new objj_method(sel_getUid("_addOptionFromSlice:ofRowType:"), function $CPRuleEditor___addOptionFromSlice_ofRowType_(self, _cmd, slice, type)
{
    var rowIndexEvent = objj_msgSend(slice, "rowIndex"),
        rowTypeEvent = objj_msgSend(self, "rowTypeForRow:", rowIndexEvent),
        insertIndex = rowIndexEvent + 1,
        parentRowIndex = rowTypeEvent === CPRuleEditorRowTypeCompound ? rowIndexEvent : objj_msgSend(self, "parentRowForRow:", rowIndexEvent);
    objj_msgSend(self, "insertRowAtIndex:withType:asSubrowOfRow:animate:", insertIndex, type, parentRowIndex, YES);
}
,["void","id","unsigned int"]), new objj_method(sel_getUid("_insertNewRowAtIndex:ofType:withParentRow:"), function $CPRuleEditor___insertNewRowAtIndex_ofType_withParentRow_(self, _cmd, insertIndex, rowtype, parentRowIndex)
{
    var row = objj_msgSend(objj_msgSend(objj_msgSend(self, "rowClass"), "alloc"), "init"),
        itemsandvalues = objj_msgSend(self, "_getItemsAndValuesToAddForRow:ofType:", insertIndex, rowtype),
        newitems = objj_msgSend(itemsandvalues, "valueForKey:", "item"),
        newvalues = objj_msgSend(itemsandvalues, "valueForKey:", "value");
    objj_msgSend(row, "setValue:forKey:", newitems, self._itemsKeyPath);
    objj_msgSend(row, "setValue:forKey:", newvalues, self._valuesKeyPath);
    objj_msgSend(row, "setValue:forKey:", rowtype, self._typeKeyPath);
    objj_msgSend(row, "setValue:forKey:", objj_msgSend(CPMutableArray, "array"), self._subrowsArrayKeyPath);
    var subrowsObjects;
    if (parentRowIndex === -1 || objj_msgSend(self, "_applicableNestingMode") === CPRuleEditorNestingModeList)
        subrowsObjects = objj_msgSend(self, "_rootRowsArray");
    else
    {
        var parentRowObject = objj_msgSend(objj_msgSend(self, "_rowCacheForIndex:", parentRowIndex), "rowObject");
        subrowsObjects = objj_msgSend(self, "_subrowObjectsOfObject:", parentRowObject);
    }
    var relInsertIndex = insertIndex - parentRowIndex - 1;
    objj_msgSend(subrowsObjects, "insertObject:atIndex:", row, relInsertIndex);
    objj_msgSend(self, "_updatePredicate");
    objj_msgSend(self, "_sendRuleAction");
    objj_msgSend(self, "_postRuleOptionChangedNotification");
    objj_msgSend(self, "_postRowCountChangedNotificationOfType:indexes:", CPRuleEditorRowsDidChangeNotification, objj_msgSend(CPIndexSet, "indexSetWithIndex:", insertIndex));
    return row;
}
,["id","int","CPRuleEditorRowType","CPInteger"]), new objj_method(sel_getUid("_startObservingRowObjectsRecursively:"), function $CPRuleEditor___startObservingRowObjectsRecursively_(self, _cmd, rowObjects)
{
    objj_msgSend(self._boundArrayOwner, "addObserver:forKeyPath:options:context:", self, self._boundArrayKeyPath, CPKeyValueObservingOptionOld | CPKeyValueObservingOptionNew, boundArrayContext);
    var count = objj_msgSend(rowObjects, "count");
    for (var i = 0; i < count; i++)
    {
        var rowObject = objj_msgSend(rowObjects, "objectAtIndex:", i);
        objj_msgSend(rowObject, "addObserver:forKeyPath:options:context:", self, self._itemsKeyPath, CPKeyValueObservingOptionOld | CPKeyValueObservingOptionNew, itemsContext);
        objj_msgSend(rowObject, "addObserver:forKeyPath:options:context:", self, self._valuesKeyPath, CPKeyValueObservingOptionOld | CPKeyValueObservingOptionNew, valuesContext);
        objj_msgSend(rowObject, "addObserver:forKeyPath:options:context:", self, self._subrowsArrayKeyPath, CPKeyValueObservingOptionOld | CPKeyValueObservingOptionNew, subrowsContext);
        var subrows = objj_msgSend(self, "_subrowObjectsOfObject:", rowObject);
        if (objj_msgSend(subrows, "count") > 0)
            objj_msgSend(self, "_startObservingRowObjectsRecursively:", subrows);
    }
}
,["void","CPArray"]), new objj_method(sel_getUid("_stopObservingRowObjectsRecursively:"), function $CPRuleEditor___stopObservingRowObjectsRecursively_(self, _cmd, rowObjects)
{
    objj_msgSend(self._boundArrayOwner, "removeObserver:forKeyPath:", self, self._boundArrayKeyPath);
    var count = objj_msgSend(rowObjects, "count");
    for (var i = 0; i < count; i++)
    {
        var rowObject = objj_msgSend(rowObjects, "objectAtIndex:", i);
        objj_msgSend(rowObject, "removeObserver:forKeyPath:", self, self._itemsKeyPath);
        objj_msgSend(rowObject, "removeObserver:forKeyPath:", self, self._valuesKeyPath);
        objj_msgSend(rowObject, "removeObserver:forKeyPath:", self, self._subrowsArrayKeyPath);
        var subrows = objj_msgSend(rowObject, "valueForKey:", self._subrowsArrayKeyPath);
        if (objj_msgSend(subrows, "count") > 0)
            objj_msgSend(self, "_stopObservingRowObjectsRecursively:", subrows);
    }
}
,["void","CPArray"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $CPRuleEditor__observeValueForKeyPath_ofObject_change_context_(self, _cmd, keypath, object, change, context)
{
    var changeKind = objj_msgSend(change, "objectForKey:", CPKeyValueChangeKindKey),
        changeNewValue = objj_msgSend(change, "objectForKey:", CPKeyValueChangeNewKey),
        changeOldValue = objj_msgSend(change, "objectForKey:", CPKeyValueChangeOldKey),
        newRows,
        oldRows;
    if (context === boundArrayContext || context === subrowsContext)
    {
        if (changeKind === CPKeyValueChangeSetting)
        {
            newRows = changeNewValue;
            oldRows = changeOldValue;
        }
        else if (changeKind === CPKeyValueChangeInsertion)
        {
            newRows = objj_msgSend(self, "_subrowObjectsOfObject:", object);
            oldRows = objj_msgSend(CPArray, "arrayWithArray:", newRows);
            objj_msgSend(oldRows, "removeObjectsInArray:", changeNewValue);
        }
        objj_msgSend(self, "_changedRowArray:withOldRowArray:forParent:", newRows, oldRows, object);
        objj_msgSend(self, "_reconfigureSubviewsAnimate:", objj_msgSend(self, "_wantsRowAnimations"));
    }
}
,["void","CPString","id","CPDictionary","void"]), new objj_method(sel_getUid("_changedItem:toItem:inRow:atCriteriaIndex:"), function $CPRuleEditor___changedItem_toItem_inRow_atCriteriaIndex_(self, _cmd, fromItem, toItem, aRow, fromItemIndex)
{
    var criteria = objj_msgSend(self, "criteriaForRow:", aRow),
        displayValues = objj_msgSend(self, "displayValuesForRow:", aRow),
        rowType = objj_msgSend(self, "rowTypeForRow:", aRow),
        anItem = toItem,
        items = objj_msgSend(criteria, "subarrayWithRange:", CPMakeRange(0, fromItemIndex)),
        values = objj_msgSend(displayValues, "subarrayWithRange:", CPMakeRange(0, fromItemIndex));
    self._lastRow = aRow;
    while (YES)
    {
        objj_msgSend(items, "addObject:", anItem);
        var value = objj_msgSend(self, "_queryValueForItem:inRow:", anItem, aRow);
        objj_msgSend(values, "addObject:", value);
        if (!objj_msgSend(self, "_queryNumberOfChildrenOfItem:withRowType:", anItem, rowType))
            break;
        anItem = objj_msgSend(self, "_queryChild:ofItem:withRowType:", 0, anItem, rowType);
    }
    var object = objj_msgSend(objj_msgSend(self, "_rowCacheForIndex:", aRow), "rowObject");
    objj_msgSend(object, "setValue:forKey:", items, self._itemsKeyPath);
    objj_msgSend(object, "setValue:forKey:", values, self._valuesKeyPath);
    var slice = objj_msgSend(self._slices, "objectAtIndex:", aRow);
    objj_msgSend(slice, "_reconfigureSubviews");
    objj_msgSend(self, "_updatePredicate");
    objj_msgSend(self, "_sendRuleAction");
    objj_msgSend(self, "_postRuleOptionChangedNotification");
}
,["void","id","id","CPInteger","int"]), new objj_method(sel_getUid("_changedRowArray:withOldRowArray:forParent:"), function $CPRuleEditor___changedRowArray_withOldRowArray_forParent_(self, _cmd, newRows, oldRows, parentRowObject)
{
    var newRowCount = objj_msgSend(newRows, "count"),
        oldRowCount = objj_msgSend(oldRows, "count"),
        deltaCount = newRowCount - oldRowCount,
        minusCount = MIN(newRowCount, oldRowCount),
        maxCount = MAX(newRowCount, oldRowCount),
        insertCacheIndexes = objj_msgSend(CPIndexSet, "indexSet"),
        newCaches = objj_msgSend(CPArray, "array"),
        parentCacheIndentation,
        parentCacheIndex = objj_msgSend(self, "_rowIndexForRowObject:", parentRowObject),
        newRowCacheIndex = 0,
        changeStartIndex = 0;
    objj_msgSend(self, "_stopObservingRowObjectsRecursively:", oldRows);
    objj_msgSend(self, "_startObservingRowObjectsRecursively:", newRows);
    if (parentCacheIndex === -1)
        parentCacheIndentation = -1;
    else
        parentCacheIndentation = objj_msgSend(objj_msgSend(self, "_rowCacheForIndex:", parentCacheIndex), "indentation");
    for (; newRowCacheIndex < newRowCount; newRowCacheIndex++)
    {
        var newCacheGlobalIndex = parentCacheIndex + 1 + newRowCacheIndex,
            obj = objj_msgSend(newRows, "objectAtIndex:", newRowCacheIndex),
            newRowType = objj_msgSend(obj, "valueForKey:", self._typeKeyPath),
            cache = objj_msgSend(objj_msgSend(_CPRuleEditorCache, "alloc"), "init");
        objj_msgSend(cache, "setRowObject:", obj);
        objj_msgSend(cache, "setRowIndex:", newCacheGlobalIndex);
        objj_msgSend(cache, "setIndentation:", parentCacheIndentation + 1);
        objj_msgSend(insertCacheIndexes, "addIndex:", newCacheGlobalIndex);
        objj_msgSend(newCaches, "addObject:", cache);
    }
    objj_msgSend(self._rowCache, "removeObjectsInRange:", CPMakeRange(parentCacheIndex + 1, objj_msgSend(oldRows, "count")));
    objj_msgSend(self._rowCache, "insertObjects:atIndexes:", newCaches, insertCacheIndexes);
    for (; changeStartIndex < minusCount; changeStartIndex++)
    {
        var oldrow = objj_msgSend(oldRows, "objectAtIndex:", changeStartIndex),
            newrow = objj_msgSend(newRows, "objectAtIndex:", changeStartIndex);
        if (newrow !== oldrow)
            break;
    }
    var replaceCount = deltaCount === 0 ? maxCount : maxCount - minusCount,
        startIndex = parentCacheIndex + changeStartIndex + 1;
    if (deltaCount <= 0)
    {
        var removeIndexes = objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(startIndex, replaceCount)),
            removeSlices = objj_msgSend(self._slices, "objectsAtIndexes:", removeIndexes);
        objj_msgSend(removeSlices, "makeObjectsPerformSelector:", sel_getUid("removeFromSuperview"));
        objj_msgSend(self._slices, "removeObjectsAtIndexes:", removeIndexes);
    }
    if (deltaCount >= 0)
    {
        var newIndentation = parentCacheIndentation + 1,
            newIndex = startIndex;
        for (; newIndex < startIndex + replaceCount; newIndex++)
        {
            var newslice = objj_msgSend(self, "_newSlice"),
                rowType = objj_msgSend(self, "rowTypeForRow:", newIndex);
            objj_msgSend(newslice, "setRowIndex:", newIndex);
            objj_msgSend(newslice, "setIndentation:", newIndentation);
            objj_msgSend(newslice, "_setRowType:", rowType);
            objj_msgSend(newslice, "_configurePlusButtonByRowType:", CPRuleEditorRowTypeSimple);
            objj_msgSend(self._slices, "insertObject:atIndex:", newslice, newIndex);
        }
    }
    var emptyArray = objj_msgSend(CPArray, "array"),
        count = objj_msgSend(oldRows, "count"),
        n;
    for (n = 0; n < count; n++)
    {
        var oldRow = objj_msgSend(oldRows, "objectAtIndex:", n),
            subOldRows = objj_msgSend(self, "_subrowObjectsOfObject:", oldRow);
        if (objj_msgSend(subOldRows, "count") > 0)
            objj_msgSend(self, "_changedRowArray:withOldRowArray:forParent:", emptyArray, subOldRows, oldRow);
    }
    count = objj_msgSend(newRows, "count");
    for (n = 0; n < count; n++)
    {
        var newRow = objj_msgSend(newRows, "objectAtIndex:", n),
            subnewRows = objj_msgSend(self, "_subrowObjectsOfObject:", newRow);
        if (objj_msgSend(subnewRows, "count") > 0)
            objj_msgSend(self, "_changedRowArray:withOldRowArray:forParent:", subnewRows, emptyArray, newRow);
    }
}
,["void","CPArray","CPArray","id"]), new objj_method(sel_getUid("bind:toObject:withKeyPath:options:"), function $CPRuleEditor__bind_toObject_withKeyPath_options_(self, _cmd, aBinding, observableController, aKeyPath, options)
{
    if (objj_msgSend(aBinding, "isEqualToString:", "rows"))
    {
        objj_msgSend(self, "unbind:", aBinding);
        objj_msgSend(self, "_setBoundDataSource:withKeyPath:options:", observableController, aKeyPath, options);
        objj_msgSend(self._rowCache, "removeAllObjects");
        objj_msgSend(self._slices, "removeAllObjects");
        var newRows = objj_msgSend(CPArray, "array"),
            oldRows = objj_msgSend(self, "_rootRowsArray");
        objj_msgSend(self, "_changedRowArray:withOldRowArray:forParent:", newRows, oldRows, self._boundArrayOwner);
    }
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRuleEditor").super_class }, "bind:toObject:withKeyPath:options:", aBinding, observableController, aKeyPath, options);
}
,["void","CPString","id","CPString","CPDictionary"]), new objj_method(sel_getUid("unbind:"), function $CPRuleEditor__unbind_(self, _cmd, object)
{
    self._rowClass = objj_msgSend(_CPRuleEditorRowObject, "class");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRuleEditor").super_class }, "unbind:", object);
}
,["void","CPString"]), new objj_method(sel_getUid("_setBoundDataSource:withKeyPath:options:"), function $CPRuleEditor___setBoundDataSource_withKeyPath_options_(self, _cmd, datasource, keyPath, options)
{
    if (objj_msgSend(datasource, "respondsToSelector:", sel_getUid("objectClass")))
        self._rowClass = objj_msgSend(datasource, "objectClass");
    self._boundArrayKeyPath = keyPath;
    self._boundArrayOwner = datasource;
    objj_msgSend(self._boundArrayOwner, "addObserver:forKeyPath:options:context:", self, self._boundArrayKeyPath, CPKeyValueObservingOptionOld | CPKeyValueObservingOptionNew, boundArrayContext);
}
,["void","id","CPString","CPDictionary"]), new objj_method(sel_getUid("_setPredicate:"), function $CPRuleEditor___setPredicate_(self, _cmd, predicate)
{
    if (self._predicate !== predicate)
        self._predicate = predicate;
}
,["void","CPPredicate"]), new objj_method(sel_getUid("_updatePredicate"), function $CPRuleEditor___updatePredicate(self, _cmd)
{
    if (self._delegateWantsValidation)
    {
        var selector = sel_getUid("ruleEditor:predicatePartsForCriterion:withDisplayValue:inRow:");
        if (!objj_msgSend(self._ruleDelegate, "respondsToSelector:", selector))
            return;
        self._delegateWantsValidation = NO;
    }
    var subpredicates = objj_msgSend(CPMutableArray, "array"),
        subindexes = objj_msgSend(self, "subrowIndexesForRow:", -1),
        current_index = objj_msgSend(subindexes, "firstIndex");
    while (current_index !== CPNotFound)
    {
        var subpredicate = objj_msgSend(self, "predicateForRow:", current_index);
        if (subpredicate !== nil)
            objj_msgSend(subpredicates, "addObject:", subpredicate);
        current_index = objj_msgSend(subindexes, "indexGreaterThanIndex:", current_index);
    }
    var new_predicate = objj_msgSend(objj_msgSend(CPCompoundPredicate, "alloc"), "initWithType:subpredicates:", CPOrPredicateType, subpredicates);
    objj_msgSend(self, "_setPredicate:", new_predicate);
}
,["void"]), new objj_method(sel_getUid("_newSlice"), function $CPRuleEditor___newSlice(self, _cmd)
{
    var sliceRect = CGRectMake(0, 0, CGRectGetWidth(objj_msgSend(self, "frame")), 0),
        slice = objj_msgSend(self, "_createNewSliceWithFrame:ruleEditorView:", sliceRect, self);
    return slice;
}
,["_CPRuleEditorViewSliceRow"]), new objj_method(sel_getUid("_createNewSliceWithFrame:ruleEditorView:"), function $CPRuleEditor___createNewSliceWithFrame_ruleEditorView_(self, _cmd, frame, editor)
{
    return objj_msgSend(objj_msgSend(_CPRuleEditorViewSliceRow, "alloc"), "initWithFrame:ruleEditorView:", frame, editor);
}
,["_CPRuleEditorViewSliceRow","CGRect","CPRuleEditor"]), new objj_method(sel_getUid("_reconfigureSubviewsAnimate:"), function $CPRuleEditor___reconfigureSubviewsAnimate_(self, _cmd, animate)
{
    var viewAnimations = objj_msgSend(CPMutableArray, "array"),
        added_slices = objj_msgSend(CPMutableArray, "array"),
        count = objj_msgSend(self._slices, "count");
    objj_msgSend(self, "_updateSliceRows");
    if (objj_msgSend(objj_msgSend(self, "superview"), "isKindOfClass:", objj_msgSend(CPClipView, "class")))
        objj_msgSend(self, "setFrameSize:", CGSizeMake(CGRectGetWidth(objj_msgSend(self, "frame")), count * self._sliceHeight));
    for (var i = 0; i < count; i++)
    {
        var aslice = objj_msgSend(self._slices, "objectAtIndex:", i),
            targetRect = objj_msgSend(aslice, "_animationTargetRect"),
            startRect = objj_msgSend(aslice, "frame"),
            startIndex = objj_msgSend(aslice, "rowIndex") - 1;
        if (objj_msgSend(aslice, "superview") === nil)
        {
            startRect = CGRectMake(0, startIndex * self._sliceHeight, CGRectGetWidth(startRect), self._sliceHeight);
            objj_msgSend(aslice, "_reconfigureSubviews");
            objj_msgSend(added_slices, "addObject:", aslice);
        }
        if (animate)
        {
            var animation = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
            objj_msgSend(animation, "setObject:forKey:", aslice, CPViewAnimationTargetKey);
            objj_msgSend(animation, "setObject:forKey:", startRect, CPViewAnimationStartFrameKey);
            objj_msgSend(animation, "setObject:forKey:", targetRect, CPViewAnimationEndFrameKey);
            objj_msgSend(viewAnimations, "insertObject:atIndex:", animation, 0);
        }
        else
            objj_msgSend(aslice, "setFrame:", targetRect);
    }
    var addcount = objj_msgSend(added_slices, "count");
    for (var i = 0; i < addcount; i++)
        objj_msgSend(self._slicesHolder, "addSubview:positioned:relativeTo:", added_slices[i], CPWindowBelow, nil);
    if (animate)
    {
        objj_msgSend(self._currentAnimation, "setViewAnimations:", viewAnimations);
        objj_msgSend(self._currentAnimation, "startAnimation");
    }
    self._lastRow = objj_msgSend(self, "numberOfRows") - 1;
    if (self._lastRow === -1)
        self._nestingModeDidChange = NO;
    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self._slices, "makeObjectsPerformSelector:", sel_getUid("_updateButtonVisibilities"));
}
,["void","BOOL"]), new objj_method(sel_getUid("animationDidEnd:"), function $CPRuleEditor__animationDidEnd_(self, _cmd, animation)
{
}
,["void","CPViewAnimation"]), new objj_method(sel_getUid("_updateSliceRows"), function $CPRuleEditor___updateSliceRows(self, _cmd)
{
    var width = objj_msgSend(self, "frame").size.width,
        count = objj_msgSend(self._slices, "count");
    for (var i = 0; i < count; i++)
    {
        var slice = objj_msgSend(self._slices, "objectAtIndex:", i),
            targetRect = CGRectMake(0, i * self._sliceHeight, width, self._sliceHeight);
        objj_msgSend(slice, "setRowIndex:", i);
        objj_msgSend(slice, "_setAnimationTargetRect:", targetRect);
    }
}
,["void"]), new objj_method(sel_getUid("_backgroundColors"), function $CPRuleEditor___backgroundColors(self, _cmd)
{
    return objj_msgSend(self, "valueForThemeAttribute:", "alternating-row-colors");
}
,["CPArray"]), new objj_method(sel_getUid("_selectedRowColor"), function $CPRuleEditor___selectedRowColor(self, _cmd)
{
    return objj_msgSend(self, "valueForThemeAttribute:", "selected-color");
}
,["CPColor"]), new objj_method(sel_getUid("_sliceTopBorderColor"), function $CPRuleEditor___sliceTopBorderColor(self, _cmd)
{
    return objj_msgSend(self, "valueForThemeAttribute:", "slice-top-border-color");
}
,["CPColor"]), new objj_method(sel_getUid("_sliceBottomBorderColor"), function $CPRuleEditor___sliceBottomBorderColor(self, _cmd)
{
    return objj_msgSend(self, "valueForThemeAttribute:", "slice-bottom-border-color");
}
,["CPColor"]), new objj_method(sel_getUid("_sliceLastBottomBorderColor"), function $CPRuleEditor___sliceLastBottomBorderColor(self, _cmd)
{
    return objj_msgSend(self, "valueForThemeAttribute:", "slice-last-bottom-border-color");
}
,["CPColor"]), new objj_method(sel_getUid("font"), function $CPRuleEditor__font(self, _cmd)
{
    return objj_msgSend(self, "valueForThemeAttribute:", "font");
}
,["CPFont"]), new objj_method(sel_getUid("_addImage"), function $CPRuleEditor___addImage(self, _cmd)
{
    return objj_msgSend(self, "valueForThemeAttribute:", "add-image");
}
,["CPImage"]), new objj_method(sel_getUid("_removeImage"), function $CPRuleEditor___removeImage(self, _cmd)
{
    return objj_msgSend(self, "valueForThemeAttribute:", "remove-image");
}
,["CPImage"]), new objj_method(sel_getUid("_toolTipForAddCompoundRowButton"), function $CPRuleEditor___toolTipForAddCompoundRowButton(self, _cmd)
{
    return objj_msgSend(self._standardLocalizer, "localizedStringForString:", "Add compound row");
}
,["CPString"]), new objj_method(sel_getUid("_toolTipForAddSimpleRowButton"), function $CPRuleEditor___toolTipForAddSimpleRowButton(self, _cmd)
{
    return objj_msgSend(self._standardLocalizer, "localizedStringForString:", "Add row");
}
,["CPString"]), new objj_method(sel_getUid("_toolTipForDeleteRowButton"), function $CPRuleEditor___toolTipForDeleteRowButton(self, _cmd)
{
    return objj_msgSend(self._standardLocalizer, "localizedStringForString:", "Delete row");
}
,["CPString"]), new objj_method(sel_getUid("_updateSliceIndentations"), function $CPRuleEditor___updateSliceIndentations(self, _cmd)
{
    objj_msgSend(self, "_updateSliceIndentationAtIndex:toIndentation:withIndexSet:", 0, 0, objj_msgSend(self, "subrowIndexesForRow:", 0));
}
,["void"]), new objj_method(sel_getUid("_updateSliceIndentationAtIndex:toIndentation:withIndexSet:"), function $CPRuleEditor___updateSliceIndentationAtIndex_toIndentation_withIndexSet_(self, _cmd, index, indentation, indexes)
{
    var current_index = objj_msgSend(indexes, "firstIndex");
    while (current_index !== CPNotFound)
    {
        var subindexes = objj_msgSend(self, "subrowIndexesForRow:", index);
        objj_msgSend(self, "_updateSliceIndentationAtIndex:toIndentation:withIndexSet:", current_index, indentation + 1, subindexes);
        current_index = objj_msgSend(indexes, "indexGreaterThanIndex:", current_index);
    }
    objj_msgSend(objj_msgSend(self._slices, "objectAtIndex:", index), "setIndentation:", indentation);
}
,["void","int","int","id"]), new objj_method(sel_getUid("_selectedSlices"), function $CPRuleEditor___selectedSlices(self, _cmd)
{
    var _selectedSlices = objj_msgSend(CPMutableArray, "array"),
        count = objj_msgSend(self._slices, "count"),
        i;
    for (i = 0; i < count; i++)
    {
        var slice = self._slices[i];
        if (objj_msgSend(slice, "_isSelected"))
            objj_msgSend(_selectedSlices, "addObject:", slice);
    }
    return _selectedSlices;
}
,["CPArray"]), new objj_method(sel_getUid("_lastSelectedSliceIndex"), function $CPRuleEditor___lastSelectedSliceIndex(self, _cmd)
{
    var lastIndex = -1,
        count = objj_msgSend(self._slices, "count"),
        i;
    for (i = 0; i < count; i++)
    {
        var slice = self._slices[i];
        if (objj_msgSend(slice, "_isLastSelected"))
            return objj_msgSend(slice, "rowIndex");
    }
    return CPNotFound;
}
,["int"]), new objj_method(sel_getUid("_mouseUpOnSlice:withEvent:"), function $CPRuleEditor___mouseUpOnSlice_withEvent_(self, _cmd, slice, event)
{
    if (objj_msgSend(slice, "_rowType") !== CPRuleEditorRowTypeSimple)
        return;
    var modifierFlags = objj_msgSend(event, "modifierFlags"),
        extend = modifierFlags & CPCommandKeyMask || modifierFlags & CPShiftKeyMask,
        rowIndexes = objj_msgSend(CPIndexSet, "indexSetWithIndex:", objj_msgSend(slice, "rowIndex"));
    objj_msgSend(self, "selectRowIndexes:byExtendingSelection:", rowIndexes, extend);
}
,["void","id","CPEvent"]), new objj_method(sel_getUid("_mouseDownOnSlice:withEvent:"), function $CPRuleEditor___mouseDownOnSlice_withEvent_(self, _cmd, slice, event)
{
}
,["void","id","CPEvent"]), new objj_method(sel_getUid("_rightMouseDownOnSlice:withEvent:"), function $CPRuleEditor___rightMouseDownOnSlice_withEvent_(self, _cmd, slice, event)
{
}
,["void","_CPRuleEditorViewSlice","CPEvent"]), new objj_method(sel_getUid("_performClickOnSlice:withEvent:"), function $CPRuleEditor___performClickOnSlice_withEvent_(self, _cmd, slice, event)
{
}
,["void","id","CPEvent"]), new objj_method(sel_getUid("_setSuppressKeyDownHandling:"), function $CPRuleEditor___setSuppressKeyDownHandling_(self, _cmd, flag)
{
    self._suppressKeyDownHandling = flag;
}
,["void","BOOL"]), new objj_method(sel_getUid("selectAll:"), function $CPRuleEditor__selectAll_(self, _cmd, sender)
{
    var count = objj_msgSend(self._slices, "count");
    while (count--)
    {
        var slice = self._slices[count];
        objj_msgSend(slice, "_setSelected:", YES);
        objj_msgSend(slice, "setNeedsDisplay:", YES);
    }
}
,["void","id"]), new objj_method(sel_getUid("_deselectAll"), function $CPRuleEditor___deselectAll(self, _cmd)
{
    var count = objj_msgSend(self._slices, "count");
    while (count--)
    {
        var slice = self._slices[count];
        objj_msgSend(slice, "_setSelected:", NO);
        objj_msgSend(slice, "_setLastSelected:", NO);
        objj_msgSend(slice, "setNeedsDisplay:", YES);
    }
}
,["void"]), new objj_method(sel_getUid("_queryNumberOfChildrenOfItem:withRowType:"), function $CPRuleEditor___queryNumberOfChildrenOfItem_withRowType_(self, _cmd, item, type)
{
    return objj_msgSend(self._ruleDelegate, "ruleEditor:numberOfChildrenForCriterion:withRowType:", self, item, type);
}
,["int","id","CPRuleEditorRowType"]), new objj_method(sel_getUid("_queryChild:ofItem:withRowType:"), function $CPRuleEditor___queryChild_ofItem_withRowType_(self, _cmd, childIndex, item, type)
{
    return objj_msgSend(self._ruleDelegate, "ruleEditor:child:forCriterion:withRowType:", self, childIndex, item, type);
}
,["id","int","id","CPRuleEditorRowType"]), new objj_method(sel_getUid("_queryValueForItem:inRow:"), function $CPRuleEditor___queryValueForItem_inRow_(self, _cmd, item, row)
{
    return objj_msgSend(self._ruleDelegate, "ruleEditor:displayValueForCriterion:inRow:", self, item, row);
}
,["id","id","CPInteger"]), new objj_method(sel_getUid("_lastRow"), function $CPRuleEditor___lastRow(self, _cmd)
{
    return self._lastRow;
}
,["int"]), new objj_method(sel_getUid("_countOfRowsStartingAtObject:"), function $CPRuleEditor___countOfRowsStartingAtObject_(self, _cmd, object)
{
    var index = objj_msgSend(self, "_rowIndexForRowObject:", object);
    return objj_msgSend(self, "numberOfRows") - index;
}
,["int","id"]), new objj_method(sel_getUid("_setAlignmentGridWidth:"), function $CPRuleEditor___setAlignmentGridWidth_(self, _cmd, width)
{
    self._alignmentGridWidth = width;
}
,["void","float"]), new objj_method(sel_getUid("_validateItem:value:inRow:"), function $CPRuleEditor___validateItem_value_inRow_(self, _cmd, item, value, row)
{
    return objj_msgSend(self, "_queryCanSelectItem:displayValue:inRow:", item, value, row);
}
,["BOOL","id","id","CPInteger"]), new objj_method(sel_getUid("_queryCanSelectItem:displayValue:inRow:"), function $CPRuleEditor___queryCanSelectItem_displayValue_inRow_(self, _cmd, item, value, row)
{
    return YES;
}
,["BOOL","id","id","CPInteger"]), new objj_method(sel_getUid("_windowChangedKeyState"), function $CPRuleEditor___windowChangedKeyState(self, _cmd)
{
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void"]), new objj_method(sel_getUid("setNeedsDisplay:"), function $CPRuleEditor__setNeedsDisplay_(self, _cmd, flag)
{
    objj_msgSend(self._slices, "makeObjectsPerformSelector:withObject:", sel_getUid("setNeedsDisplay:"), flag);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRuleEditor").super_class }, "setNeedsDisplay:", flag);
}
,["void","BOOL"]), new objj_method(sel_getUid("setFrameSize:"), function $CPRuleEditor__setFrameSize_(self, _cmd, size)
{
    objj_msgSend(self, "setNeedsDisplay:", YES);
    if (CGRectGetWidth(objj_msgSend(self, "frame")) !== size.width)
        objj_msgSend(self._slices, "makeObjectsPerformSelector:", sel_getUid("setNeedsLayout"));
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRuleEditor").super_class }, "setFrameSize:", size);
}
,["void","CGSize"]), new objj_method(sel_getUid("_selectedSliceIndices"), function $CPRuleEditor___selectedSliceIndices(self, _cmd)
{
    var selectedIndices = objj_msgSend(CPMutableIndexSet, "indexSet"),
        count = objj_msgSend(self._slices, "count"),
        i;
    for (i = 0; i < count; i++)
    {
        var slice = self._slices[i];
        if (objj_msgSend(slice, "_isSelected"))
            objj_msgSend(selectedIndices, "addIndex:", objj_msgSend(slice, "rowIndex"));
    }
    return selectedIndices;
}
,["CPIndexSet"]), new objj_method(sel_getUid("mouseDragged:"), function $CPRuleEditor__mouseDragged_(self, _cmd, event)
{
    if (!self._editable)
        return;
    var point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(event, "locationInWindow"), nil),
        view = objj_msgSend(self._slices, "objectAtIndex:", FLOOR(point.y / self._sliceHeight));
    if (objj_msgSend(self, "_dragShouldBeginFromMouseDown:", view))
        objj_msgSend(self, "_performDragForSlice:withEvent:", view, event);
}
,["void","CPEvent"]), new objj_method(sel_getUid("_dragShouldBeginFromMouseDown:"), function $CPRuleEditor___dragShouldBeginFromMouseDown_(self, _cmd, view)
{
    return (objj_msgSend(self, "nestingMode") === CPRuleEditorNestingModeList || objj_msgSend(view, "rowIndex") !== 0) && self._editable && objj_msgSend(view, "isKindOfClass:", objj_msgSend(_CPRuleEditorViewSliceRow, "class")) && self._draggingRows === nil;
}
,["BOOL","CPView"]), new objj_method(sel_getUid("_performDragForSlice:withEvent:"), function $CPRuleEditor___performDragForSlice_withEvent_(self, _cmd, slice, event)
{
    var dragPoint,
        mainRowIndex = objj_msgSend(slice, "rowIndex"),
        draggingRows = objj_msgSend(CPIndexSet, "indexSetWithIndex:", mainRowIndex),
        selected_indices = objj_msgSend(self, "_selectedSliceIndices"),
        pasteboard = objj_msgSend(CPPasteboard, "pasteboardWithName:", CPDragPboard);
    objj_msgSend(pasteboard, "declareTypes:owner:", objj_msgSend(CPArray, "arrayWithObjects:", CPRuleEditorItemPBoardType, nil), self);
    if (objj_msgSend(selected_indices, "containsIndex:", mainRowIndex))
        objj_msgSend(draggingRows, "addIndexes:", selected_indices);
    self._draggingRows = objj_msgSend(self, "_includeSubslicesForSlicesAtIndexes:", draggingRows);
    var firstIndex = objj_msgSend(self._draggingRows, "firstIndex"),
        firstSlice = objj_msgSend(self._slices, "objectAtIndex:", firstIndex),
        dragview = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", objj_msgSend(firstSlice, "frame"));
    objj_msgSend(dragview, "setBackgroundColor:", objj_msgSend(firstSlice, "backgroundColor"));
    objj_msgSend(dragview, "setAlphaValue:", 0.7);
    dragPoint = CGPointMake(0, firstIndex * self._sliceHeight);
    objj_msgSend(self, "dragView:at:offset:event:pasteboard:source:slideBack:", dragview, dragPoint, CGSizeMake(0, self._sliceHeight), event, pasteboard, self, YES);
    return YES;
}
,["BOOL","id","CPEvent"]), new objj_method(sel_getUid("draggingEntered:"), function $CPRuleEditor__draggingEntered_(self, _cmd, sender)
{
    if (objj_msgSend(sender, "draggingSource") === self)
    {
        objj_msgSend(self, "_clearDropLine");
        return CPDragOperationMove;
    }
    return CPDragOperationNone;
}
,["CPDragOperation","id"]), new objj_method(sel_getUid("draggingExited:"), function $CPRuleEditor__draggingExited_(self, _cmd, sender)
{
    objj_msgSend(self, "_clearDropLine");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","id"]), new objj_method(sel_getUid("_clearDropLine"), function $CPRuleEditor___clearDropLine(self, _cmd)
{
    objj_msgSend(self._dropLineView, "setAlphaValue:", 0);
    if (self._subviewIndexOfDropLine !== CPNotFound && self._subviewIndexOfDropLine < self._lastRow)
    {
        var previousBelowSlice = objj_msgSend(self._slices, "objectAtIndex:", self._subviewIndexOfDropLine);
        objj_msgSend(previousBelowSlice, "setFrameOrigin:", CGPointMake(0, objj_msgSend(previousBelowSlice, "rowIndex") * self._sliceHeight));
    }
    self._subviewIndexOfDropLine = CPNotFound;
}
,["void"]), new objj_method(sel_getUid("draggingUpdated:"), function $CPRuleEditor__draggingUpdated_(self, _cmd, sender)
{
    var point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(sender, "draggingLocation"), nil),
        y = point.y + self._sliceHeight / 2,
        indexOfDropLine = FLOOR(y / self._sliceHeight),
        numberOfRows = objj_msgSend(self, "numberOfRows");
    if (indexOfDropLine < 0 || indexOfDropLine > numberOfRows || indexOfDropLine >= objj_msgSend(self._draggingRows, "firstIndex") && indexOfDropLine <= objj_msgSend(self._draggingRows, "lastIndex") + 1)
    {
        if (self._subviewIndexOfDropLine !== CPNotFound && indexOfDropLine !== self._subviewIndexOfDropLine)
            objj_msgSend(self, "_clearDropLine");
        return CPDragOperationNone;
    }
    if (self._subviewIndexOfDropLine !== indexOfDropLine)
    {
        if (self._subviewIndexOfDropLine !== CPNotFound && self._subviewIndexOfDropLine < numberOfRows)
        {
            var previousBelowSlice = objj_msgSend(self._slices, "objectAtIndex:", self._subviewIndexOfDropLine);
            objj_msgSend(previousBelowSlice, "setFrameOrigin:", CGPointMake(0, objj_msgSend(previousBelowSlice, "rowIndex") * self._sliceHeight));
        }
        if (indexOfDropLine <= self._lastRow && indexOfDropLine < numberOfRows)
        {
            var belowSlice = objj_msgSend(self._slices, "objectAtIndex:", indexOfDropLine);
            objj_msgSend(belowSlice, "setFrameOrigin:", CGPointMake(0, objj_msgSend(belowSlice, "rowIndex") * self._sliceHeight + 2));
        }
        objj_msgSend(self._dropLineView, "setAlphaValue:", 1);
        objj_msgSend(self._dropLineView, "setFrameOrigin:", CGPointMake(CGRectGetMinX(objj_msgSend(self._dropLineView, "frame")), indexOfDropLine * self._sliceHeight));
        self._subviewIndexOfDropLine = indexOfDropLine;
    }
    return CPDragOperationMove;
}
,["CPDragOperation","id"]), new objj_method(sel_getUid("prepareForDragOperation:"), function $CPRuleEditor__prepareForDragOperation_(self, _cmd, sender)
{
    return self._subviewIndexOfDropLine !== CPNotFound;
}
,["BOOL","id"]), new objj_method(sel_getUid("performDragOperation:"), function $CPRuleEditor__performDragOperation_(self, _cmd, info)
{
    var aboveInsertIndexCount = 0,
        object,
        removeIndex;
    var rowObjects = objj_msgSend(self._rowCache, "valueForKey:", "rowObject"),
        index = objj_msgSend(self._draggingRows, "lastIndex");
    var parentRowIndex = objj_msgSend(self, "parentRowForRow:", index),
        parentRowObject = parentRowIndex === -1 ? self._boundArrayOwner : objj_msgSend(objj_msgSend(self, "_rowCacheForIndex:", parentRowIndex), "rowObject"),
        insertIndex = self._subviewIndexOfDropLine;
    while (index !== CPNotFound)
    {
        if (index >= insertIndex)
        {
            removeIndex = index + aboveInsertIndexCount;
            aboveInsertIndexCount += 1;
        }
        else
        {
            removeIndex = index;
            insertIndex -= 1;
        }
        object = objj_msgSend(rowObjects, "objectAtIndex:", removeIndex);
        objj_msgSend(self, "removeRowAtIndex:", removeIndex);
        objj_msgSend(objj_msgSend(self, "_subrowObjectsOfObject:", parentRowObject), "insertObject:atIndex:", object, insertIndex - parentRowIndex - 1);
        index = objj_msgSend(self._draggingRows, "indexLessThanIndex:", index);
    }
    objj_msgSend(self, "_clearDropLine");
    self._draggingRows = nil;
    return YES;
}
,["BOOL","id"]), new objj_method(sel_getUid("_draggingTypes"), function $CPRuleEditor___draggingTypes(self, _cmd)
{
    return objj_msgSend(CPIndexSet, "indexSetWithIndex:", CPDragOperationMove);
}
,["CPIndexSet"]), new objj_method(sel_getUid("draggedView:endedAt:operation:"), function $CPRuleEditor__draggedView_endedAt_operation_(self, _cmd, dragView, aPoint, operation)
{
    self._draggingRows = nil;
    objj_msgSend(self, "_updatePredicate");
    objj_msgSend(self, "_sendRuleAction");
    objj_msgSend(self, "_postRuleOptionChangedNotification");
    objj_msgSend(self, "_postRowCountChangedNotificationOfType:indexes:", CPRuleEditorRowsDidChangeNotification, nil);
}
,["void","CPView","CGPoint","CPDragOperation"]), new objj_method(sel_getUid("wantsPeriodicDraggingUpdates"), function $CPRuleEditor__wantsPeriodicDraggingUpdates(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("pasteboard:provideDataForType:"), function $CPRuleEditor__pasteboard_provideDataForType_(self, _cmd, pasteboard, type)
{
}
,["void","CPPasteboard","int"]), new objj_method(sel_getUid("_setWindow:"), function $CPRuleEditor___setWindow_(self, _cmd, window)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRuleEditor").super_class }, "_setWindow:", window);
}
,["void","CPWindow"]), new objj_method(sel_getUid("_windowUpdate:"), function $CPRuleEditor___windowUpdate_(self, _cmd, sender)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRuleEditor").super_class }, "_windowUpdate:", sender);
}
,["void","id"]), new objj_method(sel_getUid("_postRuleOptionChangedNotification"), function $CPRuleEditor___postRuleOptionChangedNotification(self, _cmd)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPRuleEditorRulesDidChangeNotification, self);
}
,["void"]), new objj_method(sel_getUid("_postRowCountChangedNotificationOfType:indexes:"), function $CPRuleEditor___postRowCountChangedNotificationOfType_indexes_(self, _cmd, notificationName, indexes)
{
    var userInfo = indexes === nil ? objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init") : objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", indexes, "indexes");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", notificationName, self, userInfo);
}
,["void","CPString","id"]), new objj_method(sel_getUid("_globalIndexesForSubrowIndexes:ofParentObject:"), function $CPRuleEditor___globalIndexesForSubrowIndexes_ofParentObject_(self, _cmd, indexes, parentRowObject)
{
    var _subrows = objj_msgSend(self, "_subrowObjectsOfObject:", parentRowObject),
        parentRowIndex = objj_msgSend(self, "_rowIndexForRowObject:", parentRowObject),
        globalIndexes = objj_msgSend(CPMutableIndexSet, "indexSet"),
        current_index = objj_msgSend(indexes, "firstIndex"),
        numberOfChildrenOfPreviousBrother = 0;
    while (current_index !== CPNotFound)
    {
        var globalChildIndex = current_index + parentRowIndex + 1 + numberOfChildrenOfPreviousBrother;
        objj_msgSend(globalIndexes, "addIndex:", globalChildIndex);
        if (objj_msgSend(self, "rowTypeForRow:", globalChildIndex) === CPRuleEditorRowTypeCompound)
        {
            var rowObject = objj_msgSend(objj_msgSend(self, "_rowCacheForIndex:", current_index), "rowObject"),
                subrows = objj_msgSend(self, "_subrowObjectsOfObject:", rowObject),
                subIndexes = objj_msgSend(self, "_globalIndexesForSubrowIndexes:ofParentObject:", objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(0, objj_msgSend(subrows, "count"))), rowObject);
            numberOfChildrenOfPreviousBrother = objj_msgSend(subIndexes, "count");
        }
        current_index = objj_msgSend(indexes, "indexGreaterThanIndex:", current_index);
    }
    return globalIndexes;
}
,["CPIndexSet","CPIndexSet","id"]), new objj_method(sel_getUid("_sendRuleAction"), function $CPRuleEditor___sendRuleAction(self, _cmd)
{
    var action = objj_msgSend(self, "action"),
        target = objj_msgSend(self, "target");
    objj_msgSend(self, "sendAction:to:", action, target);
}
,["void"]), new objj_method(sel_getUid("_sendsActionOnIncompleteTextChange"), function $CPRuleEditor___sendsActionOnIncompleteTextChange(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("_getAllAvailableItems:values:asChildrenOfItem:inRow:"), function $CPRuleEditor___getAllAvailableItems_values_asChildrenOfItem_inRow_(self, _cmd, items, values, parentItem, aRow)
{
    var type,
        indexofCriterion,
        numOfChildren;
    var availItems = objj_msgSend(CPMutableArray, "array"),
        availValues = objj_msgSend(CPMutableArray, "array");
    var criterion = nil,
        value = nil;
    self._lastRow = aRow;
    type = objj_msgSend(self, "rowTypeForRow:", aRow);
    numOfChildren = objj_msgSend(self, "_queryNumberOfChildrenOfItem:withRowType:", parentItem, type);
    var criteria = objj_msgSend(self, "criteriaForRow:", aRow);
    indexofCriterion = objj_msgSend(criteria, "indexOfObject:", criterion);
    if (parentItem !== nil && indexofCriterion !== CPNotFound && indexofCriterion < objj_msgSend(criteria, "count") - 1)
    {
        var next = indexofCriterion + 1;
        criterion = objj_msgSend(criteria, "objectAtIndex:", next);
        var values = objj_msgSend(self, "displayValuesForRow:", aRow);
        value = objj_msgSend(values, "objectAtIndex:", next);
    }
    for (var i = 0; i < numOfChildren; ++i)
    {
        var aChild = objj_msgSend(self, "_queryChild:ofItem:withRowType:", i, parentItem, type),
            availChild = aChild,
            availValue = value;
        if (criterion !== aChild)
            availValue = objj_msgSend(self, "_queryValueForItem:inRow:", aChild, aRow);
        if (!availValue)
            availValue = objj_msgSend(self, "_queryValueForItem:inRow:", availChild, aRow);
        objj_msgSend(availItems, "addObject:", availChild);
        objj_msgSend(availValues, "addObject:", availValue);
    }
    objj_msgSend(items, "addObjectsFromArray:", availItems);
    objj_msgSend(values, "addObjectsFromArray:", availValues);
}
,["void","id","id","id","CPInteger"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPRuleEditor__defaultThemeClass(self, _cmd)
{
    return "rule-editor";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPRuleEditor__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(CPNull, "null"), "alternating-row-colors", objj_msgSend(CPNull, "null"), "selected-color", objj_msgSend(CPNull, "null"), "slice-top-border-color", objj_msgSend(CPNull, "null"), "slice-bottom-border-color", objj_msgSend(CPNull, "null"), "slice-last-bottom-border-color", objj_msgSend(CPNull, "null"), "font", objj_msgSend(CPNull, "null"), "add-image", objj_msgSend(CPNull, "null"), "remove-image");
}
,["CPDictionary"])]);
}var CPRuleEditorAlignmentGridWidthKey = "CPRuleEditorAlignmentGridWidth",
    CPRuleEditorSliceHeightKey = "CPRuleEditorSliceHeight",
    CPRuleEditorStringsFilenameKey = "CPRuleEditorStringsFilename",
    CPRuleEditorEditableKey = "CPRuleEditorEditable",
    CPRuleEditorAllowsEmptyCompoundRowsKey = "CPRuleEditorAllowsEmptyCompoundRows",
    CPRuleEditorDisallowEmptyKey = "CPRuleEditorDisallowEmpty",
    CPRuleEditorNestingModeKey = "CPRuleEditorNestingMode",
    CPRuleEditorRowTypeKeyPathKey = "CPRuleEditorRowTypeKeyPath",
    CPRuleEditorItemsKeyPathKey = "CPRuleEditorItemsKeyPath",
    CPRuleEditorValuesKeyPathKey = "CPRuleEditorValuesKeyPath",
    CPRuleEditorSubrowsArrayKeyPathKey = "CPRuleEditorSubrowsArrayKeyPath",
    CPRuleEditorBoundArrayKeyPathKey = "CPRuleEditorBoundArrayKeyPath",
    CPRuleEditorRowClassKey = "CPRuleEditorRowClass",
    CPRuleEditorSlicesHolderKey = "CPRuleEditorSlicesHolder",
    CPRuleEditorSlicesKey = "CPRuleEditorSlices",
    CPRuleEditorDelegateKey = "CPRuleEditorDelegate",
    CPRuleEditorBoundArrayOwnerKey = "CPRuleEditorBoundArrayOwner";
{
var the_class = objj_getClass("CPRuleEditor")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPRuleEditor\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPRuleEditor__initWithCoder_(self, _cmd, coder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRuleEditor").super_class }, "initWithCoder:", coder);
    if (self !== nil)
    {
        objj_msgSend(self, "setFormattingStringsFilename:", objj_msgSend(coder, "decodeObjectForKey:", CPRuleEditorStringsFilenameKey));
        self._alignmentGridWidth = objj_msgSend(coder, "decodeFloatForKey:", CPRuleEditorAlignmentGridWidthKey);
        self._sliceHeight = objj_msgSend(coder, "decodeDoubleForKey:", CPRuleEditorSliceHeightKey);
        self._editable = objj_msgSend(coder, "decodeBoolForKey:", CPRuleEditorEditableKey);
        self._allowsEmptyCompoundRows = objj_msgSend(coder, "decodeBoolForKey:", CPRuleEditorAllowsEmptyCompoundRowsKey);
        self._disallowEmpty = objj_msgSend(coder, "decodeBoolForKey:", CPRuleEditorDisallowEmptyKey);
        self._nestingMode = objj_msgSend(coder, "decodeIntForKey:", CPRuleEditorNestingModeKey);
        self._typeKeyPath = objj_msgSend(coder, "decodeObjectForKey:", CPRuleEditorRowTypeKeyPathKey);
        self._itemsKeyPath = objj_msgSend(coder, "decodeObjectForKey:", CPRuleEditorItemsKeyPathKey);
        self._valuesKeyPath = objj_msgSend(coder, "decodeObjectForKey:", CPRuleEditorValuesKeyPathKey);
        self._subrowsArrayKeyPath = objj_msgSend(coder, "decodeObjectForKey:", CPRuleEditorSubrowsArrayKeyPathKey);
        self._boundArrayKeyPath = objj_msgSend(coder, "decodeObjectForKey:", CPRuleEditorBoundArrayKeyPathKey);
        self._slicesHolder = objj_msgSend(objj_msgSend(self, "subviews"), "objectAtIndex:", 0);
        self._boundArrayOwner = objj_msgSend(coder, "decodeObjectForKey:", CPRuleEditorBoundArrayOwnerKey);
        self._slices = objj_msgSend(coder, "decodeObjectForKey:", CPRuleEditorSlicesKey);
        self._ruleDelegate = objj_msgSend(coder, "decodeObjectForKey:", CPRuleEditorDelegateKey);
        objj_msgSend(self, "_initRuleEditorShared");
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPRuleEditor__encodeWithCoder_(self, _cmd, coder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRuleEditor").super_class }, "encodeWithCoder:", coder);
    objj_msgSend(coder, "encodeBool:forKey:", self._editable, CPRuleEditorEditableKey);
    objj_msgSend(coder, "encodeBool:forKey:", self._allowsEmptyCompoundRows, CPRuleEditorAllowsEmptyCompoundRowsKey);
    objj_msgSend(coder, "encodeBool:forKey:", self._disallowEmpty, CPRuleEditorDisallowEmptyKey);
    objj_msgSend(coder, "encodeFloat:forKey:", self._alignmentGridWidth, CPRuleEditorAlignmentGridWidthKey);
    objj_msgSend(coder, "encodeDouble:forKey:", self._sliceHeight, CPRuleEditorSliceHeightKey);
    objj_msgSend(coder, "encodeInt:forKey:", self._nestingMode, CPRuleEditorNestingModeKey);
    objj_msgSend(coder, "encodeObject:forKey:", self._stringsFilename, CPRuleEditorStringsFilenameKey);
    objj_msgSend(coder, "encodeObject:forKey:", self._typeKeyPath, CPRuleEditorRowTypeKeyPathKey);
    objj_msgSend(coder, "encodeObject:forKey:", self._itemsKeyPath, CPRuleEditorItemsKeyPathKey);
    objj_msgSend(coder, "encodeObject:forKey:", self._valuesKeyPath, CPRuleEditorValuesKeyPathKey);
    objj_msgSend(coder, "encodeObject:forKey:", self._boundArrayKeyPath, CPRuleEditorBoundArrayKeyPathKey);
    objj_msgSend(coder, "encodeObject:forKey:", self._subrowsArrayKeyPath, CPRuleEditorSubrowsArrayKeyPathKey);
    objj_msgSend(coder, "encodeConditionalObject:forKey:", self._slicesHolder, CPRuleEditorSlicesHolderKey);
    objj_msgSend(coder, "encodeObject:forKey:", self._slices, CPRuleEditorSlicesKey);
    objj_msgSend(coder, "encodeObject:forKey:", self._boundArrayOwner, CPRuleEditorBoundArrayOwnerKey);
}
,["void","CPCoder"])]);
}var CriteriaKey = "criteria",
    SubrowsKey = "subrows",
    DisplayValuesKey = "displayValues",
    RowTypeKey = "rowType";
{var the_class = objj_allocateClassPair(CPObject, "_CPRuleEditorRowObject"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("subrows"), new objj_ivar("criteria"), new objj_ivar("displayValues"), new objj_ivar("rowType")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("subrows"), function $_CPRuleEditorRowObject__subrows(self, _cmd)
{
    return self.subrows;
}
,["CPArray"]), new objj_method(sel_getUid("setSubrows:"), function $_CPRuleEditorRowObject__setSubrows_(self, _cmd, newValue)
{
    self.subrows = newValue;
}
,["void","CPArray"]), new objj_method(sel_getUid("criteria"), function $_CPRuleEditorRowObject__criteria(self, _cmd)
{
    return self.criteria;
}
,["CPArray"]), new objj_method(sel_getUid("setCriteria:"), function $_CPRuleEditorRowObject__setCriteria_(self, _cmd, newValue)
{
    self.criteria = newValue;
}
,["void","CPArray"]), new objj_method(sel_getUid("displayValues"), function $_CPRuleEditorRowObject__displayValues(self, _cmd)
{
    return self.displayValues;
}
,["CPArray"]), new objj_method(sel_getUid("setDisplayValues:"), function $_CPRuleEditorRowObject__setDisplayValues_(self, _cmd, newValue)
{
    self.displayValues = newValue;
}
,["void","CPArray"]), new objj_method(sel_getUid("rowType"), function $_CPRuleEditorRowObject__rowType(self, _cmd)
{
    return self.rowType;
}
,["CPInteger"]), new objj_method(sel_getUid("setRowType:"), function $_CPRuleEditorRowObject__setRowType_(self, _cmd, newValue)
{
    self.rowType = newValue;
}
,["void","CPInteger"]), new objj_method(sel_getUid("copy"), function $_CPRuleEditorRowObject__copy(self, _cmd)
{
    var copy = objj_msgSend(objj_msgSend(_CPRuleEditorRowObject, "alloc"), "init");
    objj_msgSend(copy, "setSubrows:", objj_msgSend(objj_msgSend(CPArray, "alloc"), "initWithArray:copyItems:", self.subrows, YES));
    objj_msgSend(copy, "setCriteria:", objj_msgSend(objj_msgSend(CPArray, "alloc"), "initWithArray:copyItems:", self.criteria, YES));
    objj_msgSend(copy, "setDisplayValues:", objj_msgSend(objj_msgSend(CPArray, "alloc"), "initWithArray:copyItems:", self.displayValues, YES));
    objj_msgSend(copy, "setRowType:", self.rowType);
    return copy;
}
,["id"]), new objj_method(sel_getUid("description"), function $_CPRuleEditorRowObject__description(self, _cmd)
{
    return "<" + objj_msgSend(self, "className") + ">\nsubrows = " + objj_msgSend(self.subrows, "description") + "\ncriteria = " + objj_msgSend(self.criteria, "description") + "\ndisplayValues = " + objj_msgSend(self.displayValues, "description");
}
,["CPString"]), new objj_method(sel_getUid("initWithCoder:"), function $_CPRuleEditorRowObject__initWithCoder_(self, _cmd, coder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorRowObject").super_class }, "init");
    if (self !== nil)
    {
        self.subrows = objj_msgSend(coder, "decodeObjectForKey:", SubrowsKey);
        self.criteria = objj_msgSend(coder, "decodeObjectForKey:", CriteriaKey);
        self.displayValues = objj_msgSend(coder, "decodeObjectForKey:", DisplayValuesKey);
        self.rowType = objj_msgSend(coder, "decodeIntForKey:", RowTypeKey);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPRuleEditorRowObject__encodeWithCoder_(self, _cmd, coder)
{
    objj_msgSend(coder, "encodeObject:forKey:", self.subrows, SubrowsKey);
    objj_msgSend(coder, "encodeObject:forKey:", self.criteria, CriteriaKey);
    objj_msgSend(coder, "encodeObject:forKey:", self.displayValues, DisplayValuesKey);
    objj_msgSend(coder, "encodeInt:forKey:", self.rowType, RowTypeKey);
}
,["void","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPObject, "_CPRuleEditorCache"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("rowObject"), new objj_ivar("rowIndex"), new objj_ivar("indentation")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("rowObject"), function $_CPRuleEditorCache__rowObject(self, _cmd)
{
    return self.rowObject;
}
,["CPDictionary"]), new objj_method(sel_getUid("setRowObject:"), function $_CPRuleEditorCache__setRowObject_(self, _cmd, newValue)
{
    self.rowObject = newValue;
}
,["void","CPDictionary"]), new objj_method(sel_getUid("rowIndex"), function $_CPRuleEditorCache__rowIndex(self, _cmd)
{
    return self.rowIndex;
}
,["CPInteger"]), new objj_method(sel_getUid("setRowIndex:"), function $_CPRuleEditorCache__setRowIndex_(self, _cmd, newValue)
{
    self.rowIndex = newValue;
}
,["void","CPInteger"]), new objj_method(sel_getUid("indentation"), function $_CPRuleEditorCache__indentation(self, _cmd)
{
    return self.indentation;
}
,["CPInteger"]), new objj_method(sel_getUid("setIndentation:"), function $_CPRuleEditorCache__setIndentation_(self, _cmd, newValue)
{
    self.indentation = newValue;
}
,["void","CPInteger"]), new objj_method(sel_getUid("description"), function $_CPRuleEditorCache__description(self, _cmd)
{
    return objj_msgSend(CPString, "stringWithFormat:", "<%d object:%d rowIndex:%d indentation:%d>", objj_msgSend(self, "hash"), objj_msgSend(self.rowObject, "hash"), self.rowIndex, self.indentation);
}
,["CPString"])]);
}var CPBoundArrayKey = "CPBoundArray";
{var the_class = objj_allocateClassPair(CPObject, "_CPRuleEditorViewUnboundRowHolder"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("boundArray")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $_CPRuleEditorViewUnboundRowHolder__init(self, _cmd)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorViewUnboundRowHolder").super_class }, "init"))
        self.boundArray = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
    return self;
}
,["id"]), new objj_method(sel_getUid("initWithCoder:"), function $_CPRuleEditorViewUnboundRowHolder__initWithCoder_(self, _cmd, coder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorViewUnboundRowHolder").super_class }, "init"))
        self.boundArray = objj_msgSend(coder, "decodeObjectForKey:", CPBoundArrayKey);
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPRuleEditorViewUnboundRowHolder__encodeWithCoder_(self, _cmd, coder)
{
    objj_msgSend(coder, "encodeObject:forKey:", self.boundArray, CPBoundArrayKey);
}
,["void","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPView, "_CPRuleEditorViewSliceHolder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("addSubview:"), function $_CPRuleEditorViewSliceHolder__addSubview_(self, _cmd, subview)
{
    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorViewSliceHolder").super_class }, "addSubview:", subview);
}
,["void","CPView"])]);
}var dropSeparatorColor = objj_msgSend(CPColor, "colorWithHexString:", "4886ca");
{var the_class = objj_allocateClassPair(CPView, "_CPRuleEditorViewSliceDropSeparator"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("drawRect:"), function $_CPRuleEditorViewSliceDropSeparator__drawRect_(self, _cmd, rect)
{
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    CGContextSetFillColor(context, dropSeparatorColor);
    CGContextFillRect(context, objj_msgSend(self, "bounds"));
}
,["void","CGRect"])]);
}{
var the_class = objj_getClass("CPObject")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("valueType"), function $CPObject__valueType(self, _cmd)
{
    var result = 0,
        isString = objj_msgSend(self, "isKindOfClass:", CPString);
    if (!isString)
    {
        var isView = objj_msgSend(self, "isKindOfClass:", CPView);
        result = 1;
        if (!isView)
        {
            var ismenuItem = objj_msgSend(self, "isKindOfClass:", CPMenuItem);
            result = 2;
            if (!ismenuItem)
            {
                objj_msgSend(CPException, "raise:reason:", CPGenericException, "Unknown type for " + self);
                result = -1;
            }
        }
    }
    return result;
}
,["int"])]);
}