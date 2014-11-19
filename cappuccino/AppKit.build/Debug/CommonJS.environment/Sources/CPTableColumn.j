@STATIC;1.0;I;25;Foundation/CPDictionary.jI;21;Foundation/CPObject.jI;23;Foundation/CPIndexSet.jI;29;Foundation/CPSortDescriptor.jI;21;Foundation/CPString.ji;13;CPTextField.jt;27861;objj_executeFile("Foundation/CPDictionary.j", NO);objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPIndexSet.j", NO);objj_executeFile("Foundation/CPSortDescriptor.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("CPTextField.j", YES);CPTableColumnNoResizing = 0;
CPTableColumnAutoresizingMask = 1 << 0;
CPTableColumnUserResizingMask = 1 << 1;
{var the_class = objj_allocateClassPair(CPObject, "CPTableColumn"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_tableView"), new objj_ivar("_headerView"), new objj_ivar("_dataView"), new objj_ivar("_dataViewData"), new objj_ivar("_width"), new objj_ivar("_minWidth"), new objj_ivar("_maxWidth"), new objj_ivar("_resizingMask"), new objj_ivar("_identifier"), new objj_ivar("_isEditable"), new objj_ivar("_sortDescriptorPrototype"), new objj_ivar("_isHidden"), new objj_ivar("_headerToolTip"), new objj_ivar("_disableResizingPosting")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("disableResizingPosting"), function $CPTableColumn__disableResizingPosting(self, _cmd)
{
    return self._disableResizingPosting;
}
,["BOOL"]), new objj_method(sel_getUid("setDisableResizingPosting:"), function $CPTableColumn__setDisableResizingPosting_(self, _cmd, newValue)
{
    self._disableResizingPosting = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("init"), function $CPTableColumn__init(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "initWithIdentifier:", "");
}
,["id"]), new objj_method(sel_getUid("initWithIdentifier:"), function $CPTableColumn__initWithIdentifier_(self, _cmd, anIdentifier)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableColumn").super_class }, "init");
    if (self)
    {
        self._dataViewData = nil;
        self._width = 100.0;
        self._minWidth = 10.0;
        self._maxWidth = 1000000.0;
        self._resizingMask = CPTableColumnAutoresizingMask | CPTableColumnUserResizingMask;
        self._disableResizingPosting = NO;
        (self == null ? null : self.isa.objj_msgSend1(self, "setIdentifier:", anIdentifier));
        var header = ((___r1 = (_CPTableColumnHeaderView == null ? null : _CPTableColumnHeaderView.isa.objj_msgSend0(_CPTableColumnHeaderView, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
        (self == null ? null : self.isa.objj_msgSend1(self, "setHeaderView:", header));
        (self == null ? null : self.isa.objj_msgSend1(self, "setDataView:", CPTextField.isa.objj_msgSend0(CPTextField, "new")));
    }
    return self;
    var ___r1;
}
,["id","id"]), new objj_method(sel_getUid("setTableView:"), function $CPTableColumn__setTableView_(self, _cmd, aTableView)
{
    self._tableView = aTableView;
}
,["void","CPTableView"]), new objj_method(sel_getUid("tableView"), function $CPTableColumn__tableView(self, _cmd)
{
    return self._tableView;
}
,["CPTableView"]), new objj_method(sel_getUid("_tryToResizeToWidth:"), function $CPTableColumn___tryToResizeToWidth_(self, _cmd, width)
{
    var min = self.isa.objj_msgSend0(self, "minWidth"),
        max = self.isa.objj_msgSend0(self, "maxWidth"),
        newWidth = ROUND(MIN(MAX(width, min), max));
    self.isa.objj_msgSend1(self, "setWidth:", newWidth);
    return newWidth - width;
}
,["int","int"]), new objj_method(sel_getUid("setWidth:"), function $CPTableColumn__setWidth_(self, _cmd, aWidth)
{
    aWidth = +aWidth;
    if (self._width === aWidth)
        return;
    var newWidth = MIN(MAX(aWidth, self.isa.objj_msgSend0(self, "minWidth")), self.isa.objj_msgSend0(self, "maxWidth"));
    if (self._width === newWidth)
        return;
    var oldWidth = self._width;
    self._width = newWidth;
    var tableView = self.isa.objj_msgSend0(self, "tableView");
    if (tableView)
    {
        var index = ((___r1 = (tableView == null ? null : tableView.isa.objj_msgSend0(tableView, "tableColumns"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObjectIdenticalTo:", self)),
            dirtyTableColumnRangeIndex = tableView._dirtyTableColumnRangeIndex;
        if (dirtyTableColumnRangeIndex < 0)
            tableView._dirtyTableColumnRangeIndex = index;
        else
            tableView._dirtyTableColumnRangeIndex = MIN(index, tableView._dirtyTableColumnRangeIndex);
        var rows = tableView._exposedRows,
            columns = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(index, ((___r1 = tableView._exposedColumns), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lastIndex")) - index + 1));
        (tableView == null ? null : tableView.isa.objj_msgSend2(tableView, "_layoutDataViewsInRows:columns:", rows, columns));
        (tableView == null ? null : tableView.isa.objj_msgSend0(tableView, "tile"));
        if (!self._disableResizingPosting)
            self.isa.objj_msgSend1(self, "_postDidResizeNotificationWithOldWidth:", oldWidth);
    }
    var ___r1;
}
,["void","float"]), new objj_method(sel_getUid("width"), function $CPTableColumn__width(self, _cmd)
{
    return self._width;
}
,["float"]), new objj_method(sel_getUid("setMinWidth:"), function $CPTableColumn__setMinWidth_(self, _cmd, aMinWidth)
{
    aMinWidth = +aMinWidth;
    if (self._minWidth === aMinWidth)
        return;
    self._minWidth = aMinWidth;
    var width = self.isa.objj_msgSend0(self, "width"),
        newWidth = MAX(width, self.isa.objj_msgSend0(self, "minWidth"));
    if (width !== newWidth)
        self.isa.objj_msgSend1(self, "setWidth:", newWidth);
}
,["void","float"]), new objj_method(sel_getUid("minWidth"), function $CPTableColumn__minWidth(self, _cmd)
{
    return self._minWidth;
}
,["float"]), new objj_method(sel_getUid("setMaxWidth:"), function $CPTableColumn__setMaxWidth_(self, _cmd, aMaxWidth)
{
    aMaxWidth = +aMaxWidth;
    if (self._maxWidth === aMaxWidth)
        return;
    self._maxWidth = aMaxWidth;
    var width = self.isa.objj_msgSend0(self, "width"),
        newWidth = MIN(width, self.isa.objj_msgSend0(self, "maxWidth"));
    if (width !== newWidth)
        self.isa.objj_msgSend1(self, "setWidth:", newWidth);
}
,["void","float"]), new objj_method(sel_getUid("maxWidth"), function $CPTableColumn__maxWidth(self, _cmd)
{
    return self._maxWidth;
}
,["float"]), new objj_method(sel_getUid("setResizingMask:"), function $CPTableColumn__setResizingMask_(self, _cmd, aResizingMask)
{
    self._resizingMask = aResizingMask;
}
,["void","unsigned"]), new objj_method(sel_getUid("resizingMask"), function $CPTableColumn__resizingMask(self, _cmd)
{
    return self._resizingMask;
}
,["unsigned"]), new objj_method(sel_getUid("sizeToFit"), function $CPTableColumn__sizeToFit(self, _cmd)
{
    var width = CGRectGetWidth(((___r1 = self._headerView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")));
    if (width < self.isa.objj_msgSend0(self, "minWidth"))
        self.isa.objj_msgSend1(self, "setMinWidth:", width);
    else if (width > self.isa.objj_msgSend0(self, "maxWidth"))
        self.isa.objj_msgSend1(self, "setMaxWidth:", width);
    if (self._width !== width)
        self.isa.objj_msgSend1(self, "setWidth:", width);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setHeaderView:"), function $CPTableColumn__setHeaderView_(self, _cmd, aView)
{
    if (!aView)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "Attempt to set nil header view on " + self.isa.objj_msgSend0(self, "description"));
    self._headerView = aView;
    var tableHeaderView = ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "headerView"));
    (tableHeaderView == null ? null : tableHeaderView.isa.objj_msgSend0(tableHeaderView, "setNeedsLayout"));
    (tableHeaderView == null ? null : tableHeaderView.isa.objj_msgSend1(tableHeaderView, "setNeedsDisplay:", YES));
    var ___r1;
}
,["void","CPView"]), new objj_method(sel_getUid("headerView"), function $CPTableColumn__headerView(self, _cmd)
{
    return self._headerView;
}
,["CPView"]), new objj_method(sel_getUid("setDataView:"), function $CPTableColumn__setDataView_(self, _cmd, aView)
{
    if (self._dataView)
        self._dataViewData = nil;
    (aView == null ? null : aView.isa.objj_msgSend1(aView, "setThemeState:", CPThemeStateTableDataView));
    self._dataView = aView;
    self._dataViewData = CPKeyedArchiver.isa.objj_msgSend1(CPKeyedArchiver, "archivedDataWithRootObject:", aView);
}
,["void","CPView"]), new objj_method(sel_getUid("dataView"), function $CPTableColumn__dataView(self, _cmd)
{
    return self._dataView;
}
,["CPView"]), new objj_method(sel_getUid("dataViewForRow:"), function $CPTableColumn__dataViewForRow_(self, _cmd, aRowIndex)
{
    return self.isa.objj_msgSend0(self, "dataView");
}
,["id","CPInteger"]), new objj_method(sel_getUid("_newDataView"), function $CPTableColumn___newDataView(self, _cmd)
{
    if (!self._dataViewData)
        return nil;
    var newDataView = CPKeyedUnarchiver.isa.objj_msgSend1(CPKeyedUnarchiver, "unarchiveObjectWithData:", self._dataViewData);
    (newDataView == null ? null : newDataView.isa.objj_msgSend1(newDataView, "setAutoresizingMask:", CPViewNotSizable));
    return newDataView;
}
,["id"]), new objj_method(sel_getUid("setIdentifier:"), function $CPTableColumn__setIdentifier_(self, _cmd, anIdentifier)
{
    self._identifier = anIdentifier;
}
,["void","id"]), new objj_method(sel_getUid("identifier"), function $CPTableColumn__identifier(self, _cmd)
{
    return self._identifier;
}
,["id"]), new objj_method(sel_getUid("setEditable:"), function $CPTableColumn__setEditable_(self, _cmd, shouldBeEditable)
{
    self._isEditable = shouldBeEditable;
}
,["void","BOOL"]), new objj_method(sel_getUid("isEditable"), function $CPTableColumn__isEditable(self, _cmd)
{
    return self._isEditable;
}
,["BOOL"]), new objj_method(sel_getUid("setSortDescriptorPrototype:"), function $CPTableColumn__setSortDescriptorPrototype_(self, _cmd, aSortDescriptor)
{
    self._sortDescriptorPrototype = aSortDescriptor;
}
,["void","CPSortDescriptor"]), new objj_method(sel_getUid("sortDescriptorPrototype"), function $CPTableColumn__sortDescriptorPrototype(self, _cmd)
{
    if (self._sortDescriptorPrototype)
        return self._sortDescriptorPrototype;
    var binderClass = ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_binderClassForBinding:", CPValueBinding)),
        binding = (binderClass == null ? null : binderClass.isa.objj_msgSend2(binderClass, "getBinding:forObject:", CPValueBinding, self));
    return (binding == null ? null : binding.isa.objj_msgSend0(binding, "_defaultSortDescriptorPrototype"));
    var ___r1;
}
,["CPSortDescriptor"]), new objj_method(sel_getUid("setHidden:"), function $CPTableColumn__setHidden_(self, _cmd, shouldBeHidden)
{
    shouldBeHidden = !!shouldBeHidden;
    if (self._isHidden === shouldBeHidden)
        return;
    self._isHidden = shouldBeHidden;
    ((___r1 = self.isa.objj_msgSend0(self, "headerView")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", shouldBeHidden));
    ((___r1 = self.isa.objj_msgSend0(self, "tableView")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_tableColumnVisibilityDidChange:", self));
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("isHidden"), function $CPTableColumn__isHidden(self, _cmd)
{
    return self._isHidden;
}
,["BOOL"]), new objj_method(sel_getUid("setHeaderToolTip:"), function $CPTableColumn__setHeaderToolTip_(self, _cmd, aToolTip)
{
    self._headerToolTip = aToolTip;
}
,["void","CPString"]), new objj_method(sel_getUid("headerToolTip"), function $CPTableColumn__headerToolTip(self, _cmd)
{
    return self._headerToolTip;
}
,["CPString"]), new objj_method(sel_getUid("_postDidResizeNotificationWithOldWidth:"), function $CPTableColumn___postDidResizeNotificationWithOldWidth_(self, _cmd, oldWidth)
{
    ((___r1 = self.isa.objj_msgSend0(self, "tableView")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_didResizeTableColumn:", self));
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "postNotificationName:object:userInfo:", CPTableViewColumnDidResizeNotification, self.isa.objj_msgSend0(self, "tableView"), objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", self, "CPTableColumn", oldWidth, "CPOldWidth")));
    var ___r1;
}
,["void","float"])]);
}{var the_class = objj_allocateClassPair(CPBinder, "CPTableColumnValueBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setValueFor:"), function $CPTableColumnValueBinder__setValueFor_(self, _cmd, aBinding)
{
    var tableView = ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "tableView")),
        column = ((___r1 = (tableView == null ? null : tableView.isa.objj_msgSend0(tableView, "tableColumns"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObjectIdenticalTo:", self._source)),
        rowIndexes = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(0, (tableView == null ? null : tableView.isa.objj_msgSend0(tableView, "numberOfRows")))),
        columnIndexes = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndex:", column);
    (tableView == null ? null : tableView.isa.objj_msgSend2(tableView, "reloadDataForRowIndexes:columnIndexes:", rowIndexes, columnIndexes));
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("_defaultSortDescriptorPrototype"), function $CPTableColumnValueBinder___defaultSortDescriptorPrototype(self, _cmd)
{
    if (!self.isa.objj_msgSend0(self, "createsSortDescriptor"))
        return nil;
    var keyPath = ((___r1 = self._info), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPObservedKeyPathKey)),
        dotIndex = keyPath.indexOf(".");
    if (dotIndex === CPNotFound)
        return nil;
    var firstPart = keyPath.substring(0, dotIndex),
        key = keyPath.substring(dotIndex + 1);
    return CPSortDescriptor.isa.objj_msgSend2(CPSortDescriptor, "sortDescriptorWithKey:ascending:", key, YES);
    var ___r1;
}
,["CPSortDescriptor"]), new objj_method(sel_getUid("createsSortDescriptor"), function $CPTableColumnValueBinder__createsSortDescriptor(self, _cmd)
{
    var options = ((___r1 = self._info), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPOptionsKey)),
        optionValue = (options == null ? null : options.isa.objj_msgSend1(options, "objectForKey:", CPCreatesSortDescriptorBindingOption));
    return optionValue === nil ? YES : (optionValue == null ? null : optionValue.isa.objj_msgSend0(optionValue, "boolValue"));
    var ___r1;
}
,["BOOL"])]);
}{
var the_class = objj_getClass("CPTableColumn")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTableColumn\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("bind:toObject:withKeyPath:options:"), function $CPTableColumn__bind_toObject_withKeyPath_options_(self, _cmd, aBinding, anObject, aKeyPath, options)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableColumn").super_class }, "bind:toObject:withKeyPath:options:", aBinding, anObject, aKeyPath, options);
    if (!(aBinding == null ? null : aBinding.isa.objj_msgSend1(aBinding, "isEqual:", "someListOfExceptedBindings(notAcceptedBindings)")))
    {
        var acIndex = aKeyPath.lastIndexOf("arrangedObjects."),
            arrayController = anObject;
        if (acIndex > 1)
        {
            var firstPart = aKeyPath.substring(0, acIndex - 1);
            arrayController = (anObject == null ? null : anObject.isa.objj_msgSend1(anObject, "valueForKeyPath:", firstPart));
        }
        ((___r1 = self.isa.objj_msgSend0(self, "tableView")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_establishBindingsIfUnbound:", arrayController));
    }
    var ___r1;
}
,["void","CPString","id","CPString","CPDictionary"]), new objj_method(sel_getUid("_prepareDataView:forRow:"), function $CPTableColumn___prepareDataView_forRow_(self, _cmd, aDataView, aRow)
{
    var bindingsDictionary = CPBinder.isa.objj_msgSend1(CPBinder, "allBindingsForObject:", self),
        keys = (bindingsDictionary == null ? null : bindingsDictionary.isa.objj_msgSend0(bindingsDictionary, "allKeys"));
    for (var i = 0, count = (keys == null ? null : keys.isa.objj_msgSend0(keys, "count")); i < count; i++)
    {
        var bindingName = keys[i],
            bindingPath = (aDataView == null ? null : aDataView.isa.objj_msgSend1(aDataView, "_replacementKeyPathForBinding:", bindingName)),
            binding = (bindingsDictionary == null ? null : bindingsDictionary.isa.objj_msgSend1(bindingsDictionary, "objectForKey:", bindingName)),
            bindingInfo = binding._info,
            destination = (bindingInfo == null ? null : bindingInfo.isa.objj_msgSend1(bindingInfo, "objectForKey:", CPObservedObjectKey)),
            keyPath = (bindingInfo == null ? null : bindingInfo.isa.objj_msgSend1(bindingInfo, "objectForKey:", CPObservedKeyPathKey)),
            dotIndex = keyPath.lastIndexOf("."),
            value;
        if (dotIndex === CPNotFound)
            value = ((___r1 = (destination == null ? null : destination.isa.objj_msgSend1(destination, "valueForKeyPath:", keyPath))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", aRow));
        else
        {
            var firstPart = keyPath.substring(0, dotIndex),
                secondPart = keyPath.substring(dotIndex + 1),
                firstValue = (destination == null ? null : destination.isa.objj_msgSend1(destination, "valueForKeyPath:", firstPart));
            if ((firstValue == null ? null : firstValue.isa.objj_msgSend1(firstValue, "isKindOfClass:", CPArray)))
                value = ((___r1 = (firstValue == null ? null : firstValue.isa.objj_msgSend1(firstValue, "objectAtIndex:", aRow))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKeyPath:", secondPart));
            else
                value = ((___r1 = (firstValue == null ? null : firstValue.isa.objj_msgSend1(firstValue, "valueForKeyPath:", secondPart))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", aRow));
        }
        value = (binding == null ? null : binding.isa.objj_msgSend2(binding, "transformValue:withOptions:", value, (bindingInfo == null ? null : bindingInfo.isa.objj_msgSend1(bindingInfo, "objectForKey:", CPOptionsKey))));
        (aDataView == null ? null : aDataView.isa.objj_msgSend2(aDataView, "setValue:forKey:", value, "objectValue"));
    }
    var ___r1;
}
,["void","CPView","unsigned"]), new objj_method(sel_getUid("_reverseSetDataView:forRow:"), function $CPTableColumn___reverseSetDataView_forRow_(self, _cmd, aDataView, aRow)
{
    var bindingsDictionary = CPBinder.isa.objj_msgSend1(CPBinder, "allBindingsForObject:", self),
        keys = (bindingsDictionary == null ? null : bindingsDictionary.isa.objj_msgSend0(bindingsDictionary, "allKeys")),
        newValue = (aDataView == null ? null : aDataView.isa.objj_msgSend1(aDataView, "valueForKey:", "objectValue"));
    for (var i = 0, count = (keys == null ? null : keys.isa.objj_msgSend0(keys, "count")); i < count; i++)
    {
        var bindingName = keys[i],
            bindingPath = (aDataView == null ? null : aDataView.isa.objj_msgSend1(aDataView, "_replacementKeyPathForBinding:", bindingName)),
            binding = (bindingsDictionary == null ? null : bindingsDictionary.isa.objj_msgSend1(bindingsDictionary, "objectForKey:", bindingName)),
            bindingInfo = binding._info,
            destination = (bindingInfo == null ? null : bindingInfo.isa.objj_msgSend1(bindingInfo, "objectForKey:", CPObservedObjectKey)),
            keyPath = (bindingInfo == null ? null : bindingInfo.isa.objj_msgSend1(bindingInfo, "objectForKey:", CPObservedKeyPathKey)),
            options = (bindingInfo == null ? null : bindingInfo.isa.objj_msgSend1(bindingInfo, "objectForKey:", CPOptionsKey)),
            dotIndex = keyPath.lastIndexOf(".");
        newValue = (binding == null ? null : binding.isa.objj_msgSend2(binding, "reverseTransformValue:withOptions:", newValue, options));
        if (dotIndex === CPNotFound)
            ((___r1 = (destination == null ? null : destination.isa.objj_msgSend1(destination, "valueForKeyPath:", keyPath))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "replaceObjectAtIndex:withObject:", aRow, newValue));
        else
        {
            var firstPart = keyPath.substring(0, dotIndex),
                secondPart = keyPath.substring(dotIndex + 1),
                firstValue = (destination == null ? null : destination.isa.objj_msgSend1(destination, "valueForKeyPath:", firstPart));
            if ((firstValue == null ? null : firstValue.isa.objj_msgSend1(firstValue, "isKindOfClass:", CPArray)))
                ((___r1 = (firstValue == null ? null : firstValue.isa.objj_msgSend1(firstValue, "objectAtIndex:", aRow))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forKeyPath:", newValue, secondPart));
            else
                ((___r1 = (firstValue == null ? null : firstValue.isa.objj_msgSend1(firstValue, "valueForKeyPath:", secondPart))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "replaceObjectAtIndex:withObject:", aRow, newValue));
        }
    }
    var ___r1;
}
,["void","CPView","unsigned"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_binderClassForBinding:"), function $CPTableColumn___binderClassForBinding_(self, _cmd, aBinding)
{
    if (aBinding == CPValueBinding)
        return CPTableColumnValueBinder.isa.objj_msgSend0(CPTableColumnValueBinder, "class");
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPTableColumn").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"])]);
}var CPTableColumnIdentifierKey = "CPTableColumnIdentifierKey",
    CPTableColumnHeaderViewKey = "CPTableColumnHeaderViewKey",
    CPTableColumnDataViewKey = "CPTableColumnDataViewKey",
    CPTableColumnWidthKey = "CPTableColumnWidthKey",
    CPTableColumnMinWidthKey = "CPTableColumnMinWidthKey",
    CPTableColumnMaxWidthKey = "CPTableColumnMaxWidthKey",
    CPTableColumnResizingMaskKey = "CPTableColumnResizingMaskKey",
    CPTableColumnIsHiddenKey = "CPTableColumnIsHiddenKey",
    CPSortDescriptorPrototypeKey = "CPSortDescriptorPrototypeKey",
    CPTableColumnIsEditableKey = "CPTableColumnIsEditableKey";
{
var the_class = objj_getClass("CPTableColumn")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTableColumn\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPTableColumn__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableColumn").super_class }, "init");
    if (self)
    {
        self._dataViewData = nil;
        self._width = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", CPTableColumnWidthKey));
        self._minWidth = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", CPTableColumnMinWidthKey));
        self._maxWidth = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", CPTableColumnMaxWidthKey));
        (self == null ? null : self.isa.objj_msgSend1(self, "setIdentifier:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTableColumnIdentifierKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setHeaderView:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTableColumnHeaderViewKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setDataView:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTableColumnDataViewKey))));
        self._resizingMask = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPTableColumnResizingMaskKey));
        self._isHidden = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPTableColumnIsHiddenKey));
        self._isEditable = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPTableColumnIsEditableKey));
        self._sortDescriptorPrototype = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPSortDescriptorPrototypeKey));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPTableColumn__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._identifier, CPTableColumnIdentifierKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeFloat:forKey:", self._width, CPTableColumnWidthKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeFloat:forKey:", self._minWidth, CPTableColumnMinWidthKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeFloat:forKey:", self._maxWidth, CPTableColumnMaxWidthKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._headerView, CPTableColumnHeaderViewKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._dataView, CPTableColumnDataViewKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._resizingMask, CPTableColumnResizingMaskKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._isHidden, CPTableColumnIsHiddenKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._isEditable, CPTableColumnIsEditableKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._sortDescriptorPrototype, CPSortDescriptorPrototypeKey));
}
,["void","CPCoder"])]);
}{
var the_class = objj_getClass("CPTableColumn")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTableColumn\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setHeaderCell:"), function $CPTableColumn__setHeaderCell_(self, _cmd, aView)
{
    CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPUnsupportedMethodException, "setHeaderCell: is not supported. Use -setHeaderView:aView instead.");
}
,["void","CPView"]), new objj_method(sel_getUid("headerCell"), function $CPTableColumn__headerCell(self, _cmd)
{
    CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPUnsupportedMethodException, "headCell is not supported. Use -headerView instead.");
}
,["CPView"]), new objj_method(sel_getUid("setDataCell:"), function $CPTableColumn__setDataCell_(self, _cmd, aView)
{
    CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPUnsupportedMethodException, "setDataCell: is not supported. Use -setDataView:aView instead.");
}
,["void","CPView"]), new objj_method(sel_getUid("dataCell"), function $CPTableColumn__dataCell(self, _cmd)
{
    CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPUnsupportedMethodException, "dataCell is not supported. Use -dataView instead.");
}
,["CPView"]), new objj_method(sel_getUid("dataCellForRow:"), function $CPTableColumn__dataCellForRow_(self, _cmd, row)
{
    CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPUnsupportedMethodException, "dataCellForRow: is not supported. Use -dataViewForRow:row instead.");
}
,["id","CPInteger"])]);
}