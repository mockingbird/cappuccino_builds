@STATIC;1.0;i;24;CPRuleEditor_Constants.ji;24;_CPRuleEditorViewSlice.ji;10;CPButton.ji;14;CPDatePicker.ji;15;CPPopUpButton.jt;31764;objj_executeFile("CPRuleEditor_Constants.j", YES);objj_executeFile("_CPRuleEditorViewSlice.j", YES);objj_executeFile("CPButton.j", YES);objj_executeFile("CPDatePicker.j", YES);objj_executeFile("CPPopUpButton.j", YES);{var the_class = objj_allocateClassPair(_CPRuleEditorViewSlice, "_CPRuleEditorViewSliceRow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_addButton"), new objj_ivar("_subtractButton"), new objj_ivar("_correspondingRuleItems"), new objj_ivar("_ruleOptionFrames"), new objj_ivar("_ruleOptionInitialViewFrames"), new objj_ivar("_ruleOptionViews"), new objj_ivar("_rowType"), new objj_ivar("_plusButtonRowType")]);objj_registerClassPair(the_class);
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
        (self == null ? null : self.isa.objj_msgSend0(self, "_initShared"));
    return self;
}
,["id","CGRect","id"]), new objj_method(sel_getUid("_initShared"), function $_CPRuleEditorViewSliceRow___initShared(self, _cmd)
{
    self._correspondingRuleItems = ((___r1 = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    self._ruleOptionFrames = ((___r1 = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    self._ruleOptionInitialViewFrames = ((___r1 = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    self._ruleOptionViews = ((___r1 = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    self._editable = ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isEditable"));
    self._addButton = self.isa.objj_msgSend0(self, "_createAddRowButton");
    self._subtractButton = self.isa.objj_msgSend0(self, "_createDeleteRowButton");
    self.isa.objj_msgSend1(self, "addSubview:", self._addButton);
    self.isa.objj_msgSend1(self, "addSubview:", self._subtractButton);
    self.isa.objj_msgSend1(self, "setAutoresizingMask:", CPViewWidthSizable);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_createRowButton"), function $_CPRuleEditorViewSliceRow___createRowButton(self, _cmd)
{
    var button = ((___r1 = CPButton.isa.objj_msgSend0(CPButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    (button == null ? null : button.isa.objj_msgSend1(button, "setFont:", ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "font"))));
    (button == null ? null : button.isa.objj_msgSend1(button, "setTextColor:", ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_fontColor"))));
    (button == null ? null : button.isa.objj_msgSend1(button, "setAlignment:", CPCenterTextAlignment));
    (button == null ? null : button.isa.objj_msgSend1(button, "setAutoresizingMask:", CPViewMinXMargin));
    (button == null ? null : button.isa.objj_msgSend1(button, "setButtonType:", CPMomentaryChangeButton));
    (button == null ? null : button.isa.objj_msgSend1(button, "setBordered:", NO));
    (button == null ? null : button.isa.objj_msgSend1(button, "setHidden:", !self._editable));
    (button == null ? null : button.isa.objj_msgSend1(button, "setImagePosition:", CPImageOnly));
    return button;
    var ___r1;
}
,["CPButton"]), new objj_method(sel_getUid("_createAddRowButton"), function $_CPRuleEditorViewSliceRow___createAddRowButton(self, _cmd)
{
    var button = self.isa.objj_msgSend0(self, "_createRowButton");
    (button == null ? null : button.isa.objj_msgSend1(button, "setToolTip:", ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_toolTipForAddSimpleRowButton"))));
    (button == null ? null : button.isa.objj_msgSend3(button, "setValue:forThemeAttribute:inState:", ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_imageAdd")), "image", CPThemeStateNormal));
    (button == null ? null : button.isa.objj_msgSend3(button, "setValue:forThemeAttribute:inState:", ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_imageAddHighlighted")), "image", CPThemeStateHighlighted));
    (button == null ? null : button.isa.objj_msgSend1(button, "setAction:", sel_getUid("_addOption:")));
    (button == null ? null : button.isa.objj_msgSend1(button, "setTarget:", self));
    return button;
    var ___r1;
}
,["CPButton"]), new objj_method(sel_getUid("_createDeleteRowButton"), function $_CPRuleEditorViewSliceRow___createDeleteRowButton(self, _cmd)
{
    var button = self.isa.objj_msgSend0(self, "_createRowButton");
    (button == null ? null : button.isa.objj_msgSend1(button, "setToolTip:", ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_toolTipForDeleteRowButton"))));
    (button == null ? null : button.isa.objj_msgSend3(button, "setValue:forThemeAttribute:inState:", ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_imageRemove")), "image", CPThemeStateNormal));
    (button == null ? null : button.isa.objj_msgSend3(button, "setValue:forThemeAttribute:inState:", ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_imageRemoveHighlighted")), "image", CPThemeStateHighlighted));
    (button == null ? null : button.isa.objj_msgSend1(button, "setAction:", sel_getUid("_deleteOption:")));
    (button == null ? null : button.isa.objj_msgSend1(button, "setTarget:", self));
    return button;
    var ___r1;
}
,["CPButton"]), new objj_method(sel_getUid("_createMenuItemWithTitle:"), function $_CPRuleEditorViewSliceRow___createMenuItemWithTitle_(self, _cmd, title)
{
    title = ((___r1 = ((___r2 = self._ruleEditor), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "standardLocalizer"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "localizedStringForString:", title));
    return ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", title, nil, ""));
    var ___r1, ___r2;
}
,["CPMenuItem","CPString"]), new objj_method(sel_getUid("_createPopUpButtonWithItems:selectedItemIndex:"), function $_CPRuleEditorViewSliceRow___createPopUpButtonWithItems_selectedItemIndex_(self, _cmd, itemsArray, index)
{
    var title = ((___r1 = (itemsArray == null ? null : itemsArray.isa.objj_msgSend1(itemsArray, "objectAtIndex:", index))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "title")),
        font = ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "font")),
        width = (title == null ? null : title.isa.objj_msgSend1(title, "sizeWithFont:", font)).width + 20,
        rect = CGRectMake(0, 0, width - width % 40 + 80, ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "rowHeight"))),
        popup = ((___r1 = CPPopUpButton.isa.objj_msgSend0(CPPopUpButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", rect));
    (popup == null ? null : popup.isa.objj_msgSend2(popup, "setValue:forThemeAttribute:", font, "font"));
    var count = (itemsArray == null ? null : itemsArray.isa.objj_msgSend0(itemsArray, "count"));
    for (var i = 0; i < count; i++)
        (popup == null ? null : popup.isa.objj_msgSend1(popup, "addItem:", (itemsArray == null ? null : itemsArray.isa.objj_msgSend1(itemsArray, "objectAtIndex:", i))));
    (popup == null ? null : popup.isa.objj_msgSend1(popup, "selectItemAtIndex:", index));
    return popup;
    var ___r1;
}
,["CPPopUpButton","CPArray","int"]), new objj_method(sel_getUid("_createMenuSeparatorItem"), function $_CPRuleEditorViewSliceRow___createMenuSeparatorItem(self, _cmd)
{
    return CPMenuItem.isa.objj_msgSend0(CPMenuItem, "separatorItem");
}
,["CPMenuItem"]), new objj_method(sel_getUid("_createStaticTextFieldWithStringValue:"), function $_CPRuleEditorViewSliceRow___createStaticTextFieldWithStringValue_(self, _cmd, text)
{
    var textField = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero())),
        ruleEditorFont = ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "font")),
        font = CPFont.isa.objj_msgSend2(CPFont, "fontWithName:size:", (ruleEditorFont == null ? null : ruleEditorFont.isa.objj_msgSend0(ruleEditorFont, "familyName")), (ruleEditorFont == null ? null : ruleEditorFont.isa.objj_msgSend0(ruleEditorFont, "size")) + 2),
        localizedText = ((___r1 = ((___r2 = self._ruleEditor), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "standardLocalizer"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "localizedStringForString:", text)),
        size = (localizedText == null ? null : localizedText.isa.objj_msgSend1(localizedText, "sizeWithFont:", font));
    (textField == null ? null : textField.isa.objj_msgSend1(textField, "setFrameSize:", CGSizeMake(size.width + 4, ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "rowHeight")))));
    (textField == null ? null : textField.isa.objj_msgSend2(textField, "setValue:forThemeAttribute:", font, "font"));
    (textField == null ? null : textField.isa.objj_msgSend2(textField, "setValue:forThemeAttribute:", ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_verticalAlignment")), "vertical-alignment"));
    (textField == null ? null : textField.isa.objj_msgSend1(textField, "setStringValue:", localizedText));
    return textField;
    var ___r1, ___r2;
}
,["CPTextField","CPString"]), new objj_method(sel_getUid("_addOption:"), function $_CPRuleEditorViewSliceRow___addOption_(self, _cmd, sender)
{
    if (self._rowIndex == ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "numberOfRows")) - 1)
        self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    var type = self._plusButtonRowType;
    if (((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "nestingMode")) == CPRuleEditorNestingModeCompound && ((___r1 = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "modifierFlags")) & CPAlternateKeyMask)
        type = CPRuleEditorRowTypeCompound;
    ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "_addOptionFromSlice:ofRowType:", self, type));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("_deleteOption:"), function $_CPRuleEditorViewSliceRow___deleteOption_(self, _cmd, sender)
{
    ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_deleteSlice:", self));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("_ruleOptionPopupChangedAction:"), function $_CPRuleEditorViewSliceRow___ruleOptionPopupChangedAction_(self, _cmd, sender)
{
    var layoutdict = (sender == null ? null : sender.isa.objj_msgSend0(sender, "representedObject")),
        newItem = (layoutdict == null ? null : layoutdict.isa.objj_msgSend1(layoutdict, "objectForKey:", "item")),
        indexInCriteria = (layoutdict == null ? null : layoutdict.isa.objj_msgSend1(layoutdict, "objectForKey:", "indexInCriteria")),
        oldItem = ((___r1 = self._correspondingRuleItems), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", indexInCriteria));
    if (!(newItem == null ? null : newItem.isa.objj_msgSend1(newItem, "isEqual:", oldItem)))
    {
        ((___r1 = self._correspondingRuleItems), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "replaceObjectAtIndex:withObject:", indexInCriteria, newItem));
        ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "_changedItem:toItem:inRow:atCriteriaIndex:", oldItem, newItem, self._rowIndex, indexInCriteria));
    }
    var ___r1;
}
,["void","CPMenuItem"]), new objj_method(sel_getUid("validateMenuItem:"), function $_CPRuleEditorViewSliceRow__validateMenuItem_(self, _cmd, menuItem)
{
    return ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "_validateItem:value:inRow:", menuItem, ((___r2 = (menuItem == null ? null : menuItem.isa.objj_msgSend0(menuItem, "representedObject"))), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForKey:", "item")), self._rowIndex));
    var ___r1, ___r2;
}
,["BOOL","CPMenuItem"]), new objj_method(sel_getUid("_emptyRulePartSubviews"), function $_CPRuleEditorViewSliceRow___emptyRulePartSubviews(self, _cmd)
{
    var count = ((___r1 = self._ruleOptionViews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    while (count--)
        ((___r1 = self._ruleOptionViews[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
    ((___r1 = self._ruleOptionViews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeAllObjects"));
    ((___r1 = self._ruleOptionFrames), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeAllObjects"));
    ((___r1 = self._ruleOptionInitialViewFrames), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeAllObjects"));
    var ___r1;
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
        ruleItems = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "array"),
        responder = ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstResponder"));
    self.isa.objj_msgSend0(self, "_emptyRulePartSubviews");
    criteria = ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "criteriaForRow:", self._rowIndex));
    numberOfCriteria = (criteria == null ? null : criteria.isa.objj_msgSend0(criteria, "count"));
    firstResponderIndex = numberOfCriteria - 1;
    if (responder)
        firstResponderIndex = ((___r1 = self._ruleOptionViews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObjectIdenticalTo:", responder));
    for (var i = 0; i < numberOfCriteria; i++)
    {
        ruleView = nil;
        parent = nil;
        criterion = (criteria == null ? null : criteria.isa.objj_msgSend1(criteria, "objectAtIndex:", i));
        if (i > 0)
            parent = (criteria == null ? null : criteria.isa.objj_msgSend1(criteria, "objectAtIndex:", i - 1));
        var childItems = [],
            childValues = [];
        ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "_getAllAvailableItems:values:asChildrenOfItem:inRow:", childItems, childValues, parent, self._rowIndex));
        numberOfChildren = (childItems == null ? null : childItems.isa.objj_msgSend0(childItems, "count"));
        if (numberOfChildren > 1)
        {
            var menuItems = CPMutableArray.isa.objj_msgSend1(CPMutableArray, "arrayWithCapacity:", numberOfChildren),
                selectedIndex = (childItems == null ? null : childItems.isa.objj_msgSend1(childItems, "indexOfObject:", criterion));
            if (selectedIndex == CPNotFound)
                break;
            for (var j = 0; j < numberOfChildren; ++j)
            {
                var childItem = (childItems == null ? null : childItems.isa.objj_msgSend1(childItems, "objectAtIndex:", j)),
                    childValue = (childValues == null ? null : childValues.isa.objj_msgSend1(childValues, "objectAtIndex:", j));
                if ((childValue == null ? null : childValue.isa.objj_msgSend1(childValue, "isKindOfClass:", CPMenuItem.isa.objj_msgSend0(CPMenuItem, "class"))))
                {
                    ((___r1 = (childValue == null ? null : childValue.isa.objj_msgSend0(childValue, "menu"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeItem:", childValue));
                    menuItem = childValue;
                }
                else
                {
                    if ((childValue == null ? null : childValue.isa.objj_msgSend1(childValue, "isEqualToString:", "")))
                        menuItem = self.isa.objj_msgSend0(self, "_createMenuSeparatorItem");
                    else
                    {
                        menuItem = self.isa.objj_msgSend1(self, "_createMenuItemWithTitle:", childValue);
                        (menuItem == null ? null : menuItem.isa.objj_msgSend1(menuItem, "setTarget:", self));
                        (menuItem == null ? null : menuItem.isa.objj_msgSend1(menuItem, "setAction:", sel_getUid("_ruleOptionPopupChangedAction:")));
                    }
                }
                repObject = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", childItem, "item", childValue, "value", i, "indexInCriteria");
                (menuItem == null ? null : menuItem.isa.objj_msgSend1(menuItem, "setRepresentedObject:", repObject));
                (menuItems == null ? null : menuItems.isa.objj_msgSend1(menuItems, "addObject:", menuItem));
            }
            ruleView = self.isa.objj_msgSend2(self, "_createPopUpButtonWithItems:selectedItemIndex:", menuItems, selectedIndex);
        }
        else
        {
            var value = (childValues == null ? null : childValues.isa.objj_msgSend1(childValues, "objectAtIndex:", 0)),
                type = (value == null ? null : value.isa.objj_msgSend0(value, "valueType"));
            if (type === 0)
                ruleView = self.isa.objj_msgSend1(self, "_createStaticTextFieldWithStringValue:", value);
            else
            {
                if (type !== 1)
                {
                    CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInternalInconsistencyException, "Display value must be a string or a menu item");
                    continue;
                }
                ruleView = value;
                (ruleView == null ? null : ruleView.isa.objj_msgSend1(ruleView, "setTarget:", self));
                (ruleView == null ? null : ruleView.isa.objj_msgSend1(ruleView, "setAction:", sel_getUid("_sendRuleAction:")));
                if ((ruleView == null ? null : ruleView.isa.objj_msgSend1(ruleView, "respondsToSelector:", sel_getUid("setDelegate:"))))
                    (ruleView == null ? null : ruleView.isa.objj_msgSend1(ruleView, "setDelegate:", self));
            }
        }
        if (ruleView != nil)
        {
            (ruleView == null ? null : ruleView.isa.objj_msgSend1(ruleView, "setControlSize:", CPSmallControlSize));
            ((___r1 = self._ruleOptionViews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", ruleView));
            var frame = (ruleView == null ? null : ruleView.isa.objj_msgSend0(ruleView, "frame"));
            ((___r1 = self._ruleOptionInitialViewFrames), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", frame));
            ((___r1 = self._ruleOptionFrames), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", frame));
            if (!criterion)
                criterion = CPNull.isa.objj_msgSend0(CPNull, "null");
            (ruleItems == null ? null : ruleItems.isa.objj_msgSend1(ruleItems, "addObject:", criterion));
        }
    }
    ((___r1 = self._correspondingRuleItems), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setArray:", ruleItems));
    if (!self._editable)
        self.isa.objj_msgSend0(self, "_updateEnabledStateForSubviews");
    self.isa.objj_msgSend1(self, "_relayoutSubviewsWidthChanged:", YES);
    if (firstResponderIndex != CPNotFound)
    {
        var aView = ((___r1 = self._ruleOptionViews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", firstResponderIndex));
        ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeFirstResponder:", aView));
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_updateEnabledStateForSubviews"), function $_CPRuleEditorViewSliceRow___updateEnabledStateForSubviews(self, _cmd)
{
    ((___r1 = self._ruleOptionViews), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("setEnabled:"), NO));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPRuleEditorViewSliceRow__layoutSubviews(self, _cmd)
{
    self.isa.objj_msgSend1(self, "_relayoutSubviewsWidthChanged:", YES);
}
,["void"]), new objj_method(sel_getUid("_relayoutSubviewsWidthChanged:"), function $_CPRuleEditorViewSliceRow___relayoutSubviewsWidthChanged_(self, _cmd, widthChanged)
{
    var optionViewOriginX,
        leftHorizontalPadding,
        leftButtonMinX,
        rowHeight = ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "rowHeight")),
        count = ((___r1 = self._ruleOptionViews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")),
        sliceFrame = self.isa.objj_msgSend0(self, "frame"),
        image = ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_imageAdd")),
        buttonFrame = CGRectMake(CGRectGetWidth(sliceFrame) - (image == null ? null : image.isa.objj_msgSend0(image, "size")).width - self.isa.objj_msgSend0(self, "_rowButtonsRightHorizontalPadding"), (((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "rowHeight")) - (image == null ? null : image.isa.objj_msgSend0(image, "size")).height) / 2 - 1, (image == null ? null : image.isa.objj_msgSend0(image, "size")).width, (image == null ? null : image.isa.objj_msgSend0(image, "size")).height);
    ((___r1 = self._addButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", buttonFrame));
    buttonFrame.origin.x -= (image == null ? null : image.isa.objj_msgSend0(image, "size")).width + self.isa.objj_msgSend0(self, "_rowButtonsInterviewHorizontalPadding");
    ((___r1 = self._subtractButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", buttonFrame));
    if (widthChanged)
    {
        optionViewOriginX = self.isa.objj_msgSend0(self, "_leftmostViewFixedHorizontalPadding") + self.isa.objj_msgSend0(self, "_indentationHorizontalPadding") * self._indentation;
        leftHorizontalPadding = self.isa.objj_msgSend0(self, "_rowButtonsLeftHorizontalPadding");
        leftButtonMinX = CGRectGetMinX(buttonFrame);
    }
    for (var i = 0; i < count; i++)
    {
        var ruleOptionView = self._ruleOptionViews[i],
            optionFrame = self._ruleOptionFrames[i];
        optionFrame.origin.y = (rowHeight - CGRectGetHeight(optionFrame)) / 2;
        if (widthChanged)
        {
            optionFrame.origin.x = optionViewOriginX;
            if (i == count - 1 && !self.isa.objj_msgSend1(self, "_isRulePopup:", ruleOptionView))
            {
                var initialFrame = self._ruleOptionInitialViewFrames[i];
                optionFrame.size.width = MIN(CGRectGetWidth(initialFrame), leftButtonMinX - leftHorizontalPadding - optionViewOriginX);
            }
        }
        (ruleOptionView == null ? null : ruleOptionView.isa.objj_msgSend1(ruleOptionView, "setFrame:", optionFrame));
        self.isa.objj_msgSend1(self, "addSubview:", ruleOptionView);
        if (widthChanged)
            optionViewOriginX += CGRectGetWidth(optionFrame) + self.isa.objj_msgSend0(self, "_interviewHorizontalPadding");
    }
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("_updateButtonVisibilities"), function $_CPRuleEditorViewSliceRow___updateButtonVisibilities(self, _cmd)
{
    ((___r1 = self._addButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", ((___r2 = self._ruleEditor), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "_shouldHideAddButtonForSlice:", self))));
    ((___r1 = self._subtractButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", ((___r2 = self._ruleEditor), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "_shouldHideSubtractButtonForSlice:", self))));
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("_configurePlusButtonByRowType:"), function $_CPRuleEditorViewSliceRow___configurePlusButtonByRowType_(self, _cmd, type)
{
    self.isa.objj_msgSend1(self, "_setRowTypeToAddFromPlusButton:", type);
}
,["void","CPRuleEditorRowType"]), new objj_method(sel_getUid("setEditable:"), function $_CPRuleEditorViewSliceRow__setEditable_(self, _cmd, value)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorViewSliceRow").super_class }, "setEditable:", value);
    self.isa.objj_msgSend0(self, "_updateButtonVisibilities");
}
,["void","BOOL"]), new objj_method(sel_getUid("_alignmentGridWidth"), function $_CPRuleEditorViewSliceRow___alignmentGridWidth(self, _cmd)
{
    return ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_alignmentGridWidth"));
    var ___r1;
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
    return ((___r1 = ((___r2 = self._ruleEditor), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "superview"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isKindOfClass:", CPClipView.isa.objj_msgSend0(CPClipView, "class"))) ? 18. : 10.;
    var ___r1, ___r2;
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
    return ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_applicableNestingMode")) == CPRuleEditorNestingModeSingle;
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("_nestingModeShouldHideSubtractButton"), function $_CPRuleEditorViewSliceRow___nestingModeShouldHideSubtractButton(self, _cmd)
{
    return ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_applicableNestingMode")) == CPRuleEditorNestingModeSingle;
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("containsDisplayValue:"), function $_CPRuleEditorViewSliceRow__containsDisplayValue_(self, _cmd, value)
{
    return ((___r1 = ((___r2 = self._ruleEditor), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "displayValuesForRow:", self._rowIndex))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsObject:", value));
    var ___r1, ___r2;
}
,["BOOL","id"]), new objj_method(sel_getUid("viewDidMoveToWindow"), function $_CPRuleEditorViewSliceRow__viewDidMoveToWindow(self, _cmd)
{
    self.isa.objj_msgSend0(self, "layoutSubviews");
}
,["void"]), new objj_method(sel_getUid("_addObservers"), function $_CPRuleEditorViewSliceRow___addObservers(self, _cmd)
{
    if (self._isObserving)
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorViewSliceRow").super_class }, "_addObservers");
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:selector:name:object:", self, sel_getUid("_textDidChange:"), CPControlTextDidChangeNotification, nil));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_removeObservers"), function $_CPRuleEditorViewSliceRow___removeObservers(self, _cmd)
{
    if (!self._isObserving)
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorViewSliceRow").super_class }, "_removeObservers");
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "removeObserver:name:object:", self, CPControlTextDidChangeNotification, nil));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("drawRect:"), function $_CPRuleEditorViewSliceRow__drawRect_(self, _cmd, rect)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorViewSliceRow").super_class }, "drawRect:", rect);
}
,["void","CGRect"]), new objj_method(sel_getUid("_isRulePopup:"), function $_CPRuleEditorViewSliceRow___isRulePopup_(self, _cmd, view)
{
    if ((view == null ? null : view.isa.objj_msgSend1(view, "isKindOfClass:", CPPopUpButton.isa.objj_msgSend0(CPPopUpButton, "class"))))
        return YES;
    return NO;
}
,["BOOL","CPView"]), new objj_method(sel_getUid("_sendRuleAction:"), function $_CPRuleEditorViewSliceRow___sendRuleAction_(self, _cmd, sender)
{
    ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_updatePredicate"));
    ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_sendRuleAction"));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("_textDidChange:"), function $_CPRuleEditorViewSliceRow___textDidChange_(self, _cmd, aNotif)
{
    if (((___r1 = (aNotif == null ? null : aNotif.isa.objj_msgSend0(aNotif, "object"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "superview")) == self && ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_sendsActionOnIncompleteTextChange")))
        self.isa.objj_msgSend1(self, "_sendRuleAction:", nil);
    var ___r1;
}
,["void","CPNotification"])]);
}