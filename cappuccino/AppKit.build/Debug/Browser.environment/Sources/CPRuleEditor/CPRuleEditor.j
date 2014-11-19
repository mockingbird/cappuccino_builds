@STATIC;1.0;I;24;Foundation/CPPredicate.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;23;Foundation/CPIndexSet.ji;14;CPPasteboard.ji;24;CPRuleEditor_Constants.ji;13;CPTextField.ji;17;CPViewAnimation.ji;8;CPView.ji;27;_CPRuleEditorViewSliceRow.ji;24;_CPRuleEditorLocalizer.jt;120441;objj_executeFile("Foundation/CPPredicate.j", NO);objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("Foundation/CPDictionary.j", NO);objj_executeFile("Foundation/CPIndexSet.j", NO);objj_executeFile("CPPasteboard.j", YES);objj_executeFile("CPRuleEditor_Constants.j", YES);objj_executeFile("CPTextField.j", YES);objj_executeFile("CPViewAnimation.j", YES);objj_executeFile("CPView.j", YES);objj_executeFile("_CPRuleEditorViewSliceRow.j", YES);objj_executeFile("_CPRuleEditorLocalizer.j", YES);{var the_protocol = objj_allocateProtocol("CPRuleEditorDelegate");
var aProtocol = objj_getProtocol("CPObject");
if (!aProtocol) throw new SyntaxError("*** Could not find definition for protocol \"CPRuleEditorDelegate\"");
protocol_addProtocol(the_protocol, aProtocol);
objj_registerProtocol(the_protocol);
protocol_addMethodDescriptions(the_protocol, [new objj_method(sel_getUid("ruleEditor:child:forCriterion:withRowType:"), Nil
,["id","CPRuleEditor","CPInteger","id","CPRuleEditorRowType"]), new objj_method(sel_getUid("ruleEditor:displayValueForCriterion:inRow:"), Nil
,["id","CPRuleEditor","id","CPInteger"]), new objj_method(sel_getUid("ruleEditor:numberOfChildrenForCriterion:withRowType:"), Nil
,["CPInteger","CPRuleEditor","id","CPRuleEditorRowType"])], true, true);
}var CPRuleEditorDelegate_ruleEditor_predicatePartsForCriterion_withDisplayValue_inRow_ = 1 << 1;
var CPRuleEditorItemPBoardType = "CPRuleEditorItemPBoardType",
    itemsContext = "items",
    valuesContext = "values",
    subrowsContext = "subrows_array",
    boundArrayContext = "bound_array";
{var the_class = objj_allocateClassPair(CPControl, "CPRuleEditor"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_suppressKeyDownHandling"), new objj_ivar("_allowsEmptyCompoundRows"), new objj_ivar("_disallowEmpty"), new objj_ivar("_delegateWantsValidation"), new objj_ivar("_editable"), new objj_ivar("_sendAction"), new objj_ivar("_rowClass"), new objj_ivar("_draggingRows"), new objj_ivar("_subviewIndexOfDropLine"), new objj_ivar("_dropLineView"), new objj_ivar("_rowCache"), new objj_ivar("_slices"), new objj_ivar("_predicate"), new objj_ivar("_itemsKeyPath"), new objj_ivar("_subrowsArrayKeyPath"), new objj_ivar("_typeKeyPath"), new objj_ivar("_valuesKeyPath"), new objj_ivar("_boundArrayKeyPath"), new objj_ivar("_slicesHolder"), new objj_ivar("_currentAnimation"), new objj_ivar("_lastRow"), new objj_ivar("_nestingMode"), new objj_ivar("_alignmentGridWidth"), new objj_ivar("_sliceHeight"), new objj_ivar("_ruleDataSource"), new objj_ivar("_ruleDelegate"), new objj_ivar("_boundArrayOwner"), new objj_ivar("_implementedDelegateMethods"), new objj_ivar("_stringsFilename"), new objj_ivar("_isKeyDown"), new objj_ivar("_nestingModeDidChange"), new objj_ivar("_standardLocalizer"), new objj_ivar("_itemsAndValuesToAddForRowType")]);objj_registerClassPair(the_class);
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
        self._slices = ((___r1 = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        self._sliceHeight = 26.;
        self._nestingMode = CPRuleEditorNestingModeSimple;
        self._editable = YES;
        self._allowsEmptyCompoundRows = NO;
        self._disallowEmpty = NO;
        (self == null ? null : self.isa.objj_msgSend1(self, "setFormattingStringsFilename:", nil));
        (self == null ? null : self.isa.objj_msgSend1(self, "setCriteriaKeyPath:", "criteria"));
        (self == null ? null : self.isa.objj_msgSend1(self, "setSubrowsKeyPath:", "subrows"));
        (self == null ? null : self.isa.objj_msgSend1(self, "setRowTypeKeyPath:", "rowType"));
        (self == null ? null : self.isa.objj_msgSend1(self, "setDisplayValuesKeyPath:", "displayValues"));
        (self == null ? null : self.isa.objj_msgSend1(self, "setBoundArrayKeyPath:", "boundArray"));
        self._slicesHolder = ((___r1 = (_CPRuleEditorViewSliceHolder == null ? null : _CPRuleEditorViewSliceHolder.isa.objj_msgSend0(_CPRuleEditorViewSliceHolder, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", (self == null ? null : self.isa.objj_msgSend0(self, "bounds"))));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._slicesHolder));
        self._boundArrayOwner = ((___r1 = (_CPRuleEditorViewUnboundRowHolder == null ? null : _CPRuleEditorViewUnboundRowHolder.isa.objj_msgSend0(_CPRuleEditorViewUnboundRowHolder, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        (self == null ? null : self.isa.objj_msgSend0(self, "_initRuleEditorShared"));
    }
    return self;
    var ___r1;
}
,["id","CGRect"]), new objj_method(sel_getUid("_initRuleEditorShared"), function $CPRuleEditor___initRuleEditorShared(self, _cmd)
{
    self._rowCache = ((___r1 = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    self._rowClass = (_CPRuleEditorRowObject == null ? null : _CPRuleEditorRowObject.isa.objj_msgSend0(_CPRuleEditorRowObject, "class"));
    self._isKeyDown = NO;
    self._subviewIndexOfDropLine = CPNotFound;
    self._lastRow = 0;
    self._delegateWantsValidation = YES;
    self._suppressKeyDownHandling = NO;
    self._nestingModeDidChange = NO;
    self._sendAction = YES;
    self._itemsAndValuesToAddForRowType = {};
    var animation = ((___r1 = CPViewAnimation.isa.objj_msgSend0(CPViewAnimation, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithDuration:animationCurve:", 0.5, CPAnimationEaseInOut));
    self.isa.objj_msgSend1(self, "setAnimation:", animation);
    ((___r1 = self._slicesHolder), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
    self._dropLineView = self.isa.objj_msgSend0(self, "_createSliceDropSeparator");
    ((___r1 = self._slicesHolder), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._dropLineView));
    self.isa.objj_msgSend1(self, "registerForDraggedTypes:", CPArray.isa.objj_msgSend2(CPArray, "arrayWithObjects:", CPRuleEditorItemPBoardType, nil));
    ((___r1 = self._boundArrayOwner), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:forKeyPath:options:context:", self, self._boundArrayKeyPath, CPKeyValueObservingOptionOld | CPKeyValueObservingOptionNew, boundArrayContext));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("delegate"), function $CPRuleEditor__delegate(self, _cmd)
{
    return self._ruleDelegate;
}
,["id"]), new objj_method(sel_getUid("setDelegate:"), function $CPRuleEditor__setDelegate_(self, _cmd, aDelegate)
{
    if (self._ruleDelegate === aDelegate)
        return;
    var nc = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter");
    if (self._ruleDelegate)
        (nc == null ? null : nc.isa.objj_msgSend3(nc, "removeObserver:name:object:", self._ruleDelegate, nil, self));
    self._ruleDelegate = aDelegate;
    self._implementedDelegateMethods = 0;
    if (((___r1 = self._ruleDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("ruleEditorRowsDidChange:"))))
        (nc == null ? null : nc.isa.objj_msgSend(nc, "addObserver:selector:name:object:", self._ruleDelegate, sel_getUid("ruleEditorRowsDidChange:"), CPRuleEditorRowsDidChangeNotification, nil));
    if (((___r1 = self._ruleDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("ruleEditor:predicatePartsForCriterion:withDisplayValue:inRow:"))))
        self._implementedDelegateMethods |= CPRuleEditorDelegate_ruleEditor_predicatePartsForCriterion_withDisplayValue_inRow_;
    var ___r1;
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
        self.isa.objj_msgSend0(self, "_deselectAll");
    ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("setEditable:"), self._editable));
    var ___r1;
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
        if (self.isa.objj_msgSend0(self, "numberOfRows") > 0)
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
    self.isa.objj_msgSend0(self, "_updateButtonVisibilities");
}
,["void","BOOL"]), new objj_method(sel_getUid("allowsEmptyCompoundRows"), function $CPRuleEditor__allowsEmptyCompoundRows(self, _cmd)
{
    return self._allowsEmptyCompoundRows;
}
,["BOOL"]), new objj_method(sel_getUid("setAllowsEmptyCompoundRows:"), function $CPRuleEditor__setAllowsEmptyCompoundRows_(self, _cmd, allows)
{
    self._allowsEmptyCompoundRows = allows;
    self.isa.objj_msgSend0(self, "_updateButtonVisibilities");
}
,["void","BOOL"]), new objj_method(sel_getUid("rowHeight"), function $CPRuleEditor__rowHeight(self, _cmd)
{
    return self._sliceHeight;
}
,["CPInteger"]), new objj_method(sel_getUid("setRowHeight:"), function $CPRuleEditor__setRowHeight_(self, _cmd, height)
{
    if (height === self._sliceHeight)
        return;
    self._sliceHeight = MAX(self.isa.objj_msgSend0(self, "_minimumFrameHeight"), height);
    self.isa.objj_msgSend1(self, "_reconfigureSubviewsAnimate:", NO);
}
,["void","float"]), new objj_method(sel_getUid("formattingDictionary"), function $CPRuleEditor__formattingDictionary(self, _cmd)
{
    return ((___r1 = self._standardLocalizer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "dictionary"));
    var ___r1;
}
,["CPDictionary"]), new objj_method(sel_getUid("setFormattingDictionary:"), function $CPRuleEditor__setFormattingDictionary_(self, _cmd, dictionary)
{
    ((___r1 = self._standardLocalizer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDictionary:", dictionary));
    self._stringsFilename = nil;
    var ___r1;
}
,["void","CPDictionary"]), new objj_method(sel_getUid("formattingStringsFilename"), function $CPRuleEditor__formattingStringsFilename(self, _cmd)
{
    return self._stringsFilename;
}
,["CPString"]), new objj_method(sel_getUid("setFormattingStringsFilename:"), function $CPRuleEditor__setFormattingStringsFilename_(self, _cmd, stringsFilename)
{
    if (self._standardLocalizer === nil)
        self._standardLocalizer = _CPRuleEditorLocalizer.isa.objj_msgSend0(_CPRuleEditorLocalizer, "new");
    if (self._stringsFilename !== stringsFilename)
    {
        self._stringsFilename = stringsFilename || nil;
        if (stringsFilename !== nil)
        {
            if (!(stringsFilename == null ? null : stringsFilename.isa.objj_msgSend1(stringsFilename, "hasSuffix:", ".strings")))
                stringsFilename = stringsFilename + ".strings";
            var path = ((___r1 = CPBundle.isa.objj_msgSend0(CPBundle, "mainBundle")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "pathForResource:", stringsFilename));
            if (path !== nil)
                ((___r1 = self._standardLocalizer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "loadContentOfURL:", CPURL.isa.objj_msgSend1(CPURL, "URLWithString:", path)));
        }
    }
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("reloadCriteria"), function $CPRuleEditor__reloadCriteria(self, _cmd)
{
    var current_rows = ((___r1 = self._boundArrayOwner), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", self._boundArrayKeyPath));
    self.isa.objj_msgSend1(self, "_stopObservingRowObjectsRecursively:", current_rows);
    ((___r1 = self._boundArrayOwner), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKey:", CPArray.isa.objj_msgSend1(CPArray, "arrayWithArray:", current_rows), self._boundArrayKeyPath));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setCriteria:andDisplayValues:forRowAtIndex:"), function $CPRuleEditor__setCriteria_andDisplayValues_forRowAtIndex_(self, _cmd, criteria, values, rowIndex)
{
    if (criteria === nil || values === nil)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, _cmd + ". criteria and values parameters must not be nil.");
    if (rowIndex < 0 || rowIndex >= self.isa.objj_msgSend0(self, "numberOfRows"))
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPRangeException, _cmd + ". rowIndex is out of bounds.");
    var rowObject = ((___r1 = self.isa.objj_msgSend1(self, "_rowCacheForIndex:", rowIndex)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "rowObject"));
    (rowObject == null ? null : rowObject.isa.objj_msgSend2(rowObject, "setValue:forKey:", criteria, self._itemsKeyPath));
    (rowObject == null ? null : rowObject.isa.objj_msgSend2(rowObject, "setValue:forKey:", values, self._valuesKeyPath));
    self.isa.objj_msgSend0(self, "reloadCriteria");
    var ___r1;
}
,["void","CPArray","CPArray","int"]), new objj_method(sel_getUid("criteriaForRow:"), function $CPRuleEditor__criteriaForRow_(self, _cmd, row)
{
    var rowcache = self.isa.objj_msgSend1(self, "_rowCacheForIndex:", row);
    if (rowcache)
        return ((___r1 = (rowcache == null ? null : rowcache.isa.objj_msgSend0(rowcache, "rowObject"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", self._itemsKeyPath));
    return nil;
    var ___r1;
}
,["id","CPInteger"]), new objj_method(sel_getUid("displayValuesForRow:"), function $CPRuleEditor__displayValuesForRow_(self, _cmd, row)
{
    var rowcache = self.isa.objj_msgSend1(self, "_rowCacheForIndex:", row);
    if (rowcache)
        return ((___r1 = (rowcache == null ? null : rowcache.isa.objj_msgSend0(rowcache, "rowObject"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", self._valuesKeyPath));
    return nil;
    var ___r1;
}
,["CPMutableArray","CPInteger"]), new objj_method(sel_getUid("numberOfRows"), function $CPRuleEditor__numberOfRows(self, _cmd)
{
    return ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    var ___r1;
}
,["int"]), new objj_method(sel_getUid("parentRowForRow:"), function $CPRuleEditor__parentRowForRow_(self, _cmd, rowIndex)
{
    if (rowIndex < 0 || rowIndex >= self.isa.objj_msgSend0(self, "numberOfRows"))
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPRangeException, _cmd + " row " + rowIndex + " is out of range");
    var targetObject = ((___r1 = self.isa.objj_msgSend1(self, "_rowCacheForIndex:", rowIndex)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "rowObject"));
    for (var current_index = 0; current_index < rowIndex; current_index++)
    {
        if (self.isa.objj_msgSend1(self, "rowTypeForRow:", current_index) === CPRuleEditorRowTypeCompound)
        {
            var candidate = ((___r1 = self.isa.objj_msgSend1(self, "_rowCacheForIndex:", current_index)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "rowObject")),
                subObjects = ((___r1 = self.isa.objj_msgSend1(self, "_subrowObjectsOfObject:", candidate)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_representedObject"));
            if ((subObjects == null ? null : subObjects.isa.objj_msgSend1(subObjects, "indexOfObjectIdenticalTo:", targetObject)) !== CPNotFound)
                return current_index;
        }
    }
    return -1;
    var ___r1;
}
,["int","CPInteger"]), new objj_method(sel_getUid("rowTypeForRow:"), function $CPRuleEditor__rowTypeForRow_(self, _cmd, rowIndex)
{
    if (rowIndex < 0 || rowIndex > self.isa.objj_msgSend0(self, "numberOfRows"))
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPRangeException, _cmd + "row " + rowIndex + " is out of range");
    var rowcache = self.isa.objj_msgSend1(self, "_rowCacheForIndex:", rowIndex);
    if (rowcache)
    {
        var rowobject = (rowcache == null ? null : rowcache.isa.objj_msgSend0(rowcache, "rowObject"));
        return (rowobject == null ? null : rowobject.isa.objj_msgSend1(rowobject, "valueForKey:", self._typeKeyPath));
    }
    return CPNotFound;
}
,["CPRuleEditorRowType","CPInteger"]), new objj_method(sel_getUid("subrowIndexesForRow:"), function $CPRuleEditor__subrowIndexesForRow_(self, _cmd, rowIndex)
{
    var object;
    if (rowIndex === -1)
        object = self._boundArrayOwner;
    else
        object = ((___r1 = self.isa.objj_msgSend1(self, "_rowCacheForIndex:", rowIndex)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "rowObject"));
    var subobjects = self.isa.objj_msgSend1(self, "_subrowObjectsOfObject:", object),
        objectsCount = (subobjects == null ? null : subobjects.isa.objj_msgSend0(subobjects, "count")),
        indexes = CPMutableIndexSet.isa.objj_msgSend0(CPMutableIndexSet, "indexSet"),
        count = self.isa.objj_msgSend0(self, "numberOfRows");
    for (var i = rowIndex + 1; i < count; i++)
    {
        var candidate = ((___r1 = self.isa.objj_msgSend1(self, "_rowCacheForIndex:", i)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "rowObject")),
            indexInSubrows = ((___r1 = (subobjects == null ? null : subobjects.isa.objj_msgSend0(subobjects, "_representedObject"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObjectIdenticalTo:", candidate));
        if (indexInSubrows !== CPNotFound)
        {
            (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "addIndex:", i));
            objectsCount--;
            if (self.isa.objj_msgSend1(self, "rowTypeForRow:", i) === CPRuleEditorRowTypeCompound)
                i += ((___r1 = self.isa.objj_msgSend1(self, "subrowIndexesForRow:", i)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
        }
        if (objectsCount === 0)
            break;
    }
    return indexes;
    var ___r1;
}
,["CPIndexSet","CPInteger"]), new objj_method(sel_getUid("selectedRowIndexes"), function $CPRuleEditor__selectedRowIndexes(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "_selectedSliceIndices");
}
,["CPIndexSet"]), new objj_method(sel_getUid("selectRowIndexes:byExtendingSelection:"), function $CPRuleEditor__selectRowIndexes_byExtendingSelection_(self, _cmd, indexes, extend)
{
    var count = ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")),
        lastSelected = (indexes == null ? null : indexes.isa.objj_msgSend0(indexes, "lastIndex"));
    if (lastSelected >= self.isa.objj_msgSend0(self, "numberOfRows"))
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPRangeException, "row indexes " + indexes + " are out of range");
    if (!extend)
        self.isa.objj_msgSend0(self, "_deselectAll");
    while (count--)
    {
        var slice = self._slices[count],
            rowIndex = (slice == null ? null : slice.isa.objj_msgSend0(slice, "rowIndex")),
            contains = (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "containsIndex:", rowIndex)),
            shouldSelect = contains && !(extend && (slice == null ? null : slice.isa.objj_msgSend0(slice, "_isSelected")));
        if (contains)
            (slice == null ? null : slice.isa.objj_msgSend1(slice, "_setSelected:", shouldSelect));
        (slice == null ? null : slice.isa.objj_msgSend1(slice, "_setLastSelected:", rowIndex === lastSelected));
        (slice == null ? null : slice.isa.objj_msgSend1(slice, "setNeedsDisplay:", YES));
    }
    var ___r1;
}
,["void","CPIndexSet","BOOL"]), new objj_method(sel_getUid("addRow:"), function $CPRuleEditor__addRow_(self, _cmd, sender)
{
    var parentRowIndex = -1,
        rowtype,
        numberOfRows = self.isa.objj_msgSend0(self, "numberOfRows"),
        hasRows = numberOfRows > 0,
        nestingMode = self.isa.objj_msgSend0(self, "_applicableNestingMode");
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
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "Not supported CPRuleEditorNestingMode " + nestingMode);
    }
    self.isa.objj_msgSend(self, "insertRowAtIndex:withType:asSubrowOfRow:animate:", numberOfRows, rowtype, parentRowIndex, YES);
}
,["void","id"]), new objj_method(sel_getUid("insertRowAtIndex:withType:asSubrowOfRow:animate:"), function $CPRuleEditor__insertRowAtIndex_withType_asSubrowOfRow_animate_(self, _cmd, rowIndex, rowType, parentRow, shouldAnimate)
{
    var newObject = self.isa.objj_msgSend3(self, "_insertNewRowAtIndex:ofType:withParentRow:", rowIndex, rowType, parentRow);
    if (rowType === CPRuleEditorRowTypeCompound && !self._allowsEmptyCompoundRows)
    {
        var subrow = self.isa.objj_msgSend3(self, "_insertNewRowAtIndex:ofType:withParentRow:", rowIndex + 1, CPRuleEditorRowTypeSimple, rowIndex);
    }
}
,["void","int","unsigned int","CPInteger","BOOL"]), new objj_method(sel_getUid("removeRowAtIndex:"), function $CPRuleEditor__removeRowAtIndex_(self, _cmd, rowIndex)
{
    if (rowIndex < 0 || rowIndex >= self.isa.objj_msgSend0(self, "numberOfRows"))
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPRangeException, "row " + rowIndex + " is out of range");
    self.isa.objj_msgSend2(self, "removeRowsAtIndexes:includeSubrows:", CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", rowIndex), NO);
}
,["void","int"]), new objj_method(sel_getUid("removeRowsAtIndexes:includeSubrows:"), function $CPRuleEditor__removeRowsAtIndexes_includeSubrows_(self, _cmd, rowIndexes, includeSubrows)
{
    if ((rowIndexes == null ? null : rowIndexes.isa.objj_msgSend0(rowIndexes, "count")) === 0)
        return;
    if ((rowIndexes == null ? null : rowIndexes.isa.objj_msgSend0(rowIndexes, "lastIndex")) >= self.isa.objj_msgSend0(self, "numberOfRows"))
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPRangeException, "rows indexes " + rowIndexes + " are out of range");
    var current_index = (rowIndexes == null ? null : rowIndexes.isa.objj_msgSend0(rowIndexes, "firstIndex")),
        parentRowIndex = self.isa.objj_msgSend1(self, "parentRowForRow:", current_index),
        childsIndexes = CPMutableIndexSet.isa.objj_msgSend0(CPMutableIndexSet, "indexSet"),
        subrows;
    if (parentRowIndex === -1)
        subrows = self.isa.objj_msgSend0(self, "_rootRowsArray");
    else
    {
        var parentRowObject = ((___r1 = self.isa.objj_msgSend1(self, "_rowCacheForIndex:", parentRowIndex)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "rowObject"));
        subrows = self.isa.objj_msgSend1(self, "_subrowObjectsOfObject:", parentRowObject);
    }
    while (current_index !== CPNotFound)
    {
        var rowObject = ((___r1 = self.isa.objj_msgSend1(self, "_rowCacheForIndex:", current_index)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "rowObject")),
            relativeChildIndex = ((___r1 = (subrows == null ? null : subrows.isa.objj_msgSend0(subrows, "_representedObject"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObjectIdenticalTo:", rowObject));
        if (relativeChildIndex !== CPNotFound)
            (childsIndexes == null ? null : childsIndexes.isa.objj_msgSend1(childsIndexes, "addIndex:", relativeChildIndex));
        if (includeSubrows && self.isa.objj_msgSend1(self, "rowTypeForRow:", current_index) === CPRuleEditorRowTypeCompound)
        {
            var more_childs = self.isa.objj_msgSend1(self, "subrowIndexesForRow:", current_index);
            self.isa.objj_msgSend2(self, "removeRowsAtIndexes:includeSubrows:", more_childs, includeSubrows);
        }
        current_index = (rowIndexes == null ? null : rowIndexes.isa.objj_msgSend1(rowIndexes, "indexGreaterThanIndex:", current_index));
    }
    (subrows == null ? null : subrows.isa.objj_msgSend1(subrows, "removeObjectsAtIndexes:", childsIndexes));
    var ___r1;
}
,["void","CPIndexSet","BOOL"]), new objj_method(sel_getUid("predicate"), function $CPRuleEditor__predicate(self, _cmd)
{
    return self._predicate;
}
,["CPPredicate"]), new objj_method(sel_getUid("reloadPredicate"), function $CPRuleEditor__reloadPredicate(self, _cmd)
{
    self.isa.objj_msgSend0(self, "_updatePredicate");
}
,["void"]), new objj_method(sel_getUid("predicateForRow:"), function $CPRuleEditor__predicateForRow_(self, _cmd, aRow)
{
    var predicateParts = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init"),
        items = self.isa.objj_msgSend1(self, "criteriaForRow:", aRow),
        count = (items == null ? null : items.isa.objj_msgSend0(items, "count")),
        predicate,
        i;
    for (i = 0; i < count; i++)
    {
        var item = (items == null ? null : items.isa.objj_msgSend1(items, "objectAtIndex:", i)),
            displayValue = ((___r1 = self.isa.objj_msgSend1(self, "displayValuesForRow:", aRow)), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", i)),
            predpart = self.isa.objj_msgSend3(self, "_sendDelegateRuleEditorPredicatePartsForCriterion:withDisplayValue:inRow:", item, displayValue, aRow);
        if (predpart)
            (predicateParts == null ? null : predicateParts.isa.objj_msgSend1(predicateParts, "addEntriesFromDictionary:", predpart));
    }
    if (self.isa.objj_msgSend1(self, "rowTypeForRow:", aRow) === CPRuleEditorRowTypeCompound)
    {
        var compoundPredicate,
            subpredicates = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "array"),
            subrowsIndexes = self.isa.objj_msgSend1(self, "subrowIndexesForRow:", aRow);
        if ((subrowsIndexes == null ? null : subrowsIndexes.isa.objj_msgSend0(subrowsIndexes, "count")) === 0)
            return nil;
        var current_index = (subrowsIndexes == null ? null : subrowsIndexes.isa.objj_msgSend0(subrowsIndexes, "firstIndex"));
        while (current_index !== CPNotFound)
        {
            var subpredicate = self.isa.objj_msgSend1(self, "predicateForRow:", current_index);
            if (subpredicate !== nil)
                (subpredicates == null ? null : subpredicates.isa.objj_msgSend1(subpredicates, "addObject:", subpredicate));
            current_index = (subrowsIndexes == null ? null : subrowsIndexes.isa.objj_msgSend1(subrowsIndexes, "indexGreaterThanIndex:", current_index));
        }
        var compoundType = (predicateParts == null ? null : predicateParts.isa.objj_msgSend1(predicateParts, "objectForKey:", CPRuleEditorPredicateCompoundType));
        if ((subpredicates == null ? null : subpredicates.isa.objj_msgSend0(subpredicates, "count")) === 0)
            return nil;
        else
        {
            try            {
                compoundPredicate = ((___r1 = (CPCompoundPredicate == null ? null : CPCompoundPredicate.isa.objj_msgSend0(CPCompoundPredicate, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithType:subpredicates:", compoundType, subpredicates));
            }
            catch(error)             {
                CPLogConsole("Compound predicate error: [%@]\npredicateType:%i", (error == null ? null : error.isa.objj_msgSend0(error, "description")), compoundType);
                compoundPredicate = nil;
            }            finally             {
                return compoundPredicate;
            }
        }
    }
    var lhs = (predicateParts == null ? null : predicateParts.isa.objj_msgSend1(predicateParts, "objectForKey:", CPRuleEditorPredicateLeftExpression)),
        rhs = (predicateParts == null ? null : predicateParts.isa.objj_msgSend1(predicateParts, "objectForKey:", CPRuleEditorPredicateRightExpression)),
        operator = (predicateParts == null ? null : predicateParts.isa.objj_msgSend1(predicateParts, "objectForKey:", CPRuleEditorPredicateOperatorType)),
        options = (predicateParts == null ? null : predicateParts.isa.objj_msgSend1(predicateParts, "objectForKey:", CPRuleEditorPredicateOptions)),
        modifier = (predicateParts == null ? null : predicateParts.isa.objj_msgSend1(predicateParts, "objectForKey:", CPRuleEditorPredicateComparisonModifier)),
        selector = CPSelectorFromString((predicateParts == null ? null : predicateParts.isa.objj_msgSend1(predicateParts, "objectForKey:", CPRuleEditorPredicateCustomSelector)));
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
            predicate = (CPComparisonPredicate == null ? null : CPComparisonPredicate.isa.objj_msgSend3(CPComparisonPredicate, "predicateWithLeftExpression:rightExpression:customSelector:", lhs, rhs, selector));
        else
            predicate = (CPComparisonPredicate == null ? null : CPComparisonPredicate.isa.objj_msgSend(CPComparisonPredicate, "predicateWithLeftExpression:rightExpression:modifier:type:options:", lhs, rhs, modifier || CPDirectPredicateModifier, operator, options || CPCaseInsensitivePredicateOption));
    }
    catch(error)     {
        CPLogConsole("Row predicate error: [" + (error == null ? null : error.isa.objj_msgSend0(error, "description")) + "] for row " + aRow);
        predicate = nil;
    }    finally     {
        return predicate;
    }
    var ___r1;
}
,["CPPredicate","CPInteger"]), new objj_method(sel_getUid("rowClass"), function $CPRuleEditor__rowClass(self, _cmd)
{
    return self._rowClass;
}
,["Class"]), new objj_method(sel_getUid("setRowClass:"), function $CPRuleEditor__setRowClass_(self, _cmd, rowClass)
{
    if (rowClass === CPMutableDictionary.isa.objj_msgSend0(CPMutableDictionary, "class"))
        rowClass = (_CPRuleEditorRowObject == null ? null : _CPRuleEditorRowObject.isa.objj_msgSend0(_CPRuleEditorRowObject, "class"));
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
    ((___r1 = self._currentAnimation), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDelegate:", self));
    var ___r1;
}
,["void","CPViewAnimation"]), new objj_method(sel_getUid("acceptsFirstResponder"), function $CPRuleEditor__acceptsFirstResponder(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("keyDown:"), function $CPRuleEditor__keyDown_(self, _cmd, event)
{
    if (!self._suppressKeyDownHandling && self.isa.objj_msgSend0(self, "_applicableNestingMode") === CPRuleEditorNestingModeCompound && !self._isKeyDown && (event == null ? null : event.isa.objj_msgSend0(event, "modifierFlags")) & CPAlternateKeyMask)
    {
        ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("_configurePlusButtonByRowType:"), CPRuleEditorRowTypeCompound));
    }
    self._isKeyDown = YES;
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("keyUp:"), function $CPRuleEditor__keyUp_(self, _cmd, event)
{
    if (!self._suppressKeyDownHandling)
    {
        ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("_configurePlusButtonByRowType:"), CPRuleEditorRowTypeSimple));
    }
    self._isKeyDown = NO;
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("_createSliceDropSeparator"), function $CPRuleEditor___createSliceDropSeparator(self, _cmd)
{
    var view = ((___r1 = (_CPRuleEditorViewSliceDropSeparator == null ? null : _CPRuleEditorViewSliceDropSeparator.isa.objj_msgSend0(_CPRuleEditorViewSliceDropSeparator, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, -10, self.isa.objj_msgSend0(self, "frame").size.width, 2)));
    (view == null ? null : view.isa.objj_msgSend1(view, "setAutoresizingMask:", CPViewWidthSizable));
    return view;
    var ___r1;
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
    ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeObjectsPerformSelector:", sel_getUid("_updateButtonVisibilities")));
    var ___r1;
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
        b = self.isa.objj_msgSend1(self, "rowTypeForRow:", 0) === CPRuleEditorRowTypeCompound;
    if (a === b)
        return self._nestingMode;
    return a ? CPRuleEditorNestingModeList : CPRuleEditorNestingModeSimple;
}
,["CPRuleEditorNestingMode"]), new objj_method(sel_getUid("_shouldHideAddButtonForSlice:"), function $CPRuleEditor___shouldHideAddButtonForSlice_(self, _cmd, slice)
{
    return !self._editable || self.isa.objj_msgSend0(self, "_applicableNestingMode") === CPRuleEditorNestingModeSingle;
}
,["BOOL","id"]), new objj_method(sel_getUid("_shouldHideSubtractButtonForSlice:"), function $CPRuleEditor___shouldHideSubtractButtonForSlice_(self, _cmd, slice)
{
    if (!self._editable)
        return YES;
    if (!self._disallowEmpty)
        return NO;
    var shouldHide,
        rowIndex = (slice == null ? null : slice.isa.objj_msgSend0(slice, "rowIndex")),
        parentIndex = self.isa.objj_msgSend1(self, "parentRowForRow:", rowIndex),
        subrowsIndexes = self.isa.objj_msgSend1(self, "subrowIndexesForRow:", parentIndex),
        nestingMode = self.isa.objj_msgSend0(self, "_applicableNestingMode");
    switch(nestingMode) {
    case CPRuleEditorNestingModeCompound:
    case CPRuleEditorNestingModeSimple:
        shouldHide = (subrowsIndexes == null ? null : subrowsIndexes.isa.objj_msgSend0(subrowsIndexes, "count")) === 1 && !self._allowsEmptyCompoundRows || parentIndex === -1;
        break;
    case CPRuleEditorNestingModeList:
        shouldHide = self.isa.objj_msgSend0(self, "numberOfRows") === 1;
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
    return ((___r1 = self._rowCache), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", index));
    var ___r1;
}
,["id","int"]), new objj_method(sel_getUid("_searchCacheForRowObject:"), function $CPRuleEditor___searchCacheForRowObject_(self, _cmd, rowObject)
{
    var count = ((___r1 = self._rowCache), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")),
        i;
    for (i = 0; i < count; i++)
    {
        var cache = self._rowCache[i];
        if ((cache == null ? null : cache.isa.objj_msgSend0(cache, "rowObject")) === rowObject)
            return cache;
    }
    return nil;
    var ___r1;
}
,["id","id"]), new objj_method(sel_getUid("_rowIndexForRowObject:"), function $CPRuleEditor___rowIndexForRowObject_(self, _cmd, rowobject)
{
    if (rowobject === self._boundArrayOwner)
        return -1;
    return ((___r1 = self.isa.objj_msgSend1(self, "_searchCacheForRowObject:", rowobject)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "rowIndex"));
    var ___r1;
}
,["int","id"]), new objj_method(sel_getUid("_subrowObjectsOfObject:"), function $CPRuleEditor___subrowObjectsOfObject_(self, _cmd, object)
{
    if (object === self._boundArrayOwner)
        return self.isa.objj_msgSend0(self, "_rootRowsArray");
    return (object == null ? null : object.isa.objj_msgSend1(object, "mutableArrayValueForKey:", self._subrowsArrayKeyPath));
}
,["CPMutableArray","id"]), new objj_method(sel_getUid("_childlessParentsIfSlicesWereDeletedAtIndexes:"), function $CPRuleEditor___childlessParentsIfSlicesWereDeletedAtIndexes_(self, _cmd, indexes)
{
    var childlessParents = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet"),
        current_index = (indexes == null ? null : indexes.isa.objj_msgSend0(indexes, "firstIndex"));
    while (current_index !== CPNotFound)
    {
        var parentIndex = self.isa.objj_msgSend1(self, "parentRowForRow:", current_index),
            subrowsIndexes = self.isa.objj_msgSend1(self, "subrowIndexesForRow:", parentIndex);
        if ((subrowsIndexes == null ? null : subrowsIndexes.isa.objj_msgSend0(subrowsIndexes, "count")) === 1)
        {
            if (parentIndex !== -1)
                return CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", 0);
            var childlessGranPa = self.isa.objj_msgSend1(self, "_childlessParentsIfSlicesWereDeletedAtIndexes:", CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", parentIndex));
            (childlessParents == null ? null : childlessParents.isa.objj_msgSend1(childlessParents, "addIndexes:", childlessGranPa));
        }
        current_index = (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "indexGreaterThanIndex:", current_index));
    }
    return childlessParents;
}
,["CPIndexSet","id"]), new objj_method(sel_getUid("_includeSubslicesForSlicesAtIndexes:"), function $CPRuleEditor___includeSubslicesForSlicesAtIndexes_(self, _cmd, indexes)
{
    var subindexes = (indexes == null ? null : indexes.isa.objj_msgSend0(indexes, "copy")),
        current_index = (indexes == null ? null : indexes.isa.objj_msgSend0(indexes, "firstIndex"));
    while (current_index !== CPNotFound)
    {
        var sub = self.isa.objj_msgSend1(self, "subrowIndexesForRow:", current_index);
        (subindexes == null ? null : subindexes.isa.objj_msgSend1(subindexes, "addIndexes:", self.isa.objj_msgSend1(self, "_includeSubslicesForSlicesAtIndexes:", sub)));
        current_index = (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "indexGreaterThanIndex:", current_index));
    }
    return subindexes;
}
,["CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("_deleteSlice:"), function $CPRuleEditor___deleteSlice_(self, _cmd, slice)
{
    var rowindexes = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", (slice == null ? null : slice.isa.objj_msgSend0(slice, "rowIndex")));
    if (!self._allowsEmptyCompoundRows)
    {
        var childlessIndexes = self.isa.objj_msgSend1(self, "_childlessParentsIfSlicesWereDeletedAtIndexes:", rowindexes);
        if ((childlessIndexes == null ? null : childlessIndexes.isa.objj_msgSend0(childlessIndexes, "count")) > 0)
            rowindexes = childlessIndexes;
    }
    self.isa.objj_msgSend2(self, "removeRowsAtIndexes:includeSubrows:", rowindexes, YES);
    self.isa.objj_msgSend0(self, "_updatePredicate");
    self.isa.objj_msgSend0(self, "_sendRuleAction");
    self.isa.objj_msgSend0(self, "_postRuleOptionChangedNotification");
    self.isa.objj_msgSend2(self, "_postRowCountChangedNotificationOfType:indexes:", CPRuleEditorRowsDidChangeNotification, rowindexes);
}
,["void","id"]), new objj_method(sel_getUid("_rootRowsArray"), function $CPRuleEditor___rootRowsArray(self, _cmd)
{
    return ((___r1 = self._boundArrayOwner), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "mutableArrayValueForKey:", self._boundArrayKeyPath));
    var ___r1;
}
,["CPArray"]), new objj_method(sel_getUid("_nextUnusedItems:andValues:forRow:forRowType:"), function $CPRuleEditor___nextUnusedItems_andValues_forRow_forRowType_(self, _cmd, items, values, rowIndex, type)
{
    var parentItem = (items == null ? null : items.isa.objj_msgSend0(items, "lastObject")),
        childrenCount = self.isa.objj_msgSend2(self, "_queryNumberOfChildrenOfItem:withRowType:", parentItem, type),
        foundIndex = CPNotFound;
    if (childrenCount === 0)
        return NO;
    var current_criterions = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "array"),
        count = self.isa.objj_msgSend0(self, "numberOfRows"),
        row;
    for (row = 0; row < count; row++)
    {
        var aCriteria = self.isa.objj_msgSend1(self, "criteriaForRow:", row),
            itemIndex = (items == null ? null : items.isa.objj_msgSend0(items, "count"));
        if (self.isa.objj_msgSend1(self, "rowTypeForRow:", row) === type && itemIndex < (aCriteria == null ? null : aCriteria.isa.objj_msgSend0(aCriteria, "count")))
        {
            var crit = (aCriteria == null ? null : aCriteria.isa.objj_msgSend1(aCriteria, "objectAtIndex:", itemIndex));
            (current_criterions == null ? null : current_criterions.isa.objj_msgSend1(current_criterions, "addObject:", crit));
        }
    }
    while (foundIndex === CPNotFound)
    {
        var buffer = CPMutableArray.isa.objj_msgSend1(CPMutableArray, "arrayWithArray:", current_criterions),
            i;
        for (i = 0; i < childrenCount; i++)
        {
            var child = self.isa.objj_msgSend3(self, "_queryChild:ofItem:withRowType:", i, parentItem, type);
            if ((current_criterions == null ? null : current_criterions.isa.objj_msgSend1(current_criterions, "indexOfObject:", child)) === CPNotFound)
            {
                foundIndex = i;
                break;
            }
        }
        if (foundIndex === CPNotFound)
        {
            for (var k = 0; k < childrenCount; k++)
            {
                var anobject = self.isa.objj_msgSend3(self, "_queryChild:ofItem:withRowType:", k, parentItem, type),
                    index = (buffer == null ? null : buffer.isa.objj_msgSend1(buffer, "indexOfObject:", anobject));
                if (index !== CPNotFound)
                    (buffer == null ? null : buffer.isa.objj_msgSend1(buffer, "removeObjectAtIndex:", index));
            }
            current_criterions = buffer;
        }
    }
    var foundItem = self.isa.objj_msgSend3(self, "_queryChild:ofItem:withRowType:", foundIndex, parentItem, type),
        foundValue = self.isa.objj_msgSend2(self, "_queryValueForItem:inRow:", foundItem, rowIndex);
    (items == null ? null : items.isa.objj_msgSend1(items, "addObject:", foundItem));
    (values == null ? null : values.isa.objj_msgSend1(values, "addObject:", foundValue));
    return YES;
}
,["BOOL","CPArray","CPArray","CPInteger","unsigned int"]), new objj_method(sel_getUid("_getItemsAndValuesToAddForRow:ofType:"), function $CPRuleEditor___getItemsAndValuesToAddForRow_ofType_(self, _cmd, rowIndex, type)
{
    var itemsAndValues = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "array"),
        items = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "array"),
        values = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "array"),
        unusedItems = YES;
    while (unusedItems)
        unusedItems = self.isa.objj_msgSend(self, "_nextUnusedItems:andValues:forRow:forRowType:", items, values, rowIndex, type);
    var count = (items == null ? null : items.isa.objj_msgSend0(items, "count"));
    for (var i = 0; i < count; i++)
    {
        var item = (items == null ? null : items.isa.objj_msgSend1(items, "objectAtIndex:", i)),
            value = (values == null ? null : values.isa.objj_msgSend1(values, "objectAtIndex:", i)),
            itemAndValue = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", item, "item", value, "value");
        (itemsAndValues == null ? null : itemsAndValues.isa.objj_msgSend1(itemsAndValues, "addObject:", itemAndValue));
    }
    return itemsAndValues;
}
,["CPMutableArray","CPInteger","CPRuleEditorRowType"]), new objj_method(sel_getUid("_addOptionFromSlice:ofRowType:"), function $CPRuleEditor___addOptionFromSlice_ofRowType_(self, _cmd, slice, type)
{
    var rowIndexEvent = (slice == null ? null : slice.isa.objj_msgSend0(slice, "rowIndex")),
        rowTypeEvent = self.isa.objj_msgSend1(self, "rowTypeForRow:", rowIndexEvent),
        insertIndex = rowIndexEvent + 1,
        parentRowIndex = rowTypeEvent === CPRuleEditorRowTypeCompound ? rowIndexEvent : self.isa.objj_msgSend1(self, "parentRowForRow:", rowIndexEvent);
    self.isa.objj_msgSend(self, "insertRowAtIndex:withType:asSubrowOfRow:animate:", insertIndex, type, parentRowIndex, YES);
}
,["void","id","unsigned int"]), new objj_method(sel_getUid("_insertNewRowAtIndex:ofType:withParentRow:"), function $CPRuleEditor___insertNewRowAtIndex_ofType_withParentRow_(self, _cmd, insertIndex, rowtype, parentRowIndex)
{
    var row = ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "rowClass")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init")),
        itemsandvalues = self.isa.objj_msgSend2(self, "_getItemsAndValuesToAddForRow:ofType:", insertIndex, rowtype),
        newitems = (itemsandvalues == null ? null : itemsandvalues.isa.objj_msgSend1(itemsandvalues, "valueForKey:", "item")),
        newvalues = (itemsandvalues == null ? null : itemsandvalues.isa.objj_msgSend1(itemsandvalues, "valueForKey:", "value"));
    (row == null ? null : row.isa.objj_msgSend2(row, "setValue:forKey:", newitems, self._itemsKeyPath));
    (row == null ? null : row.isa.objj_msgSend2(row, "setValue:forKey:", newvalues, self._valuesKeyPath));
    (row == null ? null : row.isa.objj_msgSend2(row, "setValue:forKey:", rowtype, self._typeKeyPath));
    (row == null ? null : row.isa.objj_msgSend2(row, "setValue:forKey:", CPMutableArray.isa.objj_msgSend0(CPMutableArray, "array"), self._subrowsArrayKeyPath));
    var subrowsObjects;
    if (parentRowIndex === -1 || self.isa.objj_msgSend0(self, "_applicableNestingMode") === CPRuleEditorNestingModeList)
        subrowsObjects = self.isa.objj_msgSend0(self, "_rootRowsArray");
    else
    {
        var parentRowObject = ((___r1 = self.isa.objj_msgSend1(self, "_rowCacheForIndex:", parentRowIndex)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "rowObject"));
        subrowsObjects = self.isa.objj_msgSend1(self, "_subrowObjectsOfObject:", parentRowObject);
    }
    var relInsertIndex = insertIndex - parentRowIndex - 1;
    (subrowsObjects == null ? null : subrowsObjects.isa.objj_msgSend2(subrowsObjects, "insertObject:atIndex:", row, relInsertIndex));
    self.isa.objj_msgSend0(self, "_updatePredicate");
    self.isa.objj_msgSend0(self, "_sendRuleAction");
    self.isa.objj_msgSend0(self, "_postRuleOptionChangedNotification");
    self.isa.objj_msgSend2(self, "_postRowCountChangedNotificationOfType:indexes:", CPRuleEditorRowsDidChangeNotification, CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", insertIndex));
    return row;
    var ___r1, ___r2;
}
,["id","int","CPRuleEditorRowType","CPInteger"]), new objj_method(sel_getUid("_startObservingRowObjectsRecursively:"), function $CPRuleEditor___startObservingRowObjectsRecursively_(self, _cmd, rowObjects)
{
    ((___r1 = self._boundArrayOwner), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:forKeyPath:options:context:", self, self._boundArrayKeyPath, CPKeyValueObservingOptionOld | CPKeyValueObservingOptionNew, boundArrayContext));
    var count = (rowObjects == null ? null : rowObjects.isa.objj_msgSend0(rowObjects, "count"));
    for (var i = 0; i < count; i++)
    {
        var rowObject = (rowObjects == null ? null : rowObjects.isa.objj_msgSend1(rowObjects, "objectAtIndex:", i));
        (rowObject == null ? null : rowObject.isa.objj_msgSend(rowObject, "addObserver:forKeyPath:options:context:", self, self._itemsKeyPath, CPKeyValueObservingOptionOld | CPKeyValueObservingOptionNew, itemsContext));
        (rowObject == null ? null : rowObject.isa.objj_msgSend(rowObject, "addObserver:forKeyPath:options:context:", self, self._valuesKeyPath, CPKeyValueObservingOptionOld | CPKeyValueObservingOptionNew, valuesContext));
        (rowObject == null ? null : rowObject.isa.objj_msgSend(rowObject, "addObserver:forKeyPath:options:context:", self, self._subrowsArrayKeyPath, CPKeyValueObservingOptionOld | CPKeyValueObservingOptionNew, subrowsContext));
        var subrows = self.isa.objj_msgSend1(self, "_subrowObjectsOfObject:", rowObject);
        if ((subrows == null ? null : subrows.isa.objj_msgSend0(subrows, "count")) > 0)
            self.isa.objj_msgSend1(self, "_startObservingRowObjectsRecursively:", subrows);
    }
    var ___r1;
}
,["void","CPArray"]), new objj_method(sel_getUid("_stopObservingRowObjectsRecursively:"), function $CPRuleEditor___stopObservingRowObjectsRecursively_(self, _cmd, rowObjects)
{
    ((___r1 = self._boundArrayOwner), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "removeObserver:forKeyPath:", self, self._boundArrayKeyPath));
    var count = (rowObjects == null ? null : rowObjects.isa.objj_msgSend0(rowObjects, "count"));
    for (var i = 0; i < count; i++)
    {
        var rowObject = (rowObjects == null ? null : rowObjects.isa.objj_msgSend1(rowObjects, "objectAtIndex:", i));
        (rowObject == null ? null : rowObject.isa.objj_msgSend2(rowObject, "removeObserver:forKeyPath:", self, self._itemsKeyPath));
        (rowObject == null ? null : rowObject.isa.objj_msgSend2(rowObject, "removeObserver:forKeyPath:", self, self._valuesKeyPath));
        (rowObject == null ? null : rowObject.isa.objj_msgSend2(rowObject, "removeObserver:forKeyPath:", self, self._subrowsArrayKeyPath));
        var subrows = (rowObject == null ? null : rowObject.isa.objj_msgSend1(rowObject, "valueForKey:", self._subrowsArrayKeyPath));
        if ((subrows == null ? null : subrows.isa.objj_msgSend0(subrows, "count")) > 0)
            self.isa.objj_msgSend1(self, "_stopObservingRowObjectsRecursively:", subrows);
    }
    var ___r1;
}
,["void","CPArray"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $CPRuleEditor__observeValueForKeyPath_ofObject_change_context_(self, _cmd, keypath, object, change, context)
{
    var changeKind = (change == null ? null : change.isa.objj_msgSend1(change, "objectForKey:", CPKeyValueChangeKindKey)),
        changeNewValue = (change == null ? null : change.isa.objj_msgSend1(change, "objectForKey:", CPKeyValueChangeNewKey)),
        changeOldValue = (change == null ? null : change.isa.objj_msgSend1(change, "objectForKey:", CPKeyValueChangeOldKey)),
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
            newRows = self.isa.objj_msgSend1(self, "_subrowObjectsOfObject:", object);
            oldRows = CPArray.isa.objj_msgSend1(CPArray, "arrayWithArray:", newRows);
            (oldRows == null ? null : oldRows.isa.objj_msgSend1(oldRows, "removeObjectsInArray:", changeNewValue));
        }
        self.isa.objj_msgSend3(self, "_changedRowArray:withOldRowArray:forParent:", newRows, oldRows, object);
        self.isa.objj_msgSend1(self, "_reconfigureSubviewsAnimate:", self.isa.objj_msgSend0(self, "_wantsRowAnimations"));
    }
}
,["void","CPString","id","CPDictionary","void"]), new objj_method(sel_getUid("_changedItem:toItem:inRow:atCriteriaIndex:"), function $CPRuleEditor___changedItem_toItem_inRow_atCriteriaIndex_(self, _cmd, fromItem, toItem, aRow, fromItemIndex)
{
    var criteria = self.isa.objj_msgSend1(self, "criteriaForRow:", aRow),
        displayValues = self.isa.objj_msgSend1(self, "displayValuesForRow:", aRow),
        rowType = self.isa.objj_msgSend1(self, "rowTypeForRow:", aRow),
        anItem = toItem,
        items = (criteria == null ? null : criteria.isa.objj_msgSend1(criteria, "subarrayWithRange:", CPMakeRange(0, fromItemIndex))),
        values = (displayValues == null ? null : displayValues.isa.objj_msgSend1(displayValues, "subarrayWithRange:", CPMakeRange(0, fromItemIndex)));
    self._lastRow = aRow;
    while (YES)
    {
        (items == null ? null : items.isa.objj_msgSend1(items, "addObject:", anItem));
        var value = self.isa.objj_msgSend2(self, "_queryValueForItem:inRow:", anItem, aRow);
        (values == null ? null : values.isa.objj_msgSend1(values, "addObject:", value));
        if (!self.isa.objj_msgSend2(self, "_queryNumberOfChildrenOfItem:withRowType:", anItem, rowType))
            break;
        anItem = self.isa.objj_msgSend3(self, "_queryChild:ofItem:withRowType:", 0, anItem, rowType);
    }
    var object = ((___r1 = self.isa.objj_msgSend1(self, "_rowCacheForIndex:", aRow)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "rowObject"));
    (object == null ? null : object.isa.objj_msgSend2(object, "setValue:forKey:", items, self._itemsKeyPath));
    (object == null ? null : object.isa.objj_msgSend2(object, "setValue:forKey:", values, self._valuesKeyPath));
    var slice = ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", aRow));
    (slice == null ? null : slice.isa.objj_msgSend0(slice, "_reconfigureSubviews"));
    self.isa.objj_msgSend0(self, "_updatePredicate");
    self.isa.objj_msgSend0(self, "_sendRuleAction");
    self.isa.objj_msgSend0(self, "_postRuleOptionChangedNotification");
    var ___r1;
}
,["void","id","id","CPInteger","int"]), new objj_method(sel_getUid("_changedRowArray:withOldRowArray:forParent:"), function $CPRuleEditor___changedRowArray_withOldRowArray_forParent_(self, _cmd, newRows, oldRows, parentRowObject)
{
    var newRowCount = (newRows == null ? null : newRows.isa.objj_msgSend0(newRows, "count")),
        oldRowCount = (oldRows == null ? null : oldRows.isa.objj_msgSend0(oldRows, "count")),
        deltaCount = newRowCount - oldRowCount,
        minusCount = MIN(newRowCount, oldRowCount),
        maxCount = MAX(newRowCount, oldRowCount),
        insertCacheIndexes = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet"),
        newCaches = CPArray.isa.objj_msgSend0(CPArray, "array"),
        parentCacheIndentation,
        parentCacheIndex = self.isa.objj_msgSend1(self, "_rowIndexForRowObject:", parentRowObject),
        newRowCacheIndex = 0,
        changeStartIndex = 0;
    self.isa.objj_msgSend1(self, "_stopObservingRowObjectsRecursively:", oldRows);
    self.isa.objj_msgSend1(self, "_startObservingRowObjectsRecursively:", newRows);
    if (parentCacheIndex === -1)
        parentCacheIndentation = -1;
    else
        parentCacheIndentation = ((___r1 = self.isa.objj_msgSend1(self, "_rowCacheForIndex:", parentCacheIndex)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "indentation"));
    for (; newRowCacheIndex < newRowCount; newRowCacheIndex++)
    {
        var newCacheGlobalIndex = parentCacheIndex + 1 + newRowCacheIndex,
            obj = (newRows == null ? null : newRows.isa.objj_msgSend1(newRows, "objectAtIndex:", newRowCacheIndex)),
            newRowType = (obj == null ? null : obj.isa.objj_msgSend1(obj, "valueForKey:", self._typeKeyPath)),
            cache = ((___r1 = (_CPRuleEditorCache == null ? null : _CPRuleEditorCache.isa.objj_msgSend0(_CPRuleEditorCache, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        (cache == null ? null : cache.isa.objj_msgSend1(cache, "setRowObject:", obj));
        (cache == null ? null : cache.isa.objj_msgSend1(cache, "setRowIndex:", newCacheGlobalIndex));
        (cache == null ? null : cache.isa.objj_msgSend1(cache, "setIndentation:", parentCacheIndentation + 1));
        (insertCacheIndexes == null ? null : insertCacheIndexes.isa.objj_msgSend1(insertCacheIndexes, "addIndex:", newCacheGlobalIndex));
        (newCaches == null ? null : newCaches.isa.objj_msgSend1(newCaches, "addObject:", cache));
    }
    ((___r1 = self._rowCache), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectsInRange:", CPMakeRange(parentCacheIndex + 1, (oldRows == null ? null : oldRows.isa.objj_msgSend0(oldRows, "count")))));
    ((___r1 = self._rowCache), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "insertObjects:atIndexes:", newCaches, insertCacheIndexes));
    for (; changeStartIndex < minusCount; changeStartIndex++)
    {
        var oldrow = (oldRows == null ? null : oldRows.isa.objj_msgSend1(oldRows, "objectAtIndex:", changeStartIndex)),
            newrow = (newRows == null ? null : newRows.isa.objj_msgSend1(newRows, "objectAtIndex:", changeStartIndex));
        if (newrow !== oldrow)
            break;
    }
    var replaceCount = deltaCount === 0 ? maxCount : maxCount - minusCount,
        startIndex = parentCacheIndex + changeStartIndex + 1;
    if (deltaCount <= 0)
    {
        var removeIndexes = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(startIndex, replaceCount)),
            removeSlices = ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectsAtIndexes:", removeIndexes));
        (removeSlices == null ? null : removeSlices.isa.objj_msgSend1(removeSlices, "makeObjectsPerformSelector:", sel_getUid("removeFromSuperview")));
        ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectsAtIndexes:", removeIndexes));
    }
    if (deltaCount >= 0)
    {
        var newIndentation = parentCacheIndentation + 1,
            newIndex = startIndex;
        for (; newIndex < startIndex + replaceCount; newIndex++)
        {
            var newslice = self.isa.objj_msgSend0(self, "_newSlice"),
                rowType = self.isa.objj_msgSend1(self, "rowTypeForRow:", newIndex);
            (newslice == null ? null : newslice.isa.objj_msgSend1(newslice, "setRowIndex:", newIndex));
            (newslice == null ? null : newslice.isa.objj_msgSend1(newslice, "setIndentation:", newIndentation));
            (newslice == null ? null : newslice.isa.objj_msgSend1(newslice, "_setRowType:", rowType));
            (newslice == null ? null : newslice.isa.objj_msgSend1(newslice, "_configurePlusButtonByRowType:", CPRuleEditorRowTypeSimple));
            ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "insertObject:atIndex:", newslice, newIndex));
        }
    }
    var emptyArray = CPArray.isa.objj_msgSend0(CPArray, "array"),
        count = (oldRows == null ? null : oldRows.isa.objj_msgSend0(oldRows, "count")),
        n;
    for (n = 0; n < count; n++)
    {
        var oldRow = (oldRows == null ? null : oldRows.isa.objj_msgSend1(oldRows, "objectAtIndex:", n)),
            subOldRows = self.isa.objj_msgSend1(self, "_subrowObjectsOfObject:", oldRow);
        if ((subOldRows == null ? null : subOldRows.isa.objj_msgSend0(subOldRows, "count")) > 0)
            self.isa.objj_msgSend3(self, "_changedRowArray:withOldRowArray:forParent:", emptyArray, subOldRows, oldRow);
    }
    count = (newRows == null ? null : newRows.isa.objj_msgSend0(newRows, "count"));
    for (n = 0; n < count; n++)
    {
        var newRow = (newRows == null ? null : newRows.isa.objj_msgSend1(newRows, "objectAtIndex:", n)),
            subnewRows = self.isa.objj_msgSend1(self, "_subrowObjectsOfObject:", newRow);
        if ((subnewRows == null ? null : subnewRows.isa.objj_msgSend0(subnewRows, "count")) > 0)
            self.isa.objj_msgSend3(self, "_changedRowArray:withOldRowArray:forParent:", subnewRows, emptyArray, newRow);
    }
    var ___r1;
}
,["void","CPArray","CPArray","id"]), new objj_method(sel_getUid("bind:toObject:withKeyPath:options:"), function $CPRuleEditor__bind_toObject_withKeyPath_options_(self, _cmd, aBinding, observableController, aKeyPath, options)
{
    if ((aBinding == null ? null : aBinding.isa.objj_msgSend1(aBinding, "isEqualToString:", "rows")))
    {
        self.isa.objj_msgSend1(self, "unbind:", aBinding);
        self.isa.objj_msgSend3(self, "_setBoundDataSource:withKeyPath:options:", observableController, aKeyPath, options);
        ((___r1 = self._rowCache), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeAllObjects"));
        ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeAllObjects"));
        var newRows = CPArray.isa.objj_msgSend0(CPArray, "array"),
            oldRows = self.isa.objj_msgSend0(self, "_rootRowsArray");
        self.isa.objj_msgSend3(self, "_changedRowArray:withOldRowArray:forParent:", newRows, oldRows, self._boundArrayOwner);
    }
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRuleEditor").super_class }, "bind:toObject:withKeyPath:options:", aBinding, observableController, aKeyPath, options);
    var ___r1;
}
,["void","CPString","id","CPString","CPDictionary"]), new objj_method(sel_getUid("unbind:"), function $CPRuleEditor__unbind_(self, _cmd, object)
{
    self._rowClass = (_CPRuleEditorRowObject == null ? null : _CPRuleEditorRowObject.isa.objj_msgSend0(_CPRuleEditorRowObject, "class"));
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRuleEditor").super_class }, "unbind:", object);
}
,["void","CPString"]), new objj_method(sel_getUid("_setBoundDataSource:withKeyPath:options:"), function $CPRuleEditor___setBoundDataSource_withKeyPath_options_(self, _cmd, datasource, keyPath, options)
{
    if ((datasource == null ? null : datasource.isa.objj_msgSend1(datasource, "respondsToSelector:", sel_getUid("objectClass"))))
        self._rowClass = (datasource == null ? null : datasource.isa.objj_msgSend0(datasource, "objectClass"));
    self._boundArrayKeyPath = keyPath;
    self._boundArrayOwner = datasource;
    ((___r1 = self._boundArrayOwner), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:forKeyPath:options:context:", self, self._boundArrayKeyPath, CPKeyValueObservingOptionOld | CPKeyValueObservingOptionNew, boundArrayContext));
    var ___r1;
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
        if (!self.isa.objj_msgSend0(self, "_delegateRespondsToRuleEditorPredicatePartsForCriterionWithDisplayValueInRow"))
            return;
        self._delegateWantsValidation = NO;
    }
    var subpredicates = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "array"),
        subindexes = self.isa.objj_msgSend1(self, "subrowIndexesForRow:", -1),
        current_index = (subindexes == null ? null : subindexes.isa.objj_msgSend0(subindexes, "firstIndex"));
    while (current_index !== CPNotFound)
    {
        var subpredicate = self.isa.objj_msgSend1(self, "predicateForRow:", current_index);
        if (subpredicate !== nil)
            (subpredicates == null ? null : subpredicates.isa.objj_msgSend1(subpredicates, "addObject:", subpredicate));
        current_index = (subindexes == null ? null : subindexes.isa.objj_msgSend1(subindexes, "indexGreaterThanIndex:", current_index));
    }
    var new_predicate = ((___r1 = (CPCompoundPredicate == null ? null : CPCompoundPredicate.isa.objj_msgSend0(CPCompoundPredicate, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithType:subpredicates:", CPOrPredicateType, subpredicates));
    self.isa.objj_msgSend1(self, "_setPredicate:", new_predicate);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_newSlice"), function $CPRuleEditor___newSlice(self, _cmd)
{
    var sliceRect = CGRectMake(0, 0, CGRectGetWidth(self.isa.objj_msgSend0(self, "frame")), 0),
        slice = self.isa.objj_msgSend2(self, "_createNewSliceWithFrame:ruleEditorView:", sliceRect, self);
    return slice;
}
,["_CPRuleEditorViewSliceRow"]), new objj_method(sel_getUid("_createNewSliceWithFrame:ruleEditorView:"), function $CPRuleEditor___createNewSliceWithFrame_ruleEditorView_(self, _cmd, frame, editor)
{
    return ((___r1 = _CPRuleEditorViewSliceRow.isa.objj_msgSend0(_CPRuleEditorViewSliceRow, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithFrame:ruleEditorView:", frame, editor));
    var ___r1;
}
,["_CPRuleEditorViewSliceRow","CGRect","CPRuleEditor"]), new objj_method(sel_getUid("_reconfigureSubviewsAnimate:"), function $CPRuleEditor___reconfigureSubviewsAnimate_(self, _cmd, animate)
{
    var viewAnimations = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "array"),
        added_slices = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "array"),
        count = ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    self.isa.objj_msgSend0(self, "_updateSliceRows");
    if (((___r1 = self.isa.objj_msgSend0(self, "superview")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isKindOfClass:", CPClipView.isa.objj_msgSend0(CPClipView, "class"))))
        self.isa.objj_msgSend1(self, "setFrameSize:", CGSizeMake(CGRectGetWidth(self.isa.objj_msgSend0(self, "frame")), count * self._sliceHeight));
    for (var i = 0; i < count; i++)
    {
        var aslice = ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", i)),
            targetRect = (aslice == null ? null : aslice.isa.objj_msgSend0(aslice, "_animationTargetRect")),
            startRect = (aslice == null ? null : aslice.isa.objj_msgSend0(aslice, "frame")),
            startIndex = (aslice == null ? null : aslice.isa.objj_msgSend0(aslice, "rowIndex")) - 1;
        if ((aslice == null ? null : aslice.isa.objj_msgSend0(aslice, "superview")) === nil)
        {
            startRect = CGRectMake(0, startIndex * self._sliceHeight, CGRectGetWidth(startRect), self._sliceHeight);
            (aslice == null ? null : aslice.isa.objj_msgSend0(aslice, "_reconfigureSubviews"));
            (added_slices == null ? null : added_slices.isa.objj_msgSend1(added_slices, "addObject:", aslice));
        }
        if (animate)
        {
            var animation = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
            (animation == null ? null : animation.isa.objj_msgSend2(animation, "setObject:forKey:", aslice, CPViewAnimationTargetKey));
            (animation == null ? null : animation.isa.objj_msgSend2(animation, "setObject:forKey:", startRect, CPViewAnimationStartFrameKey));
            (animation == null ? null : animation.isa.objj_msgSend2(animation, "setObject:forKey:", targetRect, CPViewAnimationEndFrameKey));
            (viewAnimations == null ? null : viewAnimations.isa.objj_msgSend2(viewAnimations, "insertObject:atIndex:", animation, 0));
        }
        else
            (aslice == null ? null : aslice.isa.objj_msgSend1(aslice, "setFrame:", targetRect));
    }
    var addcount = (added_slices == null ? null : added_slices.isa.objj_msgSend0(added_slices, "count"));
    for (var i = 0; i < addcount; i++)
        ((___r1 = self._slicesHolder), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "addSubview:positioned:relativeTo:", added_slices[i], CPWindowBelow, nil));
    if (animate)
    {
        ((___r1 = self._currentAnimation), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setViewAnimations:", viewAnimations));
        ((___r1 = self._currentAnimation), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "startAnimation"));
    }
    self._lastRow = self.isa.objj_msgSend0(self, "numberOfRows") - 1;
    if (self._lastRow === -1)
        self._nestingModeDidChange = NO;
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeObjectsPerformSelector:", sel_getUid("_updateButtonVisibilities")));
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("animationDidEnd:"), function $CPRuleEditor__animationDidEnd_(self, _cmd, animation)
{
}
,["void","CPViewAnimation"]), new objj_method(sel_getUid("_updateSliceRows"), function $CPRuleEditor___updateSliceRows(self, _cmd)
{
    var width = self.isa.objj_msgSend0(self, "frame").size.width,
        count = ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    for (var i = 0; i < count; i++)
    {
        var slice = ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", i)),
            targetRect = CGRectMake(0, i * self._sliceHeight, width, self._sliceHeight);
        (slice == null ? null : slice.isa.objj_msgSend1(slice, "setRowIndex:", i));
        (slice == null ? null : slice.isa.objj_msgSend1(slice, "_setAnimationTargetRect:", targetRect));
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_backgroundColors"), function $CPRuleEditor___backgroundColors(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "alternating-row-colors");
}
,["CPArray"]), new objj_method(sel_getUid("_selectedRowColor"), function $CPRuleEditor___selectedRowColor(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "selected-color");
}
,["CPColor"]), new objj_method(sel_getUid("_sliceTopBorderColor"), function $CPRuleEditor___sliceTopBorderColor(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "slice-top-border-color");
}
,["CPColor"]), new objj_method(sel_getUid("_sliceBottomBorderColor"), function $CPRuleEditor___sliceBottomBorderColor(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "slice-bottom-border-color");
}
,["CPColor"]), new objj_method(sel_getUid("_sliceLastBottomBorderColor"), function $CPRuleEditor___sliceLastBottomBorderColor(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "slice-last-bottom-border-color");
}
,["CPColor"]), new objj_method(sel_getUid("font"), function $CPRuleEditor__font(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "font");
}
,["CPFont"]), new objj_method(sel_getUid("_addImage"), function $CPRuleEditor___addImage(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "add-image");
}
,["CPImage"]), new objj_method(sel_getUid("_removeImage"), function $CPRuleEditor___removeImage(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "remove-image");
}
,["CPImage"]), new objj_method(sel_getUid("_toolTipForAddCompoundRowButton"), function $CPRuleEditor___toolTipForAddCompoundRowButton(self, _cmd)
{
    return ((___r1 = self._standardLocalizer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "localizedStringForString:", "Add compound row"));
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("_toolTipForAddSimpleRowButton"), function $CPRuleEditor___toolTipForAddSimpleRowButton(self, _cmd)
{
    return ((___r1 = self._standardLocalizer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "localizedStringForString:", "Add row"));
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("_toolTipForDeleteRowButton"), function $CPRuleEditor___toolTipForDeleteRowButton(self, _cmd)
{
    return ((___r1 = self._standardLocalizer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "localizedStringForString:", "Delete row"));
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("_updateSliceIndentations"), function $CPRuleEditor___updateSliceIndentations(self, _cmd)
{
    self.isa.objj_msgSend3(self, "_updateSliceIndentationAtIndex:toIndentation:withIndexSet:", 0, 0, self.isa.objj_msgSend1(self, "subrowIndexesForRow:", 0));
}
,["void"]), new objj_method(sel_getUid("_updateSliceIndentationAtIndex:toIndentation:withIndexSet:"), function $CPRuleEditor___updateSliceIndentationAtIndex_toIndentation_withIndexSet_(self, _cmd, index, indentation, indexes)
{
    var current_index = (indexes == null ? null : indexes.isa.objj_msgSend0(indexes, "firstIndex"));
    while (current_index !== CPNotFound)
    {
        var subindexes = self.isa.objj_msgSend1(self, "subrowIndexesForRow:", index);
        self.isa.objj_msgSend3(self, "_updateSliceIndentationAtIndex:toIndentation:withIndexSet:", current_index, indentation + 1, subindexes);
        current_index = (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "indexGreaterThanIndex:", current_index));
    }
    ((___r1 = ((___r2 = self._slices), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "objectAtIndex:", index))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setIndentation:", indentation));
    var ___r1, ___r2;
}
,["void","int","int","id"]), new objj_method(sel_getUid("_selectedSlices"), function $CPRuleEditor___selectedSlices(self, _cmd)
{
    var _selectedSlices = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "array"),
        count = ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")),
        i;
    for (i = 0; i < count; i++)
    {
        var slice = self._slices[i];
        if ((slice == null ? null : slice.isa.objj_msgSend0(slice, "_isSelected")))
            (_selectedSlices == null ? null : _selectedSlices.isa.objj_msgSend1(_selectedSlices, "addObject:", slice));
    }
    return _selectedSlices;
    var ___r1;
}
,["CPArray"]), new objj_method(sel_getUid("_lastSelectedSliceIndex"), function $CPRuleEditor___lastSelectedSliceIndex(self, _cmd)
{
    var lastIndex = -1,
        count = ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")),
        i;
    for (i = 0; i < count; i++)
    {
        var slice = self._slices[i];
        if ((slice == null ? null : slice.isa.objj_msgSend0(slice, "_isLastSelected")))
            return (slice == null ? null : slice.isa.objj_msgSend0(slice, "rowIndex"));
    }
    return CPNotFound;
    var ___r1;
}
,["int"]), new objj_method(sel_getUid("_mouseUpOnSlice:withEvent:"), function $CPRuleEditor___mouseUpOnSlice_withEvent_(self, _cmd, slice, event)
{
    if ((slice == null ? null : slice.isa.objj_msgSend0(slice, "_rowType")) !== CPRuleEditorRowTypeSimple)
        return;
    var modifierFlags = (event == null ? null : event.isa.objj_msgSend0(event, "modifierFlags")),
        extend = modifierFlags & CPCommandKeyMask || modifierFlags & CPShiftKeyMask,
        rowIndexes = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", (slice == null ? null : slice.isa.objj_msgSend0(slice, "rowIndex")));
    self.isa.objj_msgSend2(self, "selectRowIndexes:byExtendingSelection:", rowIndexes, extend);
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
    var count = ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    while (count--)
    {
        var slice = self._slices[count];
        (slice == null ? null : slice.isa.objj_msgSend1(slice, "_setSelected:", YES));
        (slice == null ? null : slice.isa.objj_msgSend1(slice, "setNeedsDisplay:", YES));
    }
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("_deselectAll"), function $CPRuleEditor___deselectAll(self, _cmd)
{
    var count = ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    while (count--)
    {
        var slice = self._slices[count];
        (slice == null ? null : slice.isa.objj_msgSend1(slice, "_setSelected:", NO));
        (slice == null ? null : slice.isa.objj_msgSend1(slice, "_setLastSelected:", NO));
        (slice == null ? null : slice.isa.objj_msgSend1(slice, "setNeedsDisplay:", YES));
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_queryNumberOfChildrenOfItem:withRowType:"), function $CPRuleEditor___queryNumberOfChildrenOfItem_withRowType_(self, _cmd, item, type)
{
    return ((___r1 = self._ruleDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "ruleEditor:numberOfChildrenForCriterion:withRowType:", self, item, type));
    var ___r1;
}
,["int","id","CPRuleEditorRowType"]), new objj_method(sel_getUid("_queryChild:ofItem:withRowType:"), function $CPRuleEditor___queryChild_ofItem_withRowType_(self, _cmd, childIndex, item, type)
{
    return ((___r1 = self._ruleDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "ruleEditor:child:forCriterion:withRowType:", self, childIndex, item, type));
    var ___r1;
}
,["id","int","id","CPRuleEditorRowType"]), new objj_method(sel_getUid("_queryValueForItem:inRow:"), function $CPRuleEditor___queryValueForItem_inRow_(self, _cmd, item, row)
{
    return ((___r1 = self._ruleDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "ruleEditor:displayValueForCriterion:inRow:", self, item, row));
    var ___r1;
}
,["id","id","CPInteger"]), new objj_method(sel_getUid("_lastRow"), function $CPRuleEditor___lastRow(self, _cmd)
{
    return self._lastRow;
}
,["int"]), new objj_method(sel_getUid("_countOfRowsStartingAtObject:"), function $CPRuleEditor___countOfRowsStartingAtObject_(self, _cmd, object)
{
    var index = self.isa.objj_msgSend1(self, "_rowIndexForRowObject:", object);
    return self.isa.objj_msgSend0(self, "numberOfRows") - index;
}
,["int","id"]), new objj_method(sel_getUid("_setAlignmentGridWidth:"), function $CPRuleEditor___setAlignmentGridWidth_(self, _cmd, width)
{
    self._alignmentGridWidth = width;
}
,["void","float"]), new objj_method(sel_getUid("_validateItem:value:inRow:"), function $CPRuleEditor___validateItem_value_inRow_(self, _cmd, item, value, row)
{
    return self.isa.objj_msgSend3(self, "_queryCanSelectItem:displayValue:inRow:", item, value, row);
}
,["BOOL","id","id","CPInteger"]), new objj_method(sel_getUid("_queryCanSelectItem:displayValue:inRow:"), function $CPRuleEditor___queryCanSelectItem_displayValue_inRow_(self, _cmd, item, value, row)
{
    return YES;
}
,["BOOL","id","id","CPInteger"]), new objj_method(sel_getUid("_windowChangedKeyState"), function $CPRuleEditor___windowChangedKeyState(self, _cmd)
{
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void"]), new objj_method(sel_getUid("setNeedsDisplay:"), function $CPRuleEditor__setNeedsDisplay_(self, _cmd, flag)
{
    ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("setNeedsDisplay:"), flag));
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRuleEditor").super_class }, "setNeedsDisplay:", flag);
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("setFrameSize:"), function $CPRuleEditor__setFrameSize_(self, _cmd, size)
{
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    if (CGRectGetWidth(self.isa.objj_msgSend0(self, "frame")) !== size.width)
        ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeObjectsPerformSelector:", sel_getUid("setNeedsLayout")));
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRuleEditor").super_class }, "setFrameSize:", size);
    var ___r1;
}
,["void","CGSize"]), new objj_method(sel_getUid("_selectedSliceIndices"), function $CPRuleEditor___selectedSliceIndices(self, _cmd)
{
    var selectedIndices = CPMutableIndexSet.isa.objj_msgSend0(CPMutableIndexSet, "indexSet"),
        count = ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")),
        i;
    for (i = 0; i < count; i++)
    {
        var slice = self._slices[i];
        if ((slice == null ? null : slice.isa.objj_msgSend0(slice, "_isSelected")))
            (selectedIndices == null ? null : selectedIndices.isa.objj_msgSend1(selectedIndices, "addIndex:", (slice == null ? null : slice.isa.objj_msgSend0(slice, "rowIndex"))));
    }
    return selectedIndices;
    var ___r1;
}
,["CPIndexSet"]), new objj_method(sel_getUid("mouseDragged:"), function $CPRuleEditor__mouseDragged_(self, _cmd, event)
{
    if (!self._editable)
        return;
    var point = self.isa.objj_msgSend2(self, "convertPoint:fromView:", (event == null ? null : event.isa.objj_msgSend0(event, "locationInWindow")), nil),
        view = ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", FLOOR(point.y / self._sliceHeight)));
    if (self.isa.objj_msgSend1(self, "_dragShouldBeginFromMouseDown:", view))
        self.isa.objj_msgSend2(self, "_performDragForSlice:withEvent:", view, event);
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("_dragShouldBeginFromMouseDown:"), function $CPRuleEditor___dragShouldBeginFromMouseDown_(self, _cmd, view)
{
    return (self.isa.objj_msgSend0(self, "nestingMode") === CPRuleEditorNestingModeList || (view == null ? null : view.isa.objj_msgSend0(view, "rowIndex")) !== 0) && self._editable && (view == null ? null : view.isa.objj_msgSend1(view, "isKindOfClass:", _CPRuleEditorViewSliceRow.isa.objj_msgSend0(_CPRuleEditorViewSliceRow, "class"))) && self._draggingRows === nil;
}
,["BOOL","CPView"]), new objj_method(sel_getUid("_performDragForSlice:withEvent:"), function $CPRuleEditor___performDragForSlice_withEvent_(self, _cmd, slice, event)
{
    var dragPoint,
        mainRowIndex = (slice == null ? null : slice.isa.objj_msgSend0(slice, "rowIndex")),
        draggingRows = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", mainRowIndex),
        selected_indices = self.isa.objj_msgSend0(self, "_selectedSliceIndices"),
        pasteboard = CPPasteboard.isa.objj_msgSend1(CPPasteboard, "pasteboardWithName:", CPDragPboard);
    (pasteboard == null ? null : pasteboard.isa.objj_msgSend2(pasteboard, "declareTypes:owner:", CPArray.isa.objj_msgSend2(CPArray, "arrayWithObjects:", CPRuleEditorItemPBoardType, nil), self));
    if ((selected_indices == null ? null : selected_indices.isa.objj_msgSend1(selected_indices, "containsIndex:", mainRowIndex)))
        (draggingRows == null ? null : draggingRows.isa.objj_msgSend1(draggingRows, "addIndexes:", selected_indices));
    self._draggingRows = self.isa.objj_msgSend1(self, "_includeSubslicesForSlicesAtIndexes:", draggingRows);
    var firstIndex = ((___r1 = self._draggingRows), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstIndex")),
        firstSlice = ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", firstIndex)),
        dragview = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", (firstSlice == null ? null : firstSlice.isa.objj_msgSend0(firstSlice, "frame"))));
    var html = firstSlice._DOMElement.innerHTML;
    dragview._DOMElement.innerHTML = (html == null ? null : html.isa.objj_msgSend0(html, "copy"));
    (dragview == null ? null : dragview.isa.objj_msgSend1(dragview, "setBackgroundColor:", (firstSlice == null ? null : firstSlice.isa.objj_msgSend0(firstSlice, "backgroundColor"))));
    (dragview == null ? null : dragview.isa.objj_msgSend1(dragview, "setAlphaValue:", 0.7));
    dragPoint = CGPointMake(0, firstIndex * self._sliceHeight);
    self.isa.objj_msgSend(self, "dragView:at:offset:event:pasteboard:source:slideBack:", dragview, dragPoint, CGSizeMake(0, self._sliceHeight), event, pasteboard, self, YES);
    return YES;
    var ___r1;
}
,["BOOL","id","CPEvent"]), new objj_method(sel_getUid("draggingEntered:"), function $CPRuleEditor__draggingEntered_(self, _cmd, sender)
{
    if ((sender == null ? null : sender.isa.objj_msgSend0(sender, "draggingSource")) === self)
    {
        self.isa.objj_msgSend0(self, "_clearDropLine");
        return CPDragOperationMove;
    }
    return CPDragOperationNone;
}
,["CPDragOperation","id"]), new objj_method(sel_getUid("draggingExited:"), function $CPRuleEditor__draggingExited_(self, _cmd, sender)
{
    self.isa.objj_msgSend0(self, "_clearDropLine");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void","id"]), new objj_method(sel_getUid("_clearDropLine"), function $CPRuleEditor___clearDropLine(self, _cmd)
{
    ((___r1 = self._dropLineView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAlphaValue:", 0));
    if (self._subviewIndexOfDropLine !== CPNotFound && self._subviewIndexOfDropLine < self._lastRow)
    {
        var previousBelowSlice = ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", self._subviewIndexOfDropLine));
        (previousBelowSlice == null ? null : previousBelowSlice.isa.objj_msgSend1(previousBelowSlice, "setFrameOrigin:", CGPointMake(0, (previousBelowSlice == null ? null : previousBelowSlice.isa.objj_msgSend0(previousBelowSlice, "rowIndex")) * self._sliceHeight)));
    }
    self._subviewIndexOfDropLine = CPNotFound;
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("draggingUpdated:"), function $CPRuleEditor__draggingUpdated_(self, _cmd, sender)
{
    var point = self.isa.objj_msgSend2(self, "convertPoint:fromView:", (sender == null ? null : sender.isa.objj_msgSend0(sender, "draggingLocation")), nil),
        y = point.y + self._sliceHeight / 2,
        indexOfDropLine = FLOOR(y / self._sliceHeight),
        numberOfRows = self.isa.objj_msgSend0(self, "numberOfRows");
    if (indexOfDropLine < 0 || indexOfDropLine > numberOfRows || indexOfDropLine >= ((___r1 = self._draggingRows), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstIndex")) && indexOfDropLine <= ((___r1 = self._draggingRows), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lastIndex")) + 1)
    {
        if (self._subviewIndexOfDropLine !== CPNotFound && indexOfDropLine !== self._subviewIndexOfDropLine)
            self.isa.objj_msgSend0(self, "_clearDropLine");
        return CPDragOperationNone;
    }
    if (self._subviewIndexOfDropLine !== indexOfDropLine)
    {
        if (self._subviewIndexOfDropLine !== CPNotFound && self._subviewIndexOfDropLine < numberOfRows)
        {
            var previousBelowSlice = ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", self._subviewIndexOfDropLine));
            (previousBelowSlice == null ? null : previousBelowSlice.isa.objj_msgSend1(previousBelowSlice, "setFrameOrigin:", CGPointMake(0, (previousBelowSlice == null ? null : previousBelowSlice.isa.objj_msgSend0(previousBelowSlice, "rowIndex")) * self._sliceHeight)));
        }
        if (indexOfDropLine <= self._lastRow && indexOfDropLine < numberOfRows)
        {
            var belowSlice = ((___r1 = self._slices), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", indexOfDropLine));
            (belowSlice == null ? null : belowSlice.isa.objj_msgSend1(belowSlice, "setFrameOrigin:", CGPointMake(0, (belowSlice == null ? null : belowSlice.isa.objj_msgSend0(belowSlice, "rowIndex")) * self._sliceHeight + 2)));
        }
        ((___r1 = self._dropLineView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAlphaValue:", 1));
        ((___r1 = self._dropLineView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(CGRectGetMinX(((___r2 = self._dropLineView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame"))), indexOfDropLine * self._sliceHeight)));
        self._subviewIndexOfDropLine = indexOfDropLine;
    }
    return CPDragOperationMove;
    var ___r1, ___r2;
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
    var rowObjects = ((___r1 = self._rowCache), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "rowObject")),
        index = ((___r1 = self._draggingRows), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lastIndex"));
    var parentRowIndex = self.isa.objj_msgSend1(self, "parentRowForRow:", index),
        parentRowObject = parentRowIndex === -1 ? self._boundArrayOwner : ((___r1 = self.isa.objj_msgSend1(self, "_rowCacheForIndex:", parentRowIndex)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "rowObject")),
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
        object = (rowObjects == null ? null : rowObjects.isa.objj_msgSend1(rowObjects, "objectAtIndex:", removeIndex));
        self.isa.objj_msgSend1(self, "removeRowAtIndex:", removeIndex);
        ((___r1 = self.isa.objj_msgSend1(self, "_subrowObjectsOfObject:", parentRowObject)), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "insertObject:atIndex:", object, insertIndex - parentRowIndex - 1));
        index = ((___r1 = self._draggingRows), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexLessThanIndex:", index));
    }
    self.isa.objj_msgSend0(self, "_clearDropLine");
    self._draggingRows = nil;
    return YES;
    var ___r1;
}
,["BOOL","id"]), new objj_method(sel_getUid("_draggingTypes"), function $CPRuleEditor___draggingTypes(self, _cmd)
{
    return CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", CPDragOperationMove);
}
,["CPIndexSet"]), new objj_method(sel_getUid("draggedView:endedAt:operation:"), function $CPRuleEditor__draggedView_endedAt_operation_(self, _cmd, dragView, aPoint, operation)
{
    self._draggingRows = nil;
    self.isa.objj_msgSend0(self, "_updatePredicate");
    self.isa.objj_msgSend0(self, "_sendRuleAction");
    self.isa.objj_msgSend0(self, "_postRuleOptionChangedNotification");
    self.isa.objj_msgSend2(self, "_postRowCountChangedNotificationOfType:indexes:", CPRuleEditorRowsDidChangeNotification, nil);
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
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPRuleEditorRulesDidChangeNotification, self));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_postRowCountChangedNotificationOfType:indexes:"), function $CPRuleEditor___postRowCountChangedNotificationOfType_indexes_(self, _cmd, notificationName, indexes)
{
    var userInfo = indexes === nil ? objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init") : objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", indexes, "indexes");
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "postNotificationName:object:userInfo:", notificationName, self, userInfo));
    var ___r1;
}
,["void","CPString","id"]), new objj_method(sel_getUid("_globalIndexesForSubrowIndexes:ofParentObject:"), function $CPRuleEditor___globalIndexesForSubrowIndexes_ofParentObject_(self, _cmd, indexes, parentRowObject)
{
    var _subrows = self.isa.objj_msgSend1(self, "_subrowObjectsOfObject:", parentRowObject),
        parentRowIndex = self.isa.objj_msgSend1(self, "_rowIndexForRowObject:", parentRowObject),
        globalIndexes = CPMutableIndexSet.isa.objj_msgSend0(CPMutableIndexSet, "indexSet"),
        current_index = (indexes == null ? null : indexes.isa.objj_msgSend0(indexes, "firstIndex")),
        numberOfChildrenOfPreviousBrother = 0;
    while (current_index !== CPNotFound)
    {
        var globalChildIndex = current_index + parentRowIndex + 1 + numberOfChildrenOfPreviousBrother;
        (globalIndexes == null ? null : globalIndexes.isa.objj_msgSend1(globalIndexes, "addIndex:", globalChildIndex));
        if (self.isa.objj_msgSend1(self, "rowTypeForRow:", globalChildIndex) === CPRuleEditorRowTypeCompound)
        {
            var rowObject = ((___r1 = self.isa.objj_msgSend1(self, "_rowCacheForIndex:", current_index)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "rowObject")),
                subrows = self.isa.objj_msgSend1(self, "_subrowObjectsOfObject:", rowObject),
                subIndexes = self.isa.objj_msgSend2(self, "_globalIndexesForSubrowIndexes:ofParentObject:", CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(0, (subrows == null ? null : subrows.isa.objj_msgSend0(subrows, "count")))), rowObject);
            numberOfChildrenOfPreviousBrother = (subIndexes == null ? null : subIndexes.isa.objj_msgSend0(subIndexes, "count"));
        }
        current_index = (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "indexGreaterThanIndex:", current_index));
    }
    return globalIndexes;
    var ___r1;
}
,["CPIndexSet","CPIndexSet","id"]), new objj_method(sel_getUid("_sendRuleAction"), function $CPRuleEditor___sendRuleAction(self, _cmd)
{
    var action = self.isa.objj_msgSend0(self, "action"),
        target = self.isa.objj_msgSend0(self, "target");
    self.isa.objj_msgSend2(self, "sendAction:to:", action, target);
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
    var availItems = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "array"),
        availValues = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "array");
    var criterion = nil,
        value = nil;
    self._lastRow = aRow;
    type = self.isa.objj_msgSend1(self, "rowTypeForRow:", aRow);
    numOfChildren = self.isa.objj_msgSend2(self, "_queryNumberOfChildrenOfItem:withRowType:", parentItem, type);
    var criteria = self.isa.objj_msgSend1(self, "criteriaForRow:", aRow);
    indexofCriterion = (criteria == null ? null : criteria.isa.objj_msgSend1(criteria, "indexOfObject:", criterion));
    if (parentItem !== nil && indexofCriterion !== CPNotFound && indexofCriterion < (criteria == null ? null : criteria.isa.objj_msgSend0(criteria, "count")) - 1)
    {
        var next = indexofCriterion + 1;
        criterion = (criteria == null ? null : criteria.isa.objj_msgSend1(criteria, "objectAtIndex:", next));
        var values = self.isa.objj_msgSend1(self, "displayValuesForRow:", aRow);
        value = (values == null ? null : values.isa.objj_msgSend1(values, "objectAtIndex:", next));
    }
    for (var i = 0; i < numOfChildren; ++i)
    {
        var aChild = self.isa.objj_msgSend3(self, "_queryChild:ofItem:withRowType:", i, parentItem, type),
            availChild = aChild,
            availValue = value;
        if (criterion !== aChild)
            availValue = self.isa.objj_msgSend2(self, "_queryValueForItem:inRow:", aChild, aRow);
        if (!availValue)
            availValue = self.isa.objj_msgSend2(self, "_queryValueForItem:inRow:", availChild, aRow);
        (availItems == null ? null : availItems.isa.objj_msgSend1(availItems, "addObject:", availChild));
        (availValues == null ? null : availValues.isa.objj_msgSend1(availValues, "addObject:", availValue));
    }
    (items == null ? null : items.isa.objj_msgSend1(items, "addObjectsFromArray:", availItems));
    (values == null ? null : values.isa.objj_msgSend1(values, "addObjectsFromArray:", availValues));
}
,["void","id","id","id","CPInteger"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPRuleEditor__defaultThemeClass(self, _cmd)
{
    return "rule-editor";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPRuleEditor__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPNull.isa.objj_msgSend0(CPNull, "null"), "alternating-row-colors", CPNull.isa.objj_msgSend0(CPNull, "null"), "selected-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "slice-top-border-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "slice-bottom-border-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "slice-last-bottom-border-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "font", CPNull.isa.objj_msgSend0(CPNull, "null"), "add-image", CPNull.isa.objj_msgSend0(CPNull, "null"), "remove-image");
}
,["CPDictionary"])]);
}{
var the_class = objj_getClass("CPRuleEditor")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPRuleEditor\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_delegateRespondsToRuleEditorPredicatePartsForCriterionWithDisplayValueInRow"), function $CPRuleEditor___delegateRespondsToRuleEditorPredicatePartsForCriterionWithDisplayValueInRow(self, _cmd)
{
    return self._implementedDelegateMethods & CPRuleEditorDelegate_ruleEditor_predicatePartsForCriterion_withDisplayValue_inRow_;
}
,["BOOL"]), new objj_method(sel_getUid("_sendDelegateRuleEditorPredicatePartsForCriterion:withDisplayValue:inRow:"), function $CPRuleEditor___sendDelegateRuleEditorPredicatePartsForCriterion_withDisplayValue_inRow_(self, _cmd, criterion, value, row)
{
    if (!(self._implementedDelegateMethods & CPRuleEditorDelegate_ruleEditor_predicatePartsForCriterion_withDisplayValue_inRow_))
        return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    return ((___r1 = self._ruleDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "ruleEditor:predicatePartsForCriterion:withDisplayValue:inRow:", self, criterion, value, row));
    var ___r1;
}
,["CPDictionary","id","id","CPInteger"])]);
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
        (self == null ? null : self.isa.objj_msgSend1(self, "setFormattingStringsFilename:", (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", CPRuleEditorStringsFilenameKey))));
        self._alignmentGridWidth = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeFloatForKey:", CPRuleEditorAlignmentGridWidthKey));
        self._sliceHeight = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeDoubleForKey:", CPRuleEditorSliceHeightKey));
        self._editable = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeBoolForKey:", CPRuleEditorEditableKey));
        self._allowsEmptyCompoundRows = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeBoolForKey:", CPRuleEditorAllowsEmptyCompoundRowsKey));
        self._disallowEmpty = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeBoolForKey:", CPRuleEditorDisallowEmptyKey));
        self._nestingMode = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeIntForKey:", CPRuleEditorNestingModeKey));
        self._typeKeyPath = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", CPRuleEditorRowTypeKeyPathKey));
        self._itemsKeyPath = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", CPRuleEditorItemsKeyPathKey));
        self._valuesKeyPath = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", CPRuleEditorValuesKeyPathKey));
        self._subrowsArrayKeyPath = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", CPRuleEditorSubrowsArrayKeyPathKey));
        self._boundArrayKeyPath = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", CPRuleEditorBoundArrayKeyPathKey));
        self._slicesHolder = ((___r1 = (self == null ? null : self.isa.objj_msgSend0(self, "subviews"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", 0));
        self._boundArrayOwner = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", CPRuleEditorBoundArrayOwnerKey));
        self._slices = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", CPRuleEditorSlicesKey));
        self._ruleDelegate = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", CPRuleEditorDelegateKey));
        (self == null ? null : self.isa.objj_msgSend0(self, "_initRuleEditorShared"));
    }
    return self;
    var ___r1;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPRuleEditor__encodeWithCoder_(self, _cmd, coder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPRuleEditor").super_class }, "encodeWithCoder:", coder);
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeBool:forKey:", self._editable, CPRuleEditorEditableKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeBool:forKey:", self._allowsEmptyCompoundRows, CPRuleEditorAllowsEmptyCompoundRowsKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeBool:forKey:", self._disallowEmpty, CPRuleEditorDisallowEmptyKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeFloat:forKey:", self._alignmentGridWidth, CPRuleEditorAlignmentGridWidthKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeDouble:forKey:", self._sliceHeight, CPRuleEditorSliceHeightKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeInt:forKey:", self._nestingMode, CPRuleEditorNestingModeKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self._stringsFilename, CPRuleEditorStringsFilenameKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self._typeKeyPath, CPRuleEditorRowTypeKeyPathKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self._itemsKeyPath, CPRuleEditorItemsKeyPathKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self._valuesKeyPath, CPRuleEditorValuesKeyPathKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self._boundArrayKeyPath, CPRuleEditorBoundArrayKeyPathKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self._subrowsArrayKeyPath, CPRuleEditorSubrowsArrayKeyPathKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeConditionalObject:forKey:", self._slicesHolder, CPRuleEditorSlicesHolderKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self._slices, CPRuleEditorSlicesKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self._boundArrayOwner, CPRuleEditorBoundArrayOwnerKey));
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
    var copy = ((___r1 = _CPRuleEditorRowObject.isa.objj_msgSend0(_CPRuleEditorRowObject, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "setSubrows:", ((___r1 = CPArray.isa.objj_msgSend0(CPArray, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithArray:copyItems:", self.subrows, YES))));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "setCriteria:", ((___r1 = CPArray.isa.objj_msgSend0(CPArray, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithArray:copyItems:", self.criteria, YES))));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "setDisplayValues:", ((___r1 = CPArray.isa.objj_msgSend0(CPArray, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithArray:copyItems:", self.displayValues, YES))));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "setRowType:", self.rowType));
    return copy;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("description"), function $_CPRuleEditorRowObject__description(self, _cmd)
{
    return "<" + self.isa.objj_msgSend0(self, "className") + ">\nsubrows = " + ((___r1 = self.subrows), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "description")) + "\ncriteria = " + ((___r1 = self.criteria), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "description")) + "\ndisplayValues = " + ((___r1 = self.displayValues), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "description"));
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("initWithCoder:"), function $_CPRuleEditorRowObject__initWithCoder_(self, _cmd, coder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorRowObject").super_class }, "init");
    if (self !== nil)
    {
        self.subrows = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", SubrowsKey));
        self.criteria = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", CriteriaKey));
        self.displayValues = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", DisplayValuesKey));
        self.rowType = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeIntForKey:", RowTypeKey));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPRuleEditorRowObject__encodeWithCoder_(self, _cmd, coder)
{
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self.subrows, SubrowsKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self.criteria, CriteriaKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self.displayValues, DisplayValuesKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeInt:forKey:", self.rowType, RowTypeKey));
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
    return CPString.isa.objj_msgSend(CPString, "stringWithFormat:", "<%d object:%d rowIndex:%d indentation:%d>", self.isa.objj_msgSend0(self, "hash"), ((___r1 = self.rowObject), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "hash")), self.rowIndex, self.indentation);
    var ___r1;
}
,["CPString"])]);
}var CPBoundArrayKey = "CPBoundArray";
{var the_class = objj_allocateClassPair(CPObject, "_CPRuleEditorViewUnboundRowHolder"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("boundArray")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $_CPRuleEditorViewUnboundRowHolder__init(self, _cmd)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorViewUnboundRowHolder").super_class }, "init"))
        self.boundArray = ((___r1 = CPArray.isa.objj_msgSend0(CPArray, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    return self;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("initWithCoder:"), function $_CPRuleEditorViewUnboundRowHolder__initWithCoder_(self, _cmd, coder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorViewUnboundRowHolder").super_class }, "init"))
        self.boundArray = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", CPBoundArrayKey));
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPRuleEditorViewUnboundRowHolder__encodeWithCoder_(self, _cmd, coder)
{
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self.boundArray, CPBoundArrayKey));
}
,["void","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPView, "_CPRuleEditorViewSliceHolder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("addSubview:"), function $_CPRuleEditorViewSliceHolder__addSubview_(self, _cmd, subview)
{
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorViewSliceHolder").super_class }, "addSubview:", subview);
}
,["void","CPView"])]);
}var dropSeparatorColor = CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", "4886ca");
{var the_class = objj_allocateClassPair(CPView, "_CPRuleEditorViewSliceDropSeparator"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("drawRect:"), function $_CPRuleEditorViewSliceDropSeparator__drawRect_(self, _cmd, rect)
{
    var context = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort"));
    CGContextSetFillColor(context, dropSeparatorColor);
    CGContextFillRect(context, self.isa.objj_msgSend0(self, "bounds"));
    var ___r1;
}
,["void","CGRect"])]);
}{
var the_class = objj_getClass("CPObject")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("valueType"), function $CPObject__valueType(self, _cmd)
{
    var result = 0,
        isString = self.isa.objj_msgSend1(self, "isKindOfClass:", CPString);
    if (!isString)
    {
        var isView = self.isa.objj_msgSend1(self, "isKindOfClass:", CPView);
        result = 1;
        if (!isView)
        {
            var ismenuItem = self.isa.objj_msgSend1(self, "isKindOfClass:", CPMenuItem);
            result = 2;
            if (!ismenuItem)
            {
                CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPGenericException, "Unknown type for " + self);
                result = -1;
            }
        }
    }
    return result;
}
,["int"])]);
}