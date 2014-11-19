@STATIC;1.0;I;23;Foundation/CPIndexSet.ji;20;CPObjectController.ji;19;CPKeyValueBinding.jt;43272;objj_executeFile("Foundation/CPIndexSet.j", NO);objj_executeFile("CPObjectController.j", YES);objj_executeFile("CPKeyValueBinding.j", YES);{var the_class = objj_allocateClassPair(CPObjectController, "CPArrayController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_avoidsEmptySelection"), new objj_ivar("_clearsFilterPredicateOnInsertion"), new objj_ivar("_filterRestrictsInsertion"), new objj_ivar("_preservesSelection"), new objj_ivar("_selectsInsertedObjects"), new objj_ivar("_alwaysUsesMultipleValuesMarker"), new objj_ivar("_automaticallyRearrangesObjects"), new objj_ivar("_selectionIndexes"), new objj_ivar("_sortDescriptors"), new objj_ivar("_filterPredicate"), new objj_ivar("_arrangedObjects"), new objj_ivar("_disableSetContent")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPArrayController__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPArrayController").super_class }, "init");
    if (self)
    {
        self._preservesSelection = YES;
        self._selectsInsertedObjects = YES;
        self._avoidsEmptySelection = YES;
        self._clearsFilterPredicateOnInsertion = YES;
        self._alwaysUsesMultipleValuesMarker = NO;
        self._automaticallyRearrangesObjects = NO;
        self._filterRestrictsInsertion = YES;
        (self == null ? null : self.isa.objj_msgSend0(self, "_init"));
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("_init"), function $CPArrayController___init(self, _cmd)
{
    self._sortDescriptors = CPArray.isa.objj_msgSend0(CPArray, "array");
    self._filterPredicate = nil;
    self._selectionIndexes = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
    self.isa.objj_msgSend1(self, "__setArrangedObjects:", CPArray.isa.objj_msgSend0(CPArray, "array"));
}
,["void"]), new objj_method(sel_getUid("prepareContent"), function $CPArrayController__prepareContent(self, _cmd)
{
    self.isa.objj_msgSend1(self, "_setContentArray:", [self.isa.objj_msgSend0(self, "newObject")]);
}
,["void"]), new objj_method(sel_getUid("preservesSelection"), function $CPArrayController__preservesSelection(self, _cmd)
{
    return self._preservesSelection;
}
,["BOOL"]), new objj_method(sel_getUid("setPreservesSelection:"), function $CPArrayController__setPreservesSelection_(self, _cmd, value)
{
    self._preservesSelection = value;
}
,["void","BOOL"]), new objj_method(sel_getUid("selectsInsertedObjects"), function $CPArrayController__selectsInsertedObjects(self, _cmd)
{
    return self._selectsInsertedObjects;
}
,["BOOL"]), new objj_method(sel_getUid("setSelectsInsertedObjects:"), function $CPArrayController__setSelectsInsertedObjects_(self, _cmd, value)
{
    self._selectsInsertedObjects = value;
}
,["void","BOOL"]), new objj_method(sel_getUid("avoidsEmptySelection"), function $CPArrayController__avoidsEmptySelection(self, _cmd)
{
    return self._avoidsEmptySelection;
}
,["BOOL"]), new objj_method(sel_getUid("setAvoidsEmptySelection:"), function $CPArrayController__setAvoidsEmptySelection_(self, _cmd, value)
{
    self._avoidsEmptySelection = value;
}
,["void","BOOL"]), new objj_method(sel_getUid("clearsFilterPredicateOnInsertion"), function $CPArrayController__clearsFilterPredicateOnInsertion(self, _cmd)
{
    return self._clearsFilterPredicateOnInsertion;
}
,["BOOL"]), new objj_method(sel_getUid("setClearsFilterPredicateOnInsertion:"), function $CPArrayController__setClearsFilterPredicateOnInsertion_(self, _cmd, aFlag)
{
    self._clearsFilterPredicateOnInsertion = aFlag;
}
,["void","BOOL"]), new objj_method(sel_getUid("alwaysUsesMultipleValuesMarker"), function $CPArrayController__alwaysUsesMultipleValuesMarker(self, _cmd)
{
    return self._alwaysUsesMultipleValuesMarker;
}
,["BOOL"]), new objj_method(sel_getUid("setAlwaysUsesMultipleValuesMarker:"), function $CPArrayController__setAlwaysUsesMultipleValuesMarker_(self, _cmd, aFlag)
{
    self._alwaysUsesMultipleValuesMarker = aFlag;
}
,["void","BOOL"]), new objj_method(sel_getUid("automaticallyRearrangesObjects"), function $CPArrayController__automaticallyRearrangesObjects(self, _cmd)
{
    return self._automaticallyRearrangesObjects;
}
,["BOOL"]), new objj_method(sel_getUid("setAutomaticallyRearrangesObjects:"), function $CPArrayController__setAutomaticallyRearrangesObjects_(self, _cmd, aFlag)
{
    self._automaticallyRearrangesObjects = aFlag;
}
,["void","BOOL"]), new objj_method(sel_getUid("setContent:"), function $CPArrayController__setContent_(self, _cmd, value)
{
    if (self._disableSetContent)
        return;
    if (value === nil)
        value = [];
    if (!(value == null ? null : value.isa.objj_msgSend1(value, "isKindOfClass:", CPArray.isa.objj_msgSend0(CPArray, "class"))))
        value = [value];
    var oldSelectedObjects = nil,
        oldSelectionIndexes = nil;
    if (self.isa.objj_msgSend0(self, "preservesSelection"))
        oldSelectedObjects = self.isa.objj_msgSend0(self, "selectedObjects");
    else
        oldSelectionIndexes = self.isa.objj_msgSend0(self, "selectionIndexes");
    if (self._clearsFilterPredicateOnInsertion)
        self.isa.objj_msgSend1(self, "willChangeValueForKey:", "filterPredicate");
    self._contentObject = value;
    if (self._clearsFilterPredicateOnInsertion && self._filterPredicate != nil)
        self.isa.objj_msgSend1(self, "__setFilterPredicate:", nil);
    else
        self.isa.objj_msgSend0(self, "_rearrangeObjects");
    if (self.isa.objj_msgSend0(self, "preservesSelection"))
        self.isa.objj_msgSend1(self, "__setSelectedObjects:", oldSelectedObjects);
    else
        self.isa.objj_msgSend1(self, "__setSelectionIndexes:", oldSelectionIndexes);
    if (self._clearsFilterPredicateOnInsertion)
        self.isa.objj_msgSend1(self, "didChangeValueForKey:", "filterPredicate");
}
,["void","id"]), new objj_method(sel_getUid("_setContentArray:"), function $CPArrayController___setContentArray_(self, _cmd, anArray)
{
    self.isa.objj_msgSend1(self, "setContent:", anArray);
}
,["void","id"]), new objj_method(sel_getUid("_setContentSet:"), function $CPArrayController___setContentSet_(self, _cmd, aSet)
{
    self.isa.objj_msgSend1(self, "setContent:", (aSet == null ? null : aSet.isa.objj_msgSend0(aSet, "allObjects")));
}
,["void","id"]), new objj_method(sel_getUid("contentArray"), function $CPArrayController__contentArray(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "content");
}
,["id"]), new objj_method(sel_getUid("contentSet"), function $CPArrayController__contentSet(self, _cmd)
{
    return CPSet.isa.objj_msgSend1(CPSet, "setWithArray:", self.isa.objj_msgSend0(self, "content"));
}
,["id"]), new objj_method(sel_getUid("arrangeObjects:"), function $CPArrayController__arrangeObjects_(self, _cmd, objects)
{
    var filterPredicate = self.isa.objj_msgSend0(self, "filterPredicate"),
        sortDescriptors = self.isa.objj_msgSend0(self, "sortDescriptors");
    if (filterPredicate && (sortDescriptors == null ? null : sortDescriptors.isa.objj_msgSend0(sortDescriptors, "count")) > 0)
    {
        var sortedObjects = (objects == null ? null : objects.isa.objj_msgSend1(objects, "filteredArrayUsingPredicate:", filterPredicate));
        (sortedObjects == null ? null : sortedObjects.isa.objj_msgSend1(sortedObjects, "sortUsingDescriptors:", sortDescriptors));
        return sortedObjects;
    }
    else if (filterPredicate)
        return (objects == null ? null : objects.isa.objj_msgSend1(objects, "filteredArrayUsingPredicate:", filterPredicate));
    else if ((sortDescriptors == null ? null : sortDescriptors.isa.objj_msgSend0(sortDescriptors, "count")) > 0)
        return (objects == null ? null : objects.isa.objj_msgSend1(objects, "sortedArrayUsingDescriptors:", sortDescriptors));
    return (objects == null ? null : objects.isa.objj_msgSend0(objects, "copy"));
}
,["CPArray","CPArray"]), new objj_method(sel_getUid("rearrangeObjects"), function $CPArrayController__rearrangeObjects(self, _cmd)
{
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", "arrangedObjects");
    self.isa.objj_msgSend0(self, "_rearrangeObjects");
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", "arrangedObjects");
}
,["void"]), new objj_method(sel_getUid("_rearrangeObjects"), function $CPArrayController___rearrangeObjects(self, _cmd)
{
    var oldSelectedObjects = nil,
        oldSelectionIndexes = nil;
    if (self.isa.objj_msgSend0(self, "preservesSelection"))
        oldSelectedObjects = self.isa.objj_msgSend0(self, "selectedObjects");
    else
        oldSelectionIndexes = self.isa.objj_msgSend0(self, "selectionIndexes");
    self.isa.objj_msgSend1(self, "__setArrangedObjects:", self.isa.objj_msgSend1(self, "arrangeObjects:", self.isa.objj_msgSend0(self, "contentArray")));
    if (self.isa.objj_msgSend0(self, "preservesSelection"))
        self.isa.objj_msgSend1(self, "__setSelectedObjects:", oldSelectedObjects);
    else
        self.isa.objj_msgSend1(self, "__setSelectionIndexes:", oldSelectionIndexes);
}
,["void"]), new objj_method(sel_getUid("__setArrangedObjects:"), function $CPArrayController____setArrangedObjects_(self, _cmd, value)
{
    if (self._arrangedObjects === value)
        return;
    self._arrangedObjects = ((___r1 = _CPObservableArray.isa.objj_msgSend0(_CPObservableArray, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithArray:", value));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("arrangedObjects"), function $CPArrayController__arrangedObjects(self, _cmd)
{
    return self._arrangedObjects;
}
,["id"]), new objj_method(sel_getUid("sortDescriptors"), function $CPArrayController__sortDescriptors(self, _cmd)
{
    return self._sortDescriptors;
}
,["CPArray"]), new objj_method(sel_getUid("setSortDescriptors:"), function $CPArrayController__setSortDescriptors_(self, _cmd, value)
{
    if (self._sortDescriptors === value)
        return;
    self._sortDescriptors = (value == null ? null : value.isa.objj_msgSend0(value, "copy"));
    self.isa.objj_msgSend0(self, "_rearrangeObjects");
}
,["void","CPArray"]), new objj_method(sel_getUid("filterPredicate"), function $CPArrayController__filterPredicate(self, _cmd)
{
    return self._filterPredicate;
}
,["CPPredicate"]), new objj_method(sel_getUid("setFilterPredicate:"), function $CPArrayController__setFilterPredicate_(self, _cmd, value)
{
    if (self._filterPredicate === value)
        return;
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", "arrangedObjects");
    self.isa.objj_msgSend1(self, "__setFilterPredicate:", value);
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", "arrangedObjects");
}
,["void","CPPredicate"]), new objj_method(sel_getUid("__setFilterPredicate:"), function $CPArrayController____setFilterPredicate_(self, _cmd, value)
{
    if (self._filterPredicate === value)
        return;
    self._filterPredicate = value;
    self.isa.objj_msgSend0(self, "_rearrangeObjects");
}
,["void","CPPredicate"]), new objj_method(sel_getUid("alwaysUsesMultipleValuesMarker"), function $CPArrayController__alwaysUsesMultipleValuesMarker(self, _cmd)
{
    return self._alwaysUsesMultipleValuesMarker;
}
,["BOOL"]), new objj_method(sel_getUid("selectionIndex"), function $CPArrayController__selectionIndex(self, _cmd)
{
    return ((___r1 = self._selectionIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstIndex"));
    var ___r1;
}
,["unsigned"]), new objj_method(sel_getUid("setSelectionIndex:"), function $CPArrayController__setSelectionIndex_(self, _cmd, index)
{
    return self.isa.objj_msgSend1(self, "setSelectionIndexes:", CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", index));
}
,["BOOL","unsigned"]), new objj_method(sel_getUid("selectionIndexes"), function $CPArrayController__selectionIndexes(self, _cmd)
{
    return self._selectionIndexes;
}
,["CPIndexSet"]), new objj_method(sel_getUid("setSelectionIndexes:"), function $CPArrayController__setSelectionIndexes_(self, _cmd, indexes)
{
    self.isa.objj_msgSend0(self, "_selectionWillChange");
    var r = self.isa.objj_msgSend2(self, "__setSelectionIndexes:avoidEmpty:", indexes, NO);
    self.isa.objj_msgSend0(self, "_selectionDidChange");
    return r;
}
,["BOOL","CPIndexSet"]), new objj_method(sel_getUid("__setSelectionIndex:"), function $CPArrayController____setSelectionIndex_(self, _cmd, theIndex)
{
    return self.isa.objj_msgSend1(self, "__setSelectionIndexes:", CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", theIndex));
}
,["BOOL","int"]), new objj_method(sel_getUid("__setSelectionIndexes:"), function $CPArrayController____setSelectionIndexes_(self, _cmd, indexes)
{
    return self.isa.objj_msgSend2(self, "__setSelectionIndexes:avoidEmpty:", indexes, self._avoidsEmptySelection);
}
,["BOOL","CPIndexSet"]), new objj_method(sel_getUid("__setSelectionIndexes:avoidEmpty:"), function $CPArrayController____setSelectionIndexes_avoidEmpty_(self, _cmd, indexes, avoidEmpty)
{
    var newIndexes = indexes;
    if (!newIndexes)
        newIndexes = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
    if (!(newIndexes == null ? null : newIndexes.isa.objj_msgSend0(newIndexes, "count")))
    {
        if (avoidEmpty && ((___r1 = self.isa.objj_msgSend0(self, "arrangedObjects")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")))
            newIndexes = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", 0);
    }
    else
    {
        var objectsCount = ((___r1 = self.isa.objj_msgSend0(self, "arrangedObjects")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
        newIndexes = (newIndexes == null ? null : newIndexes.isa.objj_msgSend0(newIndexes, "copy"));
        (newIndexes == null ? null : newIndexes.isa.objj_msgSend1(newIndexes, "removeIndexesInRange:", CPMakeRange(objectsCount, (newIndexes == null ? null : newIndexes.isa.objj_msgSend0(newIndexes, "lastIndex")) + 1)));
        if (!(newIndexes == null ? null : newIndexes.isa.objj_msgSend0(newIndexes, "count")) && avoidEmpty && objectsCount)
            newIndexes = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", objectsCount - 1);
    }
    if (((___r1 = self._selectionIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqualToIndexSet:", newIndexes)))
        return NO;
    self._selectionIndexes = indexes === newIndexes ? (indexes == null ? null : indexes.isa.objj_msgSend0(indexes, "copy")) : newIndexes;
    var binderClass = ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_binderClassForBinding:", "selectionIndexes"));
    ((___r1 = (binderClass == null ? null : binderClass.isa.objj_msgSend2(binderClass, "getBinding:forObject:", "selectionIndexes", self))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "reverseSetValueFor:", "selectionIndexes"));
    return YES;
    var ___r1;
}
,["BOOL","CPIndexSet","BOOL"]), new objj_method(sel_getUid("selectedObjects"), function $CPArrayController__selectedObjects(self, _cmd)
{
    var objects = ((___r1 = self.isa.objj_msgSend0(self, "arrangedObjects")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectsAtIndexes:", self.isa.objj_msgSend0(self, "selectionIndexes")));
    return _CPObservableArray.isa.objj_msgSend1(_CPObservableArray, "arrayWithArray:", objects || []);
    var ___r1;
}
,["CPArray"]), new objj_method(sel_getUid("setSelectedObjects:"), function $CPArrayController__setSelectedObjects_(self, _cmd, objects)
{
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", "selectionIndexes");
    self.isa.objj_msgSend0(self, "_selectionWillChange");
    var r = self.isa.objj_msgSend2(self, "__setSelectedObjects:avoidEmpty:", objects, NO);
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", "selectionIndexes");
    self.isa.objj_msgSend0(self, "_selectionDidChange");
    return r;
}
,["BOOL","CPArray"]), new objj_method(sel_getUid("__setSelectedObjects:"), function $CPArrayController____setSelectedObjects_(self, _cmd, objects)
{
    self.isa.objj_msgSend2(self, "__setSelectedObjects:avoidEmpty:", objects, self._avoidsEmptySelection);
}
,["BOOL","CPArray"]), new objj_method(sel_getUid("__setSelectedObjects:avoidEmpty:"), function $CPArrayController____setSelectedObjects_avoidEmpty_(self, _cmd, objects, avoidEmpty)
{
    var set = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet"),
        count = (objects == null ? null : objects.isa.objj_msgSend0(objects, "count")),
        arrangedObjects = self.isa.objj_msgSend0(self, "arrangedObjects");
    for (var i = 0; i < count; i++)
    {
        var index = (arrangedObjects == null ? null : arrangedObjects.isa.objj_msgSend1(arrangedObjects, "indexOfObject:", (objects == null ? null : objects.isa.objj_msgSend1(objects, "objectAtIndex:", i))));
        if (index !== CPNotFound)
            (set == null ? null : set.isa.objj_msgSend1(set, "addIndex:", index));
    }
    self.isa.objj_msgSend2(self, "__setSelectionIndexes:avoidEmpty:", set, avoidEmpty);
    return YES;
}
,["BOOL","CPArray","BOOL"]), new objj_method(sel_getUid("canSelectPrevious"), function $CPArrayController__canSelectPrevious(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "selectionIndexes")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstIndex")) > 0;
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("selectPrevious:"), function $CPArrayController__selectPrevious_(self, _cmd, sender)
{
    var index = ((___r1 = self.isa.objj_msgSend0(self, "selectionIndexes")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstIndex")) - 1;
    if (index >= 0)
        self.isa.objj_msgSend1(self, "setSelectionIndexes:", CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", index));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("canSelectNext"), function $CPArrayController__canSelectNext(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "selectionIndexes")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstIndex")) < ((___r1 = self.isa.objj_msgSend0(self, "arrangedObjects")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) - 1;
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("selectNext:"), function $CPArrayController__selectNext_(self, _cmd, sender)
{
    var index = ((___r1 = self.isa.objj_msgSend0(self, "selectionIndexes")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstIndex")) + 1;
    if (index < ((___r1 = self.isa.objj_msgSend0(self, "arrangedObjects")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")))
        self.isa.objj_msgSend1(self, "setSelectionIndexes:", CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", index));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("addObject:"), function $CPArrayController__addObject_(self, _cmd, object)
{
    if (!self.isa.objj_msgSend0(self, "canAdd"))
        return;
    var willClearPredicate = NO;
    if (self._clearsFilterPredicateOnInsertion && self._filterPredicate)
    {
        self.isa.objj_msgSend1(self, "willChangeValueForKey:", "filterPredicate");
        willClearPredicate = YES;
    }
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", "content");
    self._disableSetContent = YES;
    ((___r1 = self._contentObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", object));
    ((___r1 = CPBinder.isa.objj_msgSend2(CPBinder, "getBinding:forObject:", "contentArray", self)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_contentArrayDidChange"));
    self._disableSetContent = NO;
    if (willClearPredicate)
    {
        self._filterPredicate = nil;
        self.isa.objj_msgSend0(self, "_rearrangeObjects");
    }
    else if (self._filterPredicate === nil || ((___r1 = self._filterPredicate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "evaluateWithObject:", object)))
    {
        var pos = ((___r1 = self._arrangedObjects), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "insertObject:inArraySortedByDescriptors:", object, self._sortDescriptors));
        if (self._selectsInsertedObjects)
            self.isa.objj_msgSend1(self, "__setSelectionIndex:", pos);
        else
            ((___r1 = self._selectionIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "shiftIndexesStartingAtIndex:by:", pos, 1));
    }
    var proxy = _CPKVOProxy.isa.objj_msgSend1(_CPKVOProxy, "proxyForObject:", self);
    (proxy == null ? null : proxy.isa.objj_msgSend1(proxy, "setAdding:", YES));
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", "content");
    if (willClearPredicate)
        self.isa.objj_msgSend1(self, "didChangeValueForKey:", "filterPredicate");
    (proxy == null ? null : proxy.isa.objj_msgSend1(proxy, "setAdding:", NO));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("insertObject:atArrangedObjectIndex:"), function $CPArrayController__insertObject_atArrangedObjectIndex_(self, _cmd, anObject, anIndex)
{
    if (!self.isa.objj_msgSend0(self, "canAdd"))
        return;
    var willClearPredicate = NO;
    if (self._clearsFilterPredicateOnInsertion && self._filterPredicate)
    {
        self.isa.objj_msgSend1(self, "willChangeValueForKey:", "filterPredicate");
        willClearPredicate = YES;
    }
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", "content");
    self._disableSetContent = YES;
    ((___r1 = self._contentObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", anObject));
    ((___r1 = CPBinder.isa.objj_msgSend2(CPBinder, "getBinding:forObject:", "contentArray", self)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_contentArrayDidChange"));
    self._disableSetContent = NO;
    if (willClearPredicate)
        self.isa.objj_msgSend1(self, "__setFilterPredicate:", nil);
    ((___r1 = self.isa.objj_msgSend0(self, "arrangedObjects")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "insertObject:atIndex:", anObject, anIndex));
    if (self.isa.objj_msgSend0(self, "selectsInsertedObjects"))
        self.isa.objj_msgSend1(self, "__setSelectionIndex:", anIndex);
    else
        ((___r1 = self.isa.objj_msgSend0(self, "selectionIndexes")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "shiftIndexesStartingAtIndex:by:", anIndex, 1));
    if (self.isa.objj_msgSend0(self, "avoidsEmptySelection") && ((___r1 = self.isa.objj_msgSend0(self, "selectionIndexes")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) <= 0 && ((___r1 = self._contentObject), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) > 0)
        self.isa.objj_msgSend1(self, "__setSelectionIndexes:", CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", 0));
    var proxy = _CPKVOProxy.isa.objj_msgSend1(_CPKVOProxy, "proxyForObject:", self);
    (proxy == null ? null : proxy.isa.objj_msgSend1(proxy, "setAdding:", YES));
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", "content");
    if (willClearPredicate)
        self.isa.objj_msgSend1(self, "didChangeValueForKey:", "filterPredicate");
    (proxy == null ? null : proxy.isa.objj_msgSend1(proxy, "setAdding:", NO));
    var ___r1;
}
,["void","id","int"]), new objj_method(sel_getUid("removeObject:"), function $CPArrayController__removeObject_(self, _cmd, object)
{
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", "content");
    self._disableSetContent = YES;
    ((___r1 = self._contentObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObject:", object));
    ((___r1 = CPBinder.isa.objj_msgSend2(CPBinder, "getBinding:forObject:", "contentArray", self)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_contentArrayDidChange"));
    self._disableSetContent = NO;
    if (self._filterPredicate === nil || ((___r1 = self._filterPredicate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "evaluateWithObject:", object)))
    {
        var pos = ((___r1 = self._arrangedObjects), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", object));
        ((___r1 = self._arrangedObjects), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectAtIndex:", pos));
        ((___r1 = self._selectionIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "shiftIndexesStartingAtIndex:by:", pos, -1));
        self.isa.objj_msgSend1(self, "__setSelectionIndexes:", self._selectionIndexes);
    }
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", "content");
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("add:"), function $CPArrayController__add_(self, _cmd, sender)
{
    if (!self.isa.objj_msgSend0(self, "canAdd"))
        return;
    var newObject = self.isa.objj_msgSend0(self, "automaticallyPreparesContent") ? self.isa.objj_msgSend0(self, "newObject") : self.isa.objj_msgSend0(self, "_defaultNewObject");
    self.isa.objj_msgSend1(self, "addObject:", newObject);
}
,["void","id"]), new objj_method(sel_getUid("insert:"), function $CPArrayController__insert_(self, _cmd, sender)
{
    if (!self.isa.objj_msgSend0(self, "canInsert"))
        return;
    var newObject = self.isa.objj_msgSend0(self, "automaticallyPreparesContent") ? self.isa.objj_msgSend0(self, "newObject") : self.isa.objj_msgSend0(self, "_defaultNewObject"),
        lastSelectedIndex = ((___r1 = self._selectionIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lastIndex"));
    if (lastSelectedIndex !== CPNotFound)
        self.isa.objj_msgSend2(self, "insertObject:atArrangedObjectIndex:", newObject, lastSelectedIndex);
    else
        self.isa.objj_msgSend1(self, "addObject:", newObject);
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("remove:"), function $CPArrayController__remove_(self, _cmd, sender)
{
    self.isa.objj_msgSend1(self, "removeObjectsAtArrangedObjectIndexes:", self._selectionIndexes);
}
,["void","id"]), new objj_method(sel_getUid("removeObjectAtArrangedObjectIndex:"), function $CPArrayController__removeObjectAtArrangedObjectIndex_(self, _cmd, index)
{
    self.isa.objj_msgSend1(self, "removeObjectsAtArrangedObjectIndexes:", CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", index));
}
,["void","int"]), new objj_method(sel_getUid("removeObjectsAtArrangedObjectIndexes:"), function $CPArrayController__removeObjectsAtArrangedObjectIndexes_(self, _cmd, anIndexSet)
{
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", "content");
    self._disableSetContent = YES;
    var arrangedObjects = self.isa.objj_msgSend0(self, "arrangedObjects"),
        position = CPNotFound,
        newSelectionIndexes = ((___r1 = self._selectionIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
    (anIndexSet == null ? null : anIndexSet.isa.objj_msgSend2(anIndexSet, "enumerateIndexesWithOptions:usingBlock:", CPEnumerationReverse, function(anIndex)
    {
        var object = (arrangedObjects == null ? null : arrangedObjects.isa.objj_msgSend1(arrangedObjects, "objectAtIndex:", anIndex));
        if (((___r1 = self._contentObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", anIndex)) === object)
            ((___r1 = self._contentObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectAtIndex:", anIndex));
        else
        {
            var contentIndex = ((___r1 = self._contentObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObjectIdenticalTo:", object));
            ((___r1 = self._contentObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectAtIndex:", contentIndex));
        }
        (arrangedObjects == null ? null : arrangedObjects.isa.objj_msgSend1(arrangedObjects, "removeObjectAtIndex:", anIndex));
        if (!self._avoidsEmptySelection || (newSelectionIndexes == null ? null : newSelectionIndexes.isa.objj_msgSend0(newSelectionIndexes, "count")) > 1)
        {
            (newSelectionIndexes == null ? null : newSelectionIndexes.isa.objj_msgSend1(newSelectionIndexes, "removeIndex:", anIndex));
            (newSelectionIndexes == null ? null : newSelectionIndexes.isa.objj_msgSend2(newSelectionIndexes, "shiftIndexesStartingAtIndex:by:", anIndex, -1));
        }
        else if ((newSelectionIndexes == null ? null : newSelectionIndexes.isa.objj_msgSend0(newSelectionIndexes, "lastIndex")) !== anIndex)
            (newSelectionIndexes == null ? null : newSelectionIndexes.isa.objj_msgSend2(newSelectionIndexes, "shiftIndexesStartingAtIndex:by:", anIndex, -1));
        var ___r1;
    }));
    ((___r1 = CPBinder.isa.objj_msgSend2(CPBinder, "getBinding:forObject:", "contentArray", self)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_contentArrayDidChange"));
    self._disableSetContent = NO;
    self.isa.objj_msgSend1(self, "__setSelectionIndexes:", newSelectionIndexes);
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", "content");
    var ___r1;
}
,["void","CPIndexSet"]), new objj_method(sel_getUid("addObjects:"), function $CPArrayController__addObjects_(self, _cmd, objects)
{
    if (!self.isa.objj_msgSend0(self, "canAdd"))
        return;
    var contentArray = self.isa.objj_msgSend0(self, "contentArray"),
        count = (objects == null ? null : objects.isa.objj_msgSend0(objects, "count"));
    for (var i = 0; i < count; i++)
        (contentArray == null ? null : contentArray.isa.objj_msgSend1(contentArray, "addObject:", (objects == null ? null : objects.isa.objj_msgSend1(objects, "objectAtIndex:", i))));
    self.isa.objj_msgSend1(self, "setContent:", contentArray);
    ((___r1 = CPBinder.isa.objj_msgSend2(CPBinder, "getBinding:forObject:", "contentArray", self)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_contentArrayDidChange"));
    var ___r1;
}
,["void","CPArray"]), new objj_method(sel_getUid("removeObjects:"), function $CPArrayController__removeObjects_(self, _cmd, objects)
{
    self.isa.objj_msgSend1(self, "_removeObjects:", objects);
}
,["void","CPArray"]), new objj_method(sel_getUid("_removeObjects:"), function $CPArrayController___removeObjects_(self, _cmd, objects)
{
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", "content");
    self._disableSetContent = YES;
    ((___r1 = self._contentObject), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectsInArray:", objects));
    ((___r1 = CPBinder.isa.objj_msgSend2(CPBinder, "getBinding:forObject:", "contentArray", self)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_contentArrayDidChange"));
    self._disableSetContent = NO;
    var arrangedObjects = self.isa.objj_msgSend0(self, "arrangedObjects"),
        position = (arrangedObjects == null ? null : arrangedObjects.isa.objj_msgSend1(arrangedObjects, "indexOfObject:", (objects == null ? null : objects.isa.objj_msgSend1(objects, "objectAtIndex:", 0))));
    (arrangedObjects == null ? null : arrangedObjects.isa.objj_msgSend1(arrangedObjects, "removeObjectsInArray:", objects));
    var objectsCount = (arrangedObjects == null ? null : arrangedObjects.isa.objj_msgSend0(arrangedObjects, "count")),
        selectionIndexes = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
    if (self.isa.objj_msgSend0(self, "preservesSelection") || self.isa.objj_msgSend0(self, "avoidsEmptySelection"))
    {
        selectionIndexes = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", position);
        if (objectsCount <= 0)
            selectionIndexes = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
        else if (position >= objectsCount)
            selectionIndexes = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", objectsCount - 1);
    }
    self._selectionIndexes = selectionIndexes;
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", "content");
    var ___r1;
}
,["void","CPArray"]), new objj_method(sel_getUid("canInsert"), function $CPArrayController__canInsert(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "isEditable");
}
,["BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPArrayController__initialize(self, _cmd)
{
    if (self !== CPArrayController.isa.objj_msgSend0(CPArrayController, "class"))
        return;
    self.isa.objj_msgSend1(self, "exposeBinding:", "contentArray");
    self.isa.objj_msgSend1(self, "exposeBinding:", "contentSet");
}
,["void"]), new objj_method(sel_getUid("keyPathsForValuesAffectingContentArray"), function $CPArrayController__keyPathsForValuesAffectingContentArray(self, _cmd)
{
    return CPSet.isa.objj_msgSend1(CPSet, "setWithObjects:", "content");
}
,["CPSet"]), new objj_method(sel_getUid("keyPathsForValuesAffectingArrangedObjects"), function $CPArrayController__keyPathsForValuesAffectingArrangedObjects(self, _cmd)
{
    return CPSet.isa.objj_msgSend2(CPSet, "setWithObjects:", "content", "sortDescriptors");
}
,["CPSet"]), new objj_method(sel_getUid("keyPathsForValuesAffectingSelection"), function $CPArrayController__keyPathsForValuesAffectingSelection(self, _cmd)
{
    return CPSet.isa.objj_msgSend1(CPSet, "setWithObjects:", "selectionIndexes");
}
,["CPSet"]), new objj_method(sel_getUid("keyPathsForValuesAffectingSelectionIndex"), function $CPArrayController__keyPathsForValuesAffectingSelectionIndex(self, _cmd)
{
    return CPSet.isa.objj_msgSend1(CPSet, "setWithObjects:", "selectionIndexes");
}
,["CPSet"]), new objj_method(sel_getUid("keyPathsForValuesAffectingSelectionIndexes"), function $CPArrayController__keyPathsForValuesAffectingSelectionIndexes(self, _cmd)
{
    return CPSet.isa.objj_msgSend1(CPSet, "setWithObjects:", "arrangedObjects");
}
,["CPSet"]), new objj_method(sel_getUid("keyPathsForValuesAffectingSelectedObjects"), function $CPArrayController__keyPathsForValuesAffectingSelectedObjects(self, _cmd)
{
    return CPSet.isa.objj_msgSend1(CPSet, "setWithObjects:", "selectionIndexes");
}
,["CPSet"]), new objj_method(sel_getUid("keyPathsForValuesAffectingCanRemove"), function $CPArrayController__keyPathsForValuesAffectingCanRemove(self, _cmd)
{
    return CPSet.isa.objj_msgSend1(CPSet, "setWithObjects:", "selectionIndexes");
}
,["CPSet"]), new objj_method(sel_getUid("keyPathsForValuesAffectingCanSelectNext"), function $CPArrayController__keyPathsForValuesAffectingCanSelectNext(self, _cmd)
{
    return CPSet.isa.objj_msgSend1(CPSet, "setWithObjects:", "selectionIndexes");
}
,["CPSet"]), new objj_method(sel_getUid("keyPathsForValuesAffectingCanSelectPrevious"), function $CPArrayController__keyPathsForValuesAffectingCanSelectPrevious(self, _cmd)
{
    return CPSet.isa.objj_msgSend1(CPSet, "setWithObjects:", "selectionIndexes");
}
,["CPSet"])]);
}{
var the_class = objj_getClass("CPArrayController")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPArrayController\"");
var meta_class = the_class.isa;class_addMethods(meta_class, [new objj_method(sel_getUid("_binderClassForBinding:"), function $CPArrayController___binderClassForBinding_(self, _cmd, aBinding)
{
    if (aBinding == "contentArray")
        return (_CPArrayControllerContentBinder == null ? null : _CPArrayControllerContentBinder.isa.objj_msgSend0(_CPArrayControllerContentBinder, "class"));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPArrayController").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"])]);
}{var the_class = objj_allocateClassPair(CPBinder, "_CPArrayControllerContentBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setValueFor:"), function $_CPArrayControllerContentBinder__setValueFor_(self, _cmd, aBinding)
{
    var destination = ((___r1 = self._info), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPObservedObjectKey)),
        keyPath = ((___r1 = self._info), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPObservedKeyPathKey)),
        options = ((___r1 = self._info), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPOptionsKey)),
        isCompound = self.isa.objj_msgSend0(self, "handlesContentAsCompoundValue"),
        dotIndex = keyPath.lastIndexOf("."),
        firstPart = dotIndex !== CPNotFound ? keyPath.substring(0, dotIndex) : nil,
        isSelectionProxy = firstPart && ((___r1 = (destination == null ? null : destination.isa.objj_msgSend1(destination, "valueForKeyPath:", firstPart))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isKindOfClass:", CPControllerSelectionProxy)),
        newValue;
    if (!isCompound && !isSelectionProxy)
    {
        newValue = (destination == null ? null : destination.isa.objj_msgSend1(destination, "mutableArrayValueForKeyPath:", keyPath));
    }
    else
    {
        newValue = (destination == null ? null : destination.isa.objj_msgSend1(destination, "valueForKeyPath:", keyPath));
    }
    var isPlaceholder = CPIsControllerMarker(newValue);
    if (isPlaceholder)
    {
        if (newValue === CPNotApplicableMarker && (options == null ? null : options.isa.objj_msgSend1(options, "objectForKey:", CPRaisesForNotApplicableKeysBindingOption)))
        {
            CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPGenericException, "can't transform non applicable key on: " + self._source + " value: " + newValue);
        }
        newValue = self.isa.objj_msgSend1(self, "_placeholderForMarker:", newValue);
        if (!newValue)
            newValue = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "array");
    }
    else
        newValue = self.isa.objj_msgSend2(self, "transformValue:withOptions:", newValue, options);
    if (isCompound)
    {
        newValue = (newValue == null ? null : newValue.isa.objj_msgSend0(newValue, "mutableCopy"));
    }
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKey:", newValue, aBinding));
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("_contentArrayDidChange"), function $_CPArrayControllerContentBinder___contentArrayDidChange(self, _cmd)
{
    if (self.isa.objj_msgSend0(self, "handlesContentAsCompoundValue"))
    {
        var destination = ((___r1 = self._info), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPObservedObjectKey)),
            keyPath = ((___r1 = self._info), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPObservedKeyPathKey));
        self.isa.objj_msgSend2(self, "suppressSpecificNotificationFromObject:keyPath:", destination, keyPath);
        self.isa.objj_msgSend1(self, "reverseSetValueFor:", "contentArray");
        self.isa.objj_msgSend2(self, "unsuppressSpecificNotificationFromObject:keyPath:", destination, keyPath);
    }
    var ___r1;
}
,["void"])]);
}var CPArrayControllerAvoidsEmptySelection = "CPArrayControllerAvoidsEmptySelection",
    CPArrayControllerClearsFilterPredicateOnInsertion = "CPArrayControllerClearsFilterPredicateOnInsertion",
    CPArrayControllerFilterRestrictsInsertion = "CPArrayControllerFilterRestrictsInsertion",
    CPArrayControllerPreservesSelection = "CPArrayControllerPreservesSelection",
    CPArrayControllerSelectsInsertedObjects = "CPArrayControllerSelectsInsertedObjects",
    CPArrayControllerAlwaysUsesMultipleValuesMarker = "CPArrayControllerAlwaysUsesMultipleValuesMarker",
    CPArrayControllerAutomaticallyRearrangesObjects = "CPArrayControllerAutomaticallyRearrangesObjects";
{
var the_class = objj_getClass("CPArrayController")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPArrayController\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPArrayController__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPArrayController").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._avoidsEmptySelection = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPArrayControllerAvoidsEmptySelection));
        self._clearsFilterPredicateOnInsertion = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPArrayControllerClearsFilterPredicateOnInsertion));
        self._filterRestrictsInsertion = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPArrayControllerFilterRestrictsInsertion));
        self._preservesSelection = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPArrayControllerPreservesSelection));
        self._selectsInsertedObjects = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPArrayControllerSelectsInsertedObjects));
        self._alwaysUsesMultipleValuesMarker = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPArrayControllerAlwaysUsesMultipleValuesMarker));
        self._automaticallyRearrangesObjects = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPArrayControllerAutomaticallyRearrangesObjects));
        self._sortDescriptors = CPArray.isa.objj_msgSend0(CPArray, "array");
        if (!(self == null ? null : self.isa.objj_msgSend0(self, "content")) && (self == null ? null : self.isa.objj_msgSend0(self, "automaticallyPreparesContent")))
            (self == null ? null : self.isa.objj_msgSend0(self, "prepareContent"));
        else if (!(self == null ? null : self.isa.objj_msgSend0(self, "content")))
            (self == null ? null : self.isa.objj_msgSend1(self, "_setContentArray:", []));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPArrayController__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPArrayController").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._avoidsEmptySelection, CPArrayControllerAvoidsEmptySelection));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._clearsFilterPredicateOnInsertion, CPArrayControllerClearsFilterPredicateOnInsertion));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._filterRestrictsInsertion, CPArrayControllerFilterRestrictsInsertion));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._preservesSelection, CPArrayControllerPreservesSelection));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._selectsInsertedObjects, CPArrayControllerSelectsInsertedObjects));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._alwaysUsesMultipleValuesMarker, CPArrayControllerAlwaysUsesMultipleValuesMarker));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._automaticallyRearrangesObjects, CPArrayControllerAutomaticallyRearrangesObjects));
}
,["void","CPCoder"]), new objj_method(sel_getUid("awakeFromCib"), function $CPArrayController__awakeFromCib(self, _cmd)
{
    self.isa.objj_msgSend0(self, "_selectionWillChange");
    self.isa.objj_msgSend0(self, "_selectionDidChange");
}
,["void"])]);
}