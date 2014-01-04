@STATIC;1.0;I;21;Foundation/CPObject.ji;13;CPTextField.ji;15;_CPMenuWindow.jt;10894;


objj_executeFile("Foundation/CPObject.j", NO);

objj_executeFile("CPTextField.j", YES);
objj_executeFile("_CPMenuWindow.j", YES);


var _CPAutocompleteMenuMaximumHeight = 307;




{var the_class = objj_allocateClassPair(CPObject, "_CPAutocompleteMenu"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("textField"), new objj_ivar("contentArray"), new objj_ivar("widestItemWidth"), new objj_ivar("_menuWindow"), new objj_ivar("scrollView"), new objj_ivar("tableView"), new objj_ivar("_showCompletionsTimer")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("textField"), function $_CPAutocompleteMenu__textField(self, _cmd)
{ with(self)
{
return textField;
}
},["id"]),
new objj_method(sel_getUid("setTextField:"), function $_CPAutocompleteMenu__setTextField_(self, _cmd, newValue)
{ with(self)
{
textField = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("contentArray"), function $_CPAutocompleteMenu__contentArray(self, _cmd)
{ with(self)
{
return contentArray;
}
},["id"]),
new objj_method(sel_getUid("setContentArray:"), function $_CPAutocompleteMenu__setContentArray_(self, _cmd, newValue)
{ with(self)
{
contentArray = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithTextField:"), function $_CPAutocompleteMenu__initWithTextField_(self, _cmd, aTextField)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPAutocompleteMenu").super_class }, "init"))
    {
        textField = aTextField;

        _menuWindow = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", CGRectMake(0, 0, 100, 100), CPBorderlessWindowMask);

        objj_msgSend(_menuWindow, "setLevel:", CPPopUpMenuWindowLevel);
        objj_msgSend(_menuWindow, "setHasShadow:", YES);
        objj_msgSend(_menuWindow, "setShadowStyle:", CPMenuWindowShadowStyle);
        objj_msgSend(_menuWindow, "setAcceptsMouseMovedEvents:", NO);
        objj_msgSend(_menuWindow, "setBackgroundColor:", objj_msgSend(_CPMenuWindow, "backgroundColorForBackgroundStyle:", _CPMenuWindowPopUpBackgroundStyle));

        var contentView = objj_msgSend(_menuWindow, "contentView");

        scrollView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(scrollView, "setAutohidesScrollers:", YES);
        objj_msgSend(scrollView, "setHasHorizontalScroller:", NO);
        objj_msgSend(contentView, "addSubview:", scrollView);

        tableView = objj_msgSend(objj_msgSend(_CPNonFirstResponderTableView, "alloc"), "initWithFrame:", CPRectMakeZero());

        var tableColumn = objj_msgSend(CPTableColumn, "new");
        objj_msgSend(tableColumn, "setResizingMask:", CPTableColumnAutoresizingMask);
        objj_msgSend(tableView, "addTableColumn:", tableColumn);

        objj_msgSend(tableView, "setDataSource:", self);
        objj_msgSend(tableView, "setDelegate:", self);
        objj_msgSend(tableView, "setAllowsMultipleSelection:", NO);
        objj_msgSend(tableView, "setHeaderView:", nil);
        objj_msgSend(tableView, "setCornerView:", nil);
        objj_msgSend(tableView, "setRowHeight:", 24.0);
        objj_msgSend(tableView, "setGridStyleMask:", CPTableViewSolidHorizontalGridLineMask);
        objj_msgSend(tableView, "setBackgroundColor:", objj_msgSend(CPColor, "clearColor"));
        objj_msgSend(tableView, "setGridColor:", objj_msgSend(CPColor, "colorWithRed:green:blue:alpha:", 242.0 / 255.0, 243.0 / 255.0, 245.0 / 255.0, 1.0));

        objj_msgSend(scrollView, "setDocumentView:", tableView);
    }

    return self;
}
},["id","CPTextField"]), new objj_method(sel_getUid("setContentArray:"), function $_CPAutocompleteMenu__setContentArray_(self, _cmd, anArray)
{ with(self)
{
    if (contentArray === anArray || objj_msgSend(contentArray, "isEqualToArray:", anArray))
        return;

    contentArray = objj_msgSend(anArray, "copy");


    if (!objj_msgSend(contentArray, "count"))
        objj_msgSend(self, "_hideCompletions");

    widestItemWidth = CPNotFound;

    objj_msgSend(tableView, "reloadData");
    objj_msgSend(self, "layoutSubviews");
}
},["void","CPArray"]), new objj_method(sel_getUid("setIndexOfSelectedItem:"), function $_CPAutocompleteMenu__setIndexOfSelectedItem_(self, _cmd, anIndex)
{ with(self)
{
    objj_msgSend(tableView, "selectRowIndexes:byExtendingSelection:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", anIndex), NO);
    objj_msgSend(tableView, "scrollRowToVisible:", anIndex);
}
},["void","int"]), new objj_method(sel_getUid("indexOfSelectedItem"), function $_CPAutocompleteMenu__indexOfSelectedItem(self, _cmd)
{ with(self)
{
    return objj_msgSend(tableView, "selectedRow");
}
},["int"]), new objj_method(sel_getUid("selectedItem"), function $_CPAutocompleteMenu__selectedItem(self, _cmd)
{ with(self)
{
    return contentArray ? contentArray[objj_msgSend(tableView, "selectedRow")] : nil;
}
},["CPString"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPAutocompleteMenu__layoutSubviews(self, _cmd)
{ with(self)
{
    var frame = objj_msgSend(textField, "frame"),
        origin = frame.origin,
        tableColumn = objj_msgSend(objj_msgSend(tableView, "tableColumns"), "firstObject");

    if (objj_msgSend(textField, "respondsToSelector:", sel_getUid("_completionOrigin:")))
        origin = objj_msgSend(textField, "_completionOrigin:", self);

    if (widestItemWidth === CPNotFound)
    {


        var dataView = objj_msgSend(tableColumn, "dataView"),
            fontNormal = objj_msgSend(dataView, "valueForThemeAttribute:inState:", "font", CPThemeStateTableDataView),
            fontSelected = objj_msgSend(dataView, "valueForThemeAttribute:inState:", "font", CPThemeStateTableDataView | CPThemeStateSelectedTableDataView),
            contentInsetNormal = objj_msgSend(dataView, "valueForThemeAttribute:inState:", "content-inset", CPThemeStateTableDataView),
            contentInsetSelected = objj_msgSend(dataView, "valueForThemeAttribute:inState:", "content-inset", CPThemeStateTableDataView | CPThemeStateSelectedTableDataView);

        var mergedString = contentArray.join("\n");

        widestItemWidth = MAX(objj_msgSend(mergedString, "sizeWithFont:", fontNormal).width + contentInsetNormal.left + contentInsetNormal.right, objj_msgSend(mergedString, "sizeWithFont:", fontSelected).width + contentInsetSelected.left + contentInsetSelected.right) + objj_msgSend(tableView, "intercellSpacing").width + 2.0 + 5.0;

    }

    var frameOrigin = objj_msgSend(textField, "convertPoint:toView:", origin, nil),
        screenSize = objj_msgSend((objj_msgSend(CPPlatform, "isBrowser") ? objj_msgSend(_menuWindow, "platformWindow") : objj_msgSend(_menuWindow, "screen")), "visibleFrame").size,
        availableWidth = screenSize.width - frameOrigin.x,
        availableHeight = screenSize.height - frameOrigin.y,
        width = MIN(widestItemWidth, availableWidth),
        spacingHeight = objj_msgSend(tableView, "intercellSpacing").height,
        height = MIN(MIN(spacingHeight + objj_msgSend(contentArray, "count") * (objj_msgSend(tableView, "rowHeight") + spacingHeight), _CPAutocompleteMenuMaximumHeight), availableHeight),
        newFrame = CGRectMake(frameOrigin.x, frameOrigin.y, width, height);

    newFrame = objj_msgSend(_menuWindow, "frameRectForContentRect:", newFrame);
    objj_msgSend(_menuWindow, "setFrame:", newFrame);

    var scrollFrame = CGRectInset(objj_msgSend(objj_msgSend(_menuWindow, "contentView"), "bounds"), 1.0, 1.0);
    objj_msgSend(scrollView, "setFrame:", scrollFrame);

    objj_msgSend(tableColumn, "setWidth:", objj_msgSend(objj_msgSend(scrollView, "contentView"), "frame").size.width);
}
},["void"]), new objj_method(sel_getUid("_showCompletions:"), function $_CPAutocompleteMenu___showCompletions_(self, _cmd, timer)
{ with(self)
{
    var indexOfSelectedItem = objj_msgSend(self, "indexOfSelectedItem");

    objj_msgSend(self, "setContentArray:", objj_msgSend(textField, "_completionsForSubstring:indexOfToken:indexOfSelectedItem:", objj_msgSend(textField, "_inputElement").value, 0, indexOfSelectedItem));

    if (!objj_msgSend(contentArray, "count"))
        return;


    objj_msgSend(self, "setIndexOfSelectedItem:", indexOfSelectedItem);

    objj_msgSend(textField, "setThemeState:", CPThemeStateAutocompleting);
    objj_msgSend(_menuWindow, "orderFront:", self);

    objj_msgSend(self, "layoutSubviews");
}
},["void","CPTimer"]), new objj_method(sel_getUid("_delayedShowCompletions"), function $_CPAutocompleteMenu___delayedShowCompletions(self, _cmd)
{ with(self)
{
    var completionDelay = 0.5;

    if (objj_msgSend(textField, "respondsToSelector:", sel_getUid("completionDelay")))
        completionDelay = objj_msgSend(textField, "completionDelay");

    _showCompletionsTimer = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", completionDelay, self, sel_getUid("_showCompletions:"), nil, NO);
}
},["void"]), new objj_method(sel_getUid("_hideCompletions"), function $_CPAutocompleteMenu___hideCompletions(self, _cmd)
{ with(self)
{
    objj_msgSend(_showCompletionsTimer, "invalidate");
    _showCompletionsTimer = nil;

    objj_msgSend(textField, "unsetThemeState:", CPThemeStateAutocompleting);
    objj_msgSend(_menuWindow, "orderOut:", self);
    objj_msgSend(self, "layoutSubviews");
}
},["void"]), new objj_method(sel_getUid("selectNext"), function $_CPAutocompleteMenu__selectNext(self, _cmd)
{ with(self)
{
    var index = objj_msgSend(self, "indexOfSelectedItem") + 1;

    if (index >= objj_msgSend(contentArray, "count"))
        return;

    objj_msgSend(self, "setIndexOfSelectedItem:", index);
}
},["void"]), new objj_method(sel_getUid("selectPrevious"), function $_CPAutocompleteMenu__selectPrevious(self, _cmd)
{ with(self)
{
    var index = objj_msgSend(self, "indexOfSelectedItem") - 1;

    if (index < 0)
        return;

    objj_msgSend(self, "setIndexOfSelectedItem:", index);
}
},["void"]), new objj_method(sel_getUid("numberOfRowsInTableView:"), function $_CPAutocompleteMenu__numberOfRowsInTableView_(self, _cmd, tableView)
{ with(self)
{
    return objj_msgSend(contentArray, "count");
}
},["int","CPTableView"]), new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"), function $_CPAutocompleteMenu__tableView_objectValueForTableColumn_row_(self, _cmd, tableView, tableColumn, row)
{ with(self)
{
    return objj_msgSend(contentArray, "objectAtIndex:", row);
}
},["void","CPTableView","CPTableColumn","int"])]);
}


{var the_class = objj_allocateClassPair(CPTableView, "_CPNonFirstResponderTableView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("acceptsFirstResponder"), function $_CPNonFirstResponderTableView__acceptsFirstResponder(self, _cmd)
{ with(self)
{
    return NO;
}
},["BOOL"])]);
}

