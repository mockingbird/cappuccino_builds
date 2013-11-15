@STATIC;1.0;i;24;CPRuleEditor_Constants.ji;24;_CPRuleEditorViewSlice.ji;26;_CPRuleEditorPopUpButton.jt;23160;objj_executeFile("CPRuleEditor_Constants.j", YES);objj_executeFile("_CPRuleEditorViewSlice.j", YES);objj_executeFile("_CPRuleEditorPopUpButton.j", YES);var CONTROL_HEIGHT = 16.,
    BUTTON_HEIGHT = 16.;
{var the_class = objj_allocateClassPair(_CPRuleEditorViewSlice, "_CPRuleEditorViewSliceRow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_ruleOptionViews"), new objj_ivar("_ruleOptionFrames"), new objj_ivar("_correspondingRuleItems"), new objj_ivar("_ruleOptionInitialViewFrames"), new objj_ivar("_addButton"), new objj_ivar("_subtractButton"), new objj_ivar("_rowType"), new objj_ivar("_plusButtonRowType")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_rowType"), function $_CPRuleEditorViewSliceRow___rowType(self, _cmd)
{
    return self._rowType;
}
,["CPRuleEditorRowType"]), new objj_method(sel_getUid("_setRowType:"), function $_CPRuleEditorViewSliceRow___setRowType_(self, _cmd, newValue)
{
    self._rowType = newValue;
}
,["void","CPRuleEditorRowType"]), new objj_method(sel_getUid("initWithFrame:ruleEditorView:"), function $_CPRuleEditorViewSliceRow__initWithFrame_ruleEditorView_(self, _cmd, frame, editor)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorViewSliceRow").super_class }, "initWithFrame:ruleEditorView:", frame, editor))
        objj_msgSend(self, "_initShared");
    return self;
}
,["id","CGRect","id"]), new objj_method(sel_getUid("_initShared"), function $_CPRuleEditorViewSliceRow___initShared(self, _cmd)
{
    self._correspondingRuleItems = objj_msgSend(objj_msgSend(CPMutableArray, "alloc"), "init");
    self._ruleOptionFrames = objj_msgSend(objj_msgSend(CPMutableArray, "alloc"), "init");
    self._ruleOptionInitialViewFrames = objj_msgSend(objj_msgSend(CPMutableArray, "alloc"), "init");
    self._ruleOptionViews = objj_msgSend(objj_msgSend(CPMutableArray, "alloc"), "init");
    self._editable = objj_msgSend(self._ruleEditor, "isEditable");
    self._addButton = objj_msgSend(self, "_createAddRowButton");
    self._subtractButton = objj_msgSend(self, "_createDeleteRowButton");
    objj_msgSend(self._addButton, "setToolTip:", objj_msgSend(self._ruleEditor, "_toolTipForAddSimpleRowButton"));
    objj_msgSend(self._subtractButton, "setToolTip:", objj_msgSend(self._ruleEditor, "_toolTipForDeleteRowButton"));
    objj_msgSend(self._addButton, "setHidden:", !self._editable);
    objj_msgSend(self._subtractButton, "setHidden:", !self._editable);
    objj_msgSend(self, "addSubview:", self._addButton);
    objj_msgSend(self, "addSubview:", self._subtractButton);
    objj_msgSend(self, "setAutoresizingMask:", CPViewWidthSizable);
    var center = objj_msgSend(CPNotificationCenter, "defaultCenter");
    objj_msgSend(center, "addObserver:selector:name:object:", self, sel_getUid("_textDidChange:"), CPControlTextDidChangeNotification, nil);
}
,["void"]), new objj_method(sel_getUid("_createRowButton"), function $_CPRuleEditorViewSliceRow___createRowButton(self, _cmd)
{
    var button = objj_msgSend(objj_msgSend(_CPRuleEditorButton, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(button, "setFont:", objj_msgSend(CPFont, "boldFontWithName:size:", "Apple Symbol", 12.0));
    objj_msgSend(button, "setTextColor:", objj_msgSend(CPColor, "colorWithWhite:alpha:", 150 / 255, 1));
    objj_msgSend(button, "setAlignment:", CPCenterTextAlignment);
    objj_msgSend(button, "setAutoresizingMask:", CPViewMinXMargin);
    objj_msgSend(button, "setImagePosition:", CPImageOnly);
    return button;
}
,["CPButton"]), new objj_method(sel_getUid("_createAddRowButton"), function $_CPRuleEditorViewSliceRow___createAddRowButton(self, _cmd)
{
    var button = objj_msgSend(self, "_createRowButton");
    objj_msgSend(button, "setImage:", objj_msgSend(self._ruleEditor, "_addImage"));
    objj_msgSend(button, "setAction:", sel_getUid("_addOption:"));
    objj_msgSend(button, "setTarget:", self);
    return button;
}
,["CPButton"]), new objj_method(sel_getUid("_createDeleteRowButton"), function $_CPRuleEditorViewSliceRow___createDeleteRowButton(self, _cmd)
{
    var button = objj_msgSend(self, "_createRowButton");
    objj_msgSend(button, "setImage:", objj_msgSend(self._ruleEditor, "_removeImage"));
    objj_msgSend(button, "setAction:", sel_getUid("_deleteOption:"));
    objj_msgSend(button, "setTarget:", self);
    return button;
}
,["CPButton"]), new objj_method(sel_getUid("_createMenuItemWithTitle:"), function $_CPRuleEditorViewSliceRow___createMenuItemWithTitle_(self, _cmd, title)
{
    title = objj_msgSend(objj_msgSend(self._ruleEditor, "standardLocalizer"), "localizedStringForString:", title);
    var mItem = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", title, nil, "");
    return mItem;
}
,["CPMenuItem","CPString"]), new objj_method(sel_getUid("_createPopUpButtonWithItems:selectedItemIndex:"), function $_CPRuleEditorViewSliceRow___createPopUpButtonWithItems_selectedItemIndex_(self, _cmd, itemsArray, index)
{
    var title = objj_msgSend(objj_msgSend(itemsArray, "objectAtIndex:", index), "title"),
        font = objj_msgSend(self._ruleEditor, "font"),
        width = objj_msgSend(title, "sizeWithFont:", font).width + 20,
        rect = CGRectMake(0, 0, width - width % 40 + 80, CONTROL_HEIGHT),
        popup = objj_msgSend(objj_msgSend(_CPRuleEditorPopUpButton, "alloc"), "initWithFrame:", rect);
    objj_msgSend(popup, "setTextColor:", objj_msgSend(CPColor, "colorWithWhite:alpha:", 101 / 255, 1));
    objj_msgSend(popup, "setValue:forThemeAttribute:", font, "font");
    var count = objj_msgSend(itemsArray, "count");
    for (var i = 0; i < count; i++)
        objj_msgSend(popup, "addItem:", objj_msgSend(itemsArray, "objectAtIndex:", i));
    objj_msgSend(popup, "selectItemAtIndex:", index);
    return popup;
}
,["CPPopUpButton","CPArray","int"]), new objj_method(sel_getUid("_createMenuSeparatorItem"), function $_CPRuleEditorViewSliceRow___createMenuSeparatorItem(self, _cmd)
{
    return objj_msgSend(CPMenuItem, "separatorItem");
}
,["CPMenuItem"]), new objj_method(sel_getUid("_createStaticTextFieldWithStringValue:"), function $_CPRuleEditorViewSliceRow___createStaticTextFieldWithStringValue_(self, _cmd, text)
{
    var textField = objj_msgSend(objj_msgSend(_CPRuleEditorTextField, "alloc"), "initWithFrame:", CGRectMakeZero()),
        ruleEditorFont = objj_msgSend(self._ruleEditor, "font"),
        font = objj_msgSend(CPFont, "fontWithName:size:", objj_msgSend(ruleEditorFont, "familyName"), objj_msgSend(ruleEditorFont, "size") + 2),
        localizedText = objj_msgSend(objj_msgSend(self._ruleEditor, "standardLocalizer"), "localizedStringForString:", text),
        size = objj_msgSend(localizedText, "sizeWithFont:", font);
    objj_msgSend(textField, "setFrameSize:", CGSizeMake(size.width + 4, CONTROL_HEIGHT + 2));
    objj_msgSend(textField, "setValue:forThemeAttribute:", font, "font");
    objj_msgSend(textField, "setStringValue:", localizedText);
    return textField;
}
,["_CPRuleEditorTextField","CPString"]), new objj_method(sel_getUid("_addOption:"), function $_CPRuleEditorViewSliceRow___addOption_(self, _cmd, sender)
{
    if (self._rowIndex == objj_msgSend(self._ruleEditor, "numberOfRows") - 1)
        objj_msgSend(self, "setNeedsDisplay:", YES);
    var type = self._plusButtonRowType;
    if (objj_msgSend(self._ruleEditor, "nestingMode") == CPRuleEditorNestingModeCompound && objj_msgSend(objj_msgSend(CPApp, "currentEvent"), "modifierFlags") & CPAlternateKeyMask)
        type = CPRuleEditorRowTypeCompound;
    objj_msgSend(self._ruleEditor, "_addOptionFromSlice:ofRowType:", self, type);
}
,["void","id"]), new objj_method(sel_getUid("_deleteOption:"), function $_CPRuleEditorViewSliceRow___deleteOption_(self, _cmd, sender)
{
    objj_msgSend(self._ruleEditor, "_deleteSlice:", self);
}
,["void","id"]), new objj_method(sel_getUid("_ruleOptionPopupChangedAction:"), function $_CPRuleEditorViewSliceRow___ruleOptionPopupChangedAction_(self, _cmd, sender)
{
    var layoutdict = objj_msgSend(sender, "representedObject"),
        newItem = objj_msgSend(layoutdict, "objectForKey:", "item"),
        indexInCriteria = objj_msgSend(layoutdict, "objectForKey:", "indexInCriteria"),
        oldItem = objj_msgSend(self._correspondingRuleItems, "objectAtIndex:", indexInCriteria);
    if (!objj_msgSend(newItem, "isEqual:", oldItem))
    {
        objj_msgSend(self._correspondingRuleItems, "replaceObjectAtIndex:withObject:", indexInCriteria, newItem);
        objj_msgSend(self._ruleEditor, "_changedItem:toItem:inRow:atCriteriaIndex:", oldItem, newItem, self._rowIndex, indexInCriteria);
    }
}
,["void","CPMenuItem"]), new objj_method(sel_getUid("validateMenuItem:"), function $_CPRuleEditorViewSliceRow__validateMenuItem_(self, _cmd, menuItem)
{
    return objj_msgSend(self._ruleEditor, "_validateItem:value:inRow:", menuItem, objj_msgSend(objj_msgSend(menuItem, "representedObject"), "valueForKey:", "item"), self._rowIndex);
}
,["BOOL","CPMenuItem"]), new objj_method(sel_getUid("_emptyRulePartSubviews"), function $_CPRuleEditorViewSliceRow___emptyRulePartSubviews(self, _cmd)
{
    var count = objj_msgSend(self._ruleOptionViews, "count");
    while (count--)
        objj_msgSend(self._ruleOptionViews[count], "removeFromSuperview");
    objj_msgSend(self._ruleOptionViews, "removeAllObjects");
    objj_msgSend(self._ruleOptionFrames, "removeAllObjects");
    objj_msgSend(self._ruleOptionInitialViewFrames, "removeAllObjects");
}
,["void"]), new objj_method(sel_getUid("_reconfigureSubviews"), function $_CPRuleEditorViewSliceRow___reconfigureSubviews(self, _cmd)
{
    var ruleItems,
        criteria,
        repObject,
        menuItem,
        ruleView,
        criterion,
        parent,
        numberOfCriteria,
        numberOfChildren,
        firstResponderIndex,
        ruleItems = objj_msgSend(CPMutableArray, "array"),
        responder = objj_msgSend(objj_msgSend(self, "window"), "firstResponder");
    objj_msgSend(self, "_emptyRulePartSubviews");
    criteria = objj_msgSend(self._ruleEditor, "criteriaForRow:", self._rowIndex);
    numberOfCriteria = objj_msgSend(criteria, "count");
    firstResponderIndex = numberOfCriteria - 1;
    if (responder)
        firstResponderIndex = objj_msgSend(self._ruleOptionViews, "indexOfObjectIdenticalTo:", responder);
    for (var i = 0; i < numberOfCriteria; i++)
    {
        ruleView = nil;
        parent = nil;
        criterion = objj_msgSend(criteria, "objectAtIndex:", i);
        if (i > 0)
            parent = objj_msgSend(criteria, "objectAtIndex:", i - 1);
        var childItems = [],
            childValues = [];
        objj_msgSend(self._ruleEditor, "_getAllAvailableItems:values:asChildrenOfItem:inRow:", childItems, childValues, parent, self._rowIndex);
        numberOfChildren = objj_msgSend(childItems, "count");
        if (numberOfChildren > 1)
        {
            var menuItems = objj_msgSend(CPMutableArray, "arrayWithCapacity:", numberOfChildren),
                selectedIndex = objj_msgSend(childItems, "indexOfObject:", criterion);
            if (selectedIndex == CPNotFound)
                break;
            for (var j = 0; j < numberOfChildren; ++j)
            {
                var childItem = objj_msgSend(childItems, "objectAtIndex:", j),
                    childValue = objj_msgSend(childValues, "objectAtIndex:", j);
                if (objj_msgSend(childValue, "isKindOfClass:", objj_msgSend(CPMenuItem, "class")))
                {
                    objj_msgSend(objj_msgSend(childValue, "menu"), "removeItem:", childValue);
                    menuItem = childValue;
                }
                else
                {
                    if (objj_msgSend(childValue, "isEqualToString:", ""))
                        menuItem = objj_msgSend(self, "_createMenuSeparatorItem");
                    else
                    {
                        menuItem = objj_msgSend(self, "_createMenuItemWithTitle:", childValue);
                        objj_msgSend(menuItem, "setTarget:", self);
                        objj_msgSend(menuItem, "setAction:", sel_getUid("_ruleOptionPopupChangedAction:"));
                    }
                }
                repObject = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", childItem, "item", childValue, "value", i, "indexInCriteria");
                objj_msgSend(menuItem, "setRepresentedObject:", repObject);
                objj_msgSend(menuItems, "addObject:", menuItem);
            }
            ruleView = objj_msgSend(self, "_createPopUpButtonWithItems:selectedItemIndex:", menuItems, selectedIndex);
        }
        else
        {
            var value = objj_msgSend(childValues, "objectAtIndex:", 0),
                type = objj_msgSend(value, "valueType");
            if (type === 0)
                ruleView = objj_msgSend(self, "_createStaticTextFieldWithStringValue:", value);
            else
            {
                if (type !== 1)
                {
                    objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "Display value must be a string or a menu item");
                    continue;
                }
                ruleView = value;
                objj_msgSend(ruleView, "setTarget:", self);
                objj_msgSend(ruleView, "setAction:", sel_getUid("_sendRuleAction:"));
                if (objj_msgSend(ruleView, "respondsToSelector:", sel_getUid("setDelegate:")))
                    objj_msgSend(ruleView, "setDelegate:", self);
            }
        }
        if (ruleView != nil)
        {
            objj_msgSend(self._ruleOptionViews, "addObject:", ruleView);
            var frame = objj_msgSend(ruleView, "frame");
            objj_msgSend(self._ruleOptionInitialViewFrames, "addObject:", frame);
            objj_msgSend(self._ruleOptionFrames, "addObject:", frame);
            if (!criterion)
                criterion = objj_msgSend(CPNull, "null");
            objj_msgSend(ruleItems, "addObject:", criterion);
        }
    }
    objj_msgSend(self._correspondingRuleItems, "setArray:", ruleItems);
    if (!self._editable)
        objj_msgSend(self, "_updateEnabledStateForSubviews");
    objj_msgSend(self, "_relayoutSubviewsWidthChanged:", YES);
    if (firstResponderIndex != CPNotFound)
    {
        var aView = objj_msgSend(self._ruleOptionViews, "objectAtIndex:", firstResponderIndex);
        objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", aView);
    }
}
,["void"]), new objj_method(sel_getUid("_updateEnabledStateForSubviews"), function $_CPRuleEditorViewSliceRow___updateEnabledStateForSubviews(self, _cmd)
{
    objj_msgSend(self._ruleOptionViews, "makeObjectsPerformSelector:withObject:", sel_getUid("setEnabled:"), NO);
}
,["void"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPRuleEditorViewSliceRow__layoutSubviews(self, _cmd)
{
    objj_msgSend(self, "_relayoutSubviewsWidthChanged:", YES);
}
,["void"]), new objj_method(sel_getUid("_relayoutSubviewsWidthChanged:"), function $_CPRuleEditorViewSliceRow___relayoutSubviewsWidthChanged_(self, _cmd, widthChanged)
{
    var optionViewOriginX,
        leftHorizontalPadding,
        leftButtonMinX,
        rowHeight = objj_msgSend(self._ruleEditor, "rowHeight"),
        count = objj_msgSend(self._ruleOptionViews, "count"),
        sliceFrame = objj_msgSend(self, "frame"),
        buttonFrame = CGRectMake(CGRectGetWidth(sliceFrame) - BUTTON_HEIGHT - objj_msgSend(self, "_rowButtonsRightHorizontalPadding"), (objj_msgSend(self._ruleEditor, "rowHeight") - BUTTON_HEIGHT) / 2 - 2, BUTTON_HEIGHT, BUTTON_HEIGHT);
    objj_msgSend(self._addButton, "setFrame:", buttonFrame);
    buttonFrame.origin.x -= BUTTON_HEIGHT + objj_msgSend(self, "_rowButtonsInterviewHorizontalPadding");
    objj_msgSend(self._subtractButton, "setFrame:", buttonFrame);
    if (widthChanged)
    {
        optionViewOriginX = objj_msgSend(self, "_leftmostViewFixedHorizontalPadding") + objj_msgSend(self, "_indentationHorizontalPadding") * self._indentation;
        leftHorizontalPadding = objj_msgSend(self, "_rowButtonsLeftHorizontalPadding");
        leftButtonMinX = CGRectGetMinX(buttonFrame);
    }
    for (var i = 0; i < count; i++)
    {
        var ruleOptionView = self._ruleOptionViews[i],
            optionFrame = self._ruleOptionFrames[i];
        optionFrame.origin.y = (rowHeight - CGRectGetHeight(optionFrame)) / 2 - 2;
        if (widthChanged)
        {
            optionFrame.origin.x = optionViewOriginX;
            if (i == count - 1 && !objj_msgSend(self, "_isRulePopup:", ruleOptionView))
            {
                var initialFrame = self._ruleOptionInitialViewFrames[i];
                optionFrame.size.width = MIN(CGRectGetWidth(initialFrame), leftButtonMinX - leftHorizontalPadding - optionViewOriginX);
            }
        }
        objj_msgSend(ruleOptionView, "setFrame:", optionFrame);
        objj_msgSend(self, "addSubview:", ruleOptionView);
        if (widthChanged)
            optionViewOriginX += CGRectGetWidth(optionFrame) + objj_msgSend(self, "_interviewHorizontalPadding");
    }
}
,["void","BOOL"]), new objj_method(sel_getUid("_updateButtonVisibilities"), function $_CPRuleEditorViewSliceRow___updateButtonVisibilities(self, _cmd)
{
    objj_msgSend(self._addButton, "setHidden:", objj_msgSend(self._ruleEditor, "_shouldHideAddButtonForSlice:", self));
    objj_msgSend(self._subtractButton, "setHidden:", objj_msgSend(self._ruleEditor, "_shouldHideSubtractButtonForSlice:", self));
}
,["void"]), new objj_method(sel_getUid("_configurePlusButtonByRowType:"), function $_CPRuleEditorViewSliceRow___configurePlusButtonByRowType_(self, _cmd, type)
{
    objj_msgSend(self, "_setRowTypeToAddFromPlusButton:", type);
}
,["void","CPRuleEditorRowType"]), new objj_method(sel_getUid("setEditable:"), function $_CPRuleEditorViewSliceRow__setEditable_(self, _cmd, value)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorViewSliceRow").super_class }, "setEditable:", value);
    objj_msgSend(self, "_updateButtonVisibilities");
}
,["void","BOOL"]), new objj_method(sel_getUid("_alignmentGridWidth"), function $_CPRuleEditorViewSliceRow___alignmentGridWidth(self, _cmd)
{
    return objj_msgSend(self._ruleEditor, "_alignmentGridWidth");
}
,["float"]), new objj_method(sel_getUid("_indentationHorizontalPadding"), function $_CPRuleEditorViewSliceRow___indentationHorizontalPadding(self, _cmd)
{
    return 30.;
}
,["float"]), new objj_method(sel_getUid("_interviewHorizontalPadding"), function $_CPRuleEditorViewSliceRow___interviewHorizontalPadding(self, _cmd)
{
    return 6.;
}
,["float"]), new objj_method(sel_getUid("_leftmostViewFixedHorizontalPadding"), function $_CPRuleEditorViewSliceRow___leftmostViewFixedHorizontalPadding(self, _cmd)
{
    return 7.;
}
,["float"]), new objj_method(sel_getUid("_minimumVerticalPopupPadding"), function $_CPRuleEditorViewSliceRow___minimumVerticalPopupPadding(self, _cmd)
{
    return 2.;
}
,["float"]), new objj_method(sel_getUid("_rowButtonsInterviewHorizontalPadding"), function $_CPRuleEditorViewSliceRow___rowButtonsInterviewHorizontalPadding(self, _cmd)
{
    return 6.;
}
,["float"]), new objj_method(sel_getUid("_rowButtonsLeftHorizontalPadding"), function $_CPRuleEditorViewSliceRow___rowButtonsLeftHorizontalPadding(self, _cmd)
{
    return 10.;
}
,["float"]), new objj_method(sel_getUid("_rowButtonsRightHorizontalPadding"), function $_CPRuleEditorViewSliceRow___rowButtonsRightHorizontalPadding(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self._ruleEditor, "superview"), "isKindOfClass:", objj_msgSend(CPClipView, "class")) ? 18. : 10.;
}
,["float"]), new objj_method(sel_getUid("_setRowTypeToAddFromPlusButton:"), function $_CPRuleEditorViewSliceRow___setRowTypeToAddFromPlusButton_(self, _cmd, type)
{
    self._plusButtonRowType = type;
}
,["void","int"]), new objj_method(sel_getUid("setNeedsDisplay:"), function $_CPRuleEditorViewSliceRow__setNeedsDisplay_(self, _cmd, flag)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorViewSliceRow").super_class }, "setNeedsDisplay:", flag);
}
,["void","BOOL"]), new objj_method(sel_getUid("_nestingModeShouldHideAddButton"), function $_CPRuleEditorViewSliceRow___nestingModeShouldHideAddButton(self, _cmd)
{
    return objj_msgSend(self._ruleEditor, "_applicableNestingMode") == CPRuleEditorNestingModeSingle;
}
,["BOOL"]), new objj_method(sel_getUid("_nestingModeShouldHideSubtractButton"), function $_CPRuleEditorViewSliceRow___nestingModeShouldHideSubtractButton(self, _cmd)
{
    return objj_msgSend(self._ruleEditor, "_applicableNestingMode") == CPRuleEditorNestingModeSingle;
}
,["BOOL"]), new objj_method(sel_getUid("containsDisplayValue:"), function $_CPRuleEditorViewSliceRow__containsDisplayValue_(self, _cmd, value)
{
    return objj_msgSend(objj_msgSend(self._ruleEditor, "displayValuesForRow:", self._rowIndex), "containsObject:", value);
}
,["BOOL","id"]), new objj_method(sel_getUid("viewDidMoveToWindow"), function $_CPRuleEditorViewSliceRow__viewDidMoveToWindow(self, _cmd)
{
    objj_msgSend(self, "layoutSubviews");
}
,["void"]), new objj_method(sel_getUid("drawRect:"), function $_CPRuleEditorViewSliceRow__drawRect_(self, _cmd, rect)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorViewSliceRow").super_class }, "drawRect:", rect);
}
,["void","CGRect"]), new objj_method(sel_getUid("_isRulePopup:"), function $_CPRuleEditorViewSliceRow___isRulePopup_(self, _cmd, view)
{
    if (objj_msgSend(view, "isKindOfClass:", objj_msgSend(_CPRuleEditorPopUpButton, "class")))
        return YES;
    return NO;
}
,["BOOL","CPView"]), new objj_method(sel_getUid("_sendRuleAction:"), function $_CPRuleEditorViewSliceRow___sendRuleAction_(self, _cmd, sender)
{
    objj_msgSend(self._ruleEditor, "_updatePredicate");
    objj_msgSend(self._ruleEditor, "_sendRuleAction");
}
,["void","id"]), new objj_method(sel_getUid("_textDidChange:"), function $_CPRuleEditorViewSliceRow___textDidChange_(self, _cmd, aNotif)
{
    if (objj_msgSend(objj_msgSend(aNotif, "object"), "superview") == self && objj_msgSend(self._ruleEditor, "_sendsActionOnIncompleteTextChange"))
        objj_msgSend(self, "_sendRuleAction:", nil);
}
,["void","CPNotification"])]);
}{var the_class = objj_allocateClassPair(CPTextField, "_CPRuleEditorTextField"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $_CPRuleEditorTextField__initWithFrame_(self, _cmd, frame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorTextField").super_class }, "initWithFrame:", frame);
    if (self)
    {
        objj_msgSend(self, "setDrawsBackground:", NO);
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("hitTest:"), function $_CPRuleEditorTextField__hitTest_(self, _cmd, point)
{
    if (!CGRectContainsPoint(objj_msgSend(self, "frame"), point))
        return nil;
    return objj_msgSend(self, "superview");
}
,["id","CGPoint"])]);
}