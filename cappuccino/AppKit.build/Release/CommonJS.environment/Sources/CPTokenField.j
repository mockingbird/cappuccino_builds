@STATIC;1.0;I;27;Foundation/CPCharacterSet.jI;23;Foundation/CPIndexSet.jI;20;Foundation/CPTimer.ji;21;_CPAutocompleteMenu.ji;10;CPButton.ji;15;CPPopUpButton.ji;14;CPScrollView.ji;13;CPTableView.ji;8;CPText.ji;13;CPTextField.ji;20;CPWindow_Constants.jt;52514;objj_executeFile("Foundation/CPCharacterSet.j", NO);objj_executeFile("Foundation/CPIndexSet.j", NO);objj_executeFile("Foundation/CPTimer.j", NO);objj_executeFile("_CPAutocompleteMenu.j", YES);objj_executeFile("CPButton.j", YES);objj_executeFile("CPPopUpButton.j", YES);objj_executeFile("CPScrollView.j", YES);objj_executeFile("CPTableView.j", YES);objj_executeFile("CPText.j", YES);objj_executeFile("CPTextField.j", YES);objj_executeFile("CPWindow_Constants.j", YES);var CPScrollDestinationNone = 0,
    CPScrollDestinationLeft = 1,
    CPScrollDestinationRight = 2;
CPTokenFieldDisclosureButtonType = 0;
CPTokenFieldDeleteButtonType = 1;
{var the_class = objj_allocateClassPair(CPTextField, "CPTokenField"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_tokenScrollView"), new objj_ivar("_shouldScrollTo"), new objj_ivar("_selectedRange"), new objj_ivar("_autocompleteMenu"), new objj_ivar("_inputFrame"), new objj_ivar("_completionDelay"), new objj_ivar("_tokenizingCharacterSet"), new objj_ivar("_mouseDownEvent"), new objj_ivar("_shouldNotifyTarget"), new objj_ivar("_buttonType")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("tokenizingCharacterSet"), function $CPTokenField__tokenizingCharacterSet(self, _cmd)
{
    return self._tokenizingCharacterSet;
}
,["CPCharacterSet"]), new objj_method(sel_getUid("setTokenizingCharacterSet:"), function $CPTokenField__setTokenizingCharacterSet_(self, _cmd, newValue)
{
    self._tokenizingCharacterSet = newValue;
}
,["void","CPCharacterSet"]), new objj_method(sel_getUid("buttonType"), function $CPTokenField__buttonType(self, _cmd)
{
    return self._buttonType;
}
,["int"]), new objj_method(sel_getUid("setButtonType:"), function $CPTokenField__setButtonType_(self, _cmd, newValue)
{
    self._buttonType = newValue;
}
,["void","int"]), new objj_method(sel_getUid("initWithFrame:"), function $CPTokenField__initWithFrame_(self, _cmd, frame)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "initWithFrame:", frame))
    {
        self._completionDelay = objj_msgSend(objj_msgSend(self, "class"), "defaultCompletionDelay");
        self._tokenizingCharacterSet = objj_msgSend(objj_msgSend(self, "class"), "defaultTokenizingCharacterSet");
        self._buttonType = CPTokenFieldDisclosureButtonType;
        objj_msgSend(self, "setBezeled:", YES);
        objj_msgSend(self, "_init");
        objj_msgSend(self, "setObjectValue:", []);
        objj_msgSend(self, "setNeedsLayout");
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("_init"), function $CPTokenField___init(self, _cmd)
{
    self._selectedRange = CPMakeRange(0, 0);
    var frame = objj_msgSend(self, "frame");
    self._tokenScrollView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(self._tokenScrollView, "setHasHorizontalScroller:", NO);
    objj_msgSend(self._tokenScrollView, "setHasVerticalScroller:", NO);
    objj_msgSend(self._tokenScrollView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    var contentView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(contentView, "setAutoresizingMask:", CPViewWidthSizable);
    objj_msgSend(self._tokenScrollView, "setDocumentView:", contentView);
    objj_msgSend(self, "addSubview:", self._tokenScrollView);
}
,["void"]), new objj_method(sel_getUid("_autocompleteMenu"), function $CPTokenField___autocompleteMenu(self, _cmd)
{
    if (!self._autocompleteMenu)
        self._autocompleteMenu = objj_msgSend(objj_msgSend(_CPAutocompleteMenu, "alloc"), "initWithTextField:", self);
    return self._autocompleteMenu;
}
,["_CPAutocompleteMenu"]), new objj_method(sel_getUid("_complete:"), function $CPTokenField___complete_(self, _cmd, anAutocompleteMenu)
{
    objj_msgSend(self, "_autocompleteWithEvent:", nil);
}
,["void","_CPAutocompleteMenu"]), new objj_method(sel_getUid("_autocompleteWithEvent:"), function $CPTokenField___autocompleteWithEvent_(self, _cmd, anEvent)
{
    if (!objj_msgSend(self, "_editorValue") && (!objj_msgSend(self._autocompleteMenu, "contentArray") || !objj_msgSend(self, "hasThemeState:", CPThemeStateAutocompleting)))
        return;
    objj_msgSend(self, "_hideCompletions");
    var token = objj_msgSend(self._autocompleteMenu, "selectedItem"),
        shouldRemoveLastObject = token !== "" && objj_msgSend(self, "_editorValue") !== "";
    if (!token)
        token = objj_msgSend(self, "_editorValue");
    if (!token || token === "")
    {
        var character = objj_msgSend(anEvent, "charactersIgnoringModifiers"),
            modifierFlags = objj_msgSend(anEvent, "modifierFlags");
        if (character === CPTabCharacter)
        {
            if (!(modifierFlags & CPShiftKeyMask))
                objj_msgSend(objj_msgSend(self, "window"), "selectNextKeyView:", self);
            else
                objj_msgSend(objj_msgSend(self, "window"), "selectPreviousKeyView:", self);
        }
        else
            objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", nil);
        return;
    }
    var objectValue = objj_msgSend(self, "objectValue");
    if (shouldRemoveLastObject)
        objj_msgSend(objectValue, "removeObjectAtIndex:", self._selectedRange.location);
    token = objj_msgSend(self, "_representedObjectForEditingString:", token);
    var delegateApprovedObjects = objj_msgSend(self, "_shouldAddObjects:atIndex:", objj_msgSend(CPArray, "arrayWithObject:", token), self._selectedRange.location),
        delegateApprovedObjectsCount = objj_msgSend(delegateApprovedObjects, "count");
    if (delegateApprovedObjects)
    {
        for (var i = 0; i < delegateApprovedObjectsCount; i++)
        {
            objj_msgSend(objectValue, "insertObject:atIndex:", objj_msgSend(delegateApprovedObjects, "objectAtIndex:", i), self._selectedRange.location + i);
        }
    }
    var location = self._selectedRange.location;
    objj_msgSend(self, "setObjectValue:", objectValue);
    if (delegateApprovedObjectsCount)
        location += delegateApprovedObjectsCount;
    self._selectedRange = CPMakeRange(location, 0);
    objj_msgSend(self, "_inputElement").value = "";
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "_controlTextDidChange");
}
,["void","CPEvent"]), new objj_method(sel_getUid("_autocomplete"), function $CPTokenField___autocomplete(self, _cmd)
{
    objj_msgSend(self, "_autocompleteWithEvent:", nil);
}
,["void"]), new objj_method(sel_getUid("_selectToken:byExtendingSelection:"), function $CPTokenField___selectToken_byExtendingSelection_(self, _cmd, token, extend)
{
    var indexOfToken = objj_msgSend(objj_msgSend(self, "_tokens"), "indexOfObject:", token);
    if (indexOfToken == CPNotFound)
    {
        if (!extend)
            self._selectedRange = CPMakeRange(objj_msgSend(objj_msgSend(self, "_tokens"), "count"), 0);
    }
    else if (extend)
        self._selectedRange = CPUnionRange(self._selectedRange, CPMakeRange(indexOfToken, 1));
    else
        self._selectedRange = CPMakeRange(indexOfToken, 1);
    objj_msgSend(self, "setNeedsLayout");
}
,["void","_CPTokenFieldToken","BOOL"]), new objj_method(sel_getUid("_deselectToken:"), function $CPTokenField___deselectToken_(self, _cmd, token)
{
    var indexOfToken = objj_msgSend(objj_msgSend(self, "_tokens"), "indexOfObject:", token);
    if (CPLocationInRange(indexOfToken, self._selectedRange))
        self._selectedRange = CPMakeRange(MAX(indexOfToken, self._selectedRange.location), MIN(self._selectedRange.length, indexOfToken - self._selectedRange.location));
    objj_msgSend(self, "setNeedsLayout");
}
,["void","_CPTokenFieldToken"]), new objj_method(sel_getUid("_deleteToken:"), function $CPTokenField___deleteToken_(self, _cmd, token)
{
    var indexOfToken = objj_msgSend(objj_msgSend(self, "_tokens"), "indexOfObject:", token),
        objectValue = objj_msgSend(self, "objectValue");
    if (indexOfToken < self._selectedRange.location)
        self._selectedRange.location--;
    else
        objj_msgSend(self, "_deselectToken:", token);
    var selection = CPMakeRangeCopy(self._selectedRange);
    objj_msgSend(objectValue, "removeObjectAtIndex:", indexOfToken);
    objj_msgSend(self, "setObjectValue:", objectValue);
    self._selectedRange = selection;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "_controlTextDidChange");
}
,["void","_CPTokenFieldToken"]), new objj_method(sel_getUid("_controlTextDidChange"), function $CPTokenField___controlTextDidChange(self, _cmd)
{
    var binderClass = objj_msgSend(objj_msgSend(self, "class"), "_binderClassForBinding:", CPValueBinding),
        theBinding = objj_msgSend(binderClass, "getBinding:forObject:", CPValueBinding, self);
    if (theBinding)
        objj_msgSend(theBinding, "reverseSetValueFor:", "objectValue");
    objj_msgSend(self, "textDidChange:", objj_msgSend(CPNotification, "notificationWithName:object:userInfo:", CPControlTextDidChangeNotification, self, nil));
    self._shouldNotifyTarget = YES;
}
,["void"]), new objj_method(sel_getUid("_removeSelectedTokens:"), function $CPTokenField___removeSelectedTokens_(self, _cmd, sender)
{
    var tokens = objj_msgSend(self, "objectValue");
    for (var i = self._selectedRange.length - 1; i >= 0; i--)
        objj_msgSend(tokens, "removeObjectAtIndex:", self._selectedRange.location + i);
    var collapsedSelection = self._selectedRange.location;
    objj_msgSend(self, "setObjectValue:", tokens);
    self._selectedRange = CPMakeRange(collapsedSelection, 0);
    objj_msgSend(self, "_controlTextDidChange");
}
,["void","id"]), new objj_method(sel_getUid("_updatePlaceholderState"), function $CPTokenField___updatePlaceholderState(self, _cmd)
{
    if (objj_msgSend(objj_msgSend(self, "_tokens"), "count") === 0 && !objj_msgSend(self, "hasThemeState:", CPThemeStateEditing))
        objj_msgSend(self, "setThemeState:", CPTextFieldStatePlaceholder);
    else
        objj_msgSend(self, "unsetThemeState:", CPTextFieldStatePlaceholder);
}
,["void"]), new objj_method(sel_getUid("becomeFirstResponder"), function $CPTokenField__becomeFirstResponder(self, _cmd)
{
    objj_msgSend(self, "_setObserveWindowKeyNotifications:", YES);
    objj_msgSend(self, "scrollRectToVisible:", objj_msgSend(self, "bounds"));
    if (objj_msgSend(objj_msgSend(self, "window"), "isKeyWindow"))
        return objj_msgSend(self, "_becomeFirstKeyResponder");
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("_becomeFirstKeyResponder"), function $CPTokenField___becomeFirstKeyResponder(self, _cmd)
{
    if (!objj_msgSend(self, "_isWithinUsablePlatformRect"))
        return NO;
    objj_msgSend(self, "setThemeState:", CPThemeStateEditing);
    objj_msgSend(self, "_updatePlaceholderState");
    objj_msgSend(self, "setNeedsLayout");
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("resignFirstResponder"), function $CPTokenField__resignFirstResponder(self, _cmd)
{
    objj_msgSend(self, "_autocomplete");
    objj_msgSend(self, "_setObserveWindowKeyNotifications:", NO);
    objj_msgSend(self, "_resignFirstKeyResponder");
    if (self._shouldNotifyTarget)
    {
        self._shouldNotifyTarget = NO;
        objj_msgSend(self, "textDidEndEditing:", objj_msgSend(CPNotification, "notificationWithName:object:userInfo:", CPControlTextDidEndEditingNotification, self, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(self, "_currentTextMovement"), "CPTextMovement")));
        if (objj_msgSend(self, "sendsActionOnEndEditing"))
            objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
    }
    objj_msgSend(self, "textDidBlur:", objj_msgSend(CPNotification, "notificationWithName:object:userInfo:", CPTextFieldDidBlurNotification, self, nil));
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("_resignFirstKeyResponder"), function $CPTokenField___resignFirstKeyResponder(self, _cmd)
{
    objj_msgSend(self, "unsetThemeState:", CPThemeStateEditing);
    objj_msgSend(self, "_updatePlaceholderState");
    objj_msgSend(self, "setNeedsLayout");
}
,["void"]), new objj_method(sel_getUid("mouseDown:"), function $CPTokenField__mouseDown_(self, _cmd, anEvent)
{
    self._mouseDownEvent = anEvent;
    objj_msgSend(self, "_selectToken:byExtendingSelection:", nil, NO);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "mouseDown:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseUp:"), function $CPTokenField__mouseUp_(self, _cmd, anEvent)
{
    self._mouseDownEvent = nil;
}
,["void","CPEvent"]), new objj_method(sel_getUid("_mouseDownOnToken:withEvent:"), function $CPTokenField___mouseDownOnToken_withEvent_(self, _cmd, aToken, anEvent)
{
    self._mouseDownEvent = anEvent;
}
,["void","_CPTokenFieldToken","CPEvent"]), new objj_method(sel_getUid("_mouseUpOnToken:withEvent:"), function $CPTokenField___mouseUpOnToken_withEvent_(self, _cmd, aToken, anEvent)
{
    if (self._mouseDownEvent && CGPointEqualToPoint(objj_msgSend(self._mouseDownEvent, "locationInWindow"), objj_msgSend(anEvent, "locationInWindow")))
    {
        objj_msgSend(self, "_selectToken:byExtendingSelection:", aToken, objj_msgSend(anEvent, "modifierFlags") & CPShiftKeyMask);
        objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", self);
        self._shouldScrollTo = aToken;
    }
}
,["void","_CPTokenFieldToken","CPEvent"]), new objj_method(sel_getUid("_tokens"), function $CPTokenField___tokens(self, _cmd)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "objectValue");
}
,["CPArray"]), new objj_method(sel_getUid("stringValue"), function $CPTokenField__stringValue(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self, "objectValue"), "componentsJoinedByString:", ",");
}
,["CPString"]), new objj_method(sel_getUid("objectValue"), function $CPTokenField__objectValue(self, _cmd)
{
    var objectValue = [];
    for (var i = 0, count = objj_msgSend(objj_msgSend(self, "_tokens"), "count"); i < count; i++)
    {
        var token = objj_msgSend(objj_msgSend(self, "_tokens"), "objectAtIndex:", i);
        if (objj_msgSend(token, "isKindOfClass:", objj_msgSend(CPString, "class")))
            continue;
        objj_msgSend(objectValue, "addObject:", objj_msgSend(token, "representedObject"));
    }
    return objectValue;
}
,["id"]), new objj_method(sel_getUid("setObjectValue:"), function $CPTokenField__setObjectValue_(self, _cmd, aValue)
{
    if (aValue !== nil && !objj_msgSend(aValue, "isKindOfClass:", objj_msgSend(CPArray, "class")))
    {
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "setObjectValue:", nil);
        return;
    }
    var superValue = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "objectValue");
    if (aValue === superValue || objj_msgSend(aValue, "isEqualToArray:", superValue))
        return;
    var contentView = objj_msgSend(self._tokenScrollView, "documentView"),
        oldTokens = objj_msgSend(self, "_tokens"),
        newTokens = [];
    if (aValue !== nil)
    {
        for (var i = 0, count = objj_msgSend(aValue, "count"); i < count; i++)
        {
            var tokenObject = aValue[i],
                tokenValue = objj_msgSend(self, "_displayStringForRepresentedObject:", tokenObject),
                newToken = nil;
            for (var j = 0, oldCount = objj_msgSend(oldTokens, "count"); j < oldCount; j++)
            {
                var oldToken = oldTokens[j];
                if (objj_msgSend(oldToken, "representedObject") == tokenObject)
                {
                    objj_msgSend(oldTokens, "removeObjectAtIndex:", j);
                    newToken = oldToken;
                    break;
                }
            }
            if (newToken === nil)
            {
                newToken = objj_msgSend(_CPTokenFieldToken, "new");
                objj_msgSend(newToken, "setTokenField:", self);
                objj_msgSend(newToken, "setRepresentedObject:", tokenObject);
                objj_msgSend(newToken, "setStringValue:", tokenValue);
                objj_msgSend(newToken, "setEditable:", objj_msgSend(self, "isEditable"));
                objj_msgSend(contentView, "addSubview:", newToken);
            }
            newTokens.push(newToken);
        }
    }
    for (var j = 0, oldCount = objj_msgSend(oldTokens, "count"); j < oldCount; j++)
        objj_msgSend(oldTokens[j], "removeFromSuperview");
    self._value = newTokens;
    objj_msgSend(self, "_selectToken:byExtendingSelection:", nil, NO);
    objj_msgSend(self, "_updatePlaceholderState");
    self._shouldScrollTo = CPScrollDestinationRight;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","id"]), new objj_method(sel_getUid("setEnabled:"), function $CPTokenField__setEnabled_(self, _cmd, shouldBeEnabled)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "setEnabled:", shouldBeEnabled);
    for (var i = 0, count = objj_msgSend(objj_msgSend(self, "_tokens"), "count"); i < count; i++)
    {
        var token = objj_msgSend(objj_msgSend(self, "_tokens"), "objectAtIndex:", i);
        if (objj_msgSend(token, "respondsToSelector:", sel_getUid("setEnabled:")))
            objj_msgSend(token, "setEnabled:", shouldBeEnabled);
    }
}
,["void","BOOL"]), new objj_method(sel_getUid("setEditable:"), function $CPTokenField__setEditable_(self, _cmd, shouldBeEditable)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "setEditable:", shouldBeEditable);
    objj_msgSend(objj_msgSend(self, "_tokens"), "makeObjectsPerformSelector:withObject:", sel_getUid("setEditable:"), shouldBeEditable);
}
,["void","BOOL"]), new objj_method(sel_getUid("sendAction:to:"), function $CPTokenField__sendAction_to_(self, _cmd, anAction, anObject)
{
    self._shouldNotifyTarget = NO;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "sendAction:to:", anAction, anObject);
}
,["BOOL","SEL","id"]), new objj_method(sel_getUid("_setStringValue:"), function $CPTokenField___setStringValue_(self, _cmd, aValue)
{
}
,["BOOL","CPString"]), new objj_method(sel_getUid("_editorValue"), function $CPTokenField___editorValue(self, _cmd)
{
    if (!objj_msgSend(self, "hasThemeState:", CPThemeStateEditing))
        return "";
    return objj_msgSend(self, "_inputElement").value;
}
,["CPString"]), new objj_method(sel_getUid("moveUp:"), function $CPTokenField__moveUp_(self, _cmd, sender)
{
    objj_msgSend(objj_msgSend(self, "_autocompleteMenu"), "selectPrevious");
    objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", NO);
}
,["void","id"]), new objj_method(sel_getUid("moveDown:"), function $CPTokenField__moveDown_(self, _cmd, sender)
{
    objj_msgSend(objj_msgSend(self, "_autocompleteMenu"), "selectNext");
    objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", NO);
}
,["void","id"]), new objj_method(sel_getUid("insertNewline:"), function $CPTokenField__insertNewline_(self, _cmd, sender)
{
    if (objj_msgSend(self, "hasThemeState:", CPThemeStateAutocompleting))
    {
        objj_msgSend(self, "_autocompleteWithEvent:", objj_msgSend(CPApp, "currentEvent"));
    }
    else
    {
        objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
        objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", nil);
    }
}
,["void","id"]), new objj_method(sel_getUid("insertTab:"), function $CPTokenField__insertTab_(self, _cmd, sender)
{
    var anEvent = objj_msgSend(CPApp, "currentEvent");
    if (objj_msgSend(self, "hasThemeState:", CPThemeStateAutocompleting))
    {
        objj_msgSend(self, "_autocompleteWithEvent:", anEvent);
    }
    else
    {
        if (!(objj_msgSend(anEvent, "modifierFlags") & CPShiftKeyMask))
            objj_msgSend(objj_msgSend(self, "window"), "selectNextKeyView:", self);
        else
            objj_msgSend(objj_msgSend(self, "window"), "selectPreviousKeyView:", self);
    }
}
,["void","id"]), new objj_method(sel_getUid("insertText:"), function $CPTokenField__insertText_(self, _cmd, characters)
{
    if (objj_msgSend(self._tokenizingCharacterSet, "characterIsMember:", objj_msgSend(characters, "substringToIndex:", 1)))
    {
        objj_msgSend(self, "_autocompleteWithEvent:", objj_msgSend(CPApp, "currentEvent"));
    }
    else
    {
        if (self._selectedRange.length)
        {
            objj_msgSend(self, "_removeSelectedTokens:", self);
            objj_msgSend(self, "layoutSubviews");
        }
        objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
    }
}
,["void","CPString"]), new objj_method(sel_getUid("cancelOperation:"), function $CPTokenField__cancelOperation_(self, _cmd, sender)
{
    objj_msgSend(self, "_hideCompletions");
}
,["void","id"]), new objj_method(sel_getUid("moveLeft:"), function $CPTokenField__moveLeft_(self, _cmd, sender)
{
    if ((self._selectedRange.location > 0 || self._selectedRange.length) && objj_msgSend(self, "_editorValue") == "")
    {
        if (self._selectedRange.length)
            self._selectedRange.length = 0;
        else
            self._selectedRange.location--;
        objj_msgSend(self, "setNeedsLayout");
        self._shouldScrollTo = CPScrollDestinationLeft;
    }
    else
    {
        objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
    }
}
,["void","id"]), new objj_method(sel_getUid("moveLeftAndModifySelection:"), function $CPTokenField__moveLeftAndModifySelection_(self, _cmd, sender)
{
    if (self._selectedRange.location > 0 && objj_msgSend(self, "_editorValue") == "")
    {
        self._selectedRange.location--;
        self._selectedRange.length++;
        objj_msgSend(self, "setNeedsLayout");
        self._shouldScrollTo = CPScrollDestinationLeft;
    }
    else
    {
        objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
    }
}
,["void","id"]), new objj_method(sel_getUid("moveRight:"), function $CPTokenField__moveRight_(self, _cmd, sender)
{
    if ((self._selectedRange.location < objj_msgSend(objj_msgSend(self, "_tokens"), "count") || self._selectedRange.length) && objj_msgSend(self, "_editorValue") == "")
    {
        if (self._selectedRange.length)
        {
            self._selectedRange.location = CPMaxRange(self._selectedRange);
            self._selectedRange.length = 0;
        }
        else
        {
            self._selectedRange.location = MIN(objj_msgSend(objj_msgSend(self, "_tokens"), "count"), self._selectedRange.location + self._selectedRange.length + 1);
        }
        objj_msgSend(self, "setNeedsLayout");
        self._shouldScrollTo = CPScrollDestinationRight;
    }
    else
    {
        objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
    }
}
,["void","id"]), new objj_method(sel_getUid("moveRightAndModifySelection:"), function $CPTokenField__moveRightAndModifySelection_(self, _cmd, sender)
{
    if (CPMaxRange(self._selectedRange) < objj_msgSend(objj_msgSend(self, "_tokens"), "count") && objj_msgSend(self, "_editorValue") == "")
    {
        self._selectedRange.length++;
        objj_msgSend(self, "setNeedsLayout");
        self._shouldScrollTo = CPScrollDestinationRight;
    }
    else
    {
        objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
    }
}
,["void","id"]), new objj_method(sel_getUid("deleteBackward:"), function $CPTokenField__deleteBackward_(self, _cmd, sender)
{
    if (objj_msgSend(self, "_editorValue") == "")
    {
        objj_msgSend(self, "_hideCompletions");
        if (CPEmptyRange(self._selectedRange))
        {
            if (self._selectedRange.location > 0)
            {
                var tokenView = objj_msgSend(objj_msgSend(self, "_tokens"), "objectAtIndex:", self._selectedRange.location - 1);
                objj_msgSend(self, "_selectToken:byExtendingSelection:", tokenView, NO);
            }
        }
        else
            objj_msgSend(self, "_removeSelectedTokens:", nil);
    }
    else
    {
        objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
    }
}
,["void","id"]), new objj_method(sel_getUid("deleteForward:"), function $CPTokenField__deleteForward_(self, _cmd, sender)
{
    if (objj_msgSend(self, "_editorValue") == "")
    {
        objj_msgSend(self, "_hideCompletions");
        if (CPEmptyRange(self._selectedRange))
        {
            if (self._selectedRange.location < objj_msgSend(objj_msgSend(self, "_tokens"), "count"))
                objj_msgSend(self, "_deleteToken:", objj_msgSend(objj_msgSend(self, "_tokens"), "objectAtIndex:", [self._selectedRange.location]));
        }
        else
            objj_msgSend(self, "_removeSelectedTokens:", nil);
    }
    else
    {
        objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
    }
}
,["void","id"]), new objj_method(sel_getUid("_selectText:immediately:"), function $CPTokenField___selectText_immediately_(self, _cmd, sender, immediately)
{
    if (objj_msgSend(self, "isEditable") || objj_msgSend(self, "isSelectable"))
    {
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "_selectText:immediately:", sender, immediately);
        objj_msgSend(self, "_autocomplete");
        self._selectedRange = CPMakeRange(0, objj_msgSend(objj_msgSend(self, "_tokens"), "count"));
        objj_msgSend(self, "setNeedsLayout");
    }
}
,["void","id","BOOL"]), new objj_method(sel_getUid("keyDown:"), function $CPTokenField__keyDown_(self, _cmd, anEvent)
{
    objj_msgSend(self, "interpretKeyEvents:", [anEvent]);
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
}
,["void","CPEvent"]), new objj_method(sel_getUid("keyUp:"), function $CPTokenField__keyUp_(self, _cmd, anEvent)
{
    objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
}
,["void","CPEvent"]), new objj_method(sel_getUid("textDidChange:"), function $CPTokenField__textDidChange_(self, _cmd, aNotification)
{
    if (objj_msgSend(aNotification, "object") !== self)
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "textDidChange:", aNotification);
    objj_msgSend(self, "_delayedShowCompletions");
    self._selectedRange.length = 0;
    objj_msgSend(self, "setNeedsLayout");
}
,["void","CPNotification"]), new objj_method(sel_getUid("setCompletionDelay:"), function $CPTokenField__setCompletionDelay_(self, _cmd, delay)
{
    self._completionDelay = delay;
}
,["void","CPTimeInterval"]), new objj_method(sel_getUid("completionDelay"), function $CPTokenField__completionDelay(self, _cmd)
{
    return self._completionDelay;
}
,["CPTimeInterval"]), new objj_method(sel_getUid("layoutSubviews"), function $CPTokenField__layoutSubviews(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "layoutSubviews");
    objj_msgSend(self._tokenScrollView, "setFrame:", objj_msgSend(self, "rectForEphemeralSubviewNamed:", "content-view"));
    var textFieldContentView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "content-view", CPWindowAbove, "bezel-view");
    if (textFieldContentView)
        objj_msgSend(textFieldContentView, "setHidden:", objj_msgSend(self, "stringValue") !== "");
    var frame = objj_msgSend(self, "frame"),
        contentView = objj_msgSend(self._tokenScrollView, "documentView"),
        tokens = objj_msgSend(self, "_tokens");
    if (!objj_msgSend(tokens, "isKindOfClass:", objj_msgSend(CPArray, "class")))
        return;
    var contentRect = CGRectMakeCopy(objj_msgSend(contentView, "bounds")),
        contentOrigin = contentRect.origin,
        contentSize = contentRect.size,
        offset = CGPointMake(contentOrigin.x, contentOrigin.y),
        spaceBetweenTokens = CGSizeMake(2.0, 2.0),
        isEditing = objj_msgSend(objj_msgSend(self, "window"), "firstResponder") == self,
        tokenToken = objj_msgSend(_CPTokenFieldToken, "new"),
        font = objj_msgSend(self, "currentValueForThemeAttribute:", "font"),
        lineHeight = objj_msgSend(font, "defaultLineHeightForFont"),
        editorInset = objj_msgSend(self, "currentValueForThemeAttribute:", "editor-inset");
    offset.y += CEIL(spaceBetweenTokens.height / 2.0);
    objj_msgSend(tokenToken, "sizeToFit");
    var tokenHeight = CGRectGetHeight(objj_msgSend(tokenToken, "bounds"));
    var fitAndFrame = function(width, height)
    {
        var r = CGRectMake(0, 0, width, height);
        if (offset.x + width >= contentSize.width && offset.x > contentOrigin.x)
        {
            offset.x = contentOrigin.x;
            offset.y += height + spaceBetweenTokens.height;
        }
        r.origin.x = offset.x;
        r.origin.y = offset.y;
        var scrollHeight = offset.y + tokenHeight + CEIL(spaceBetweenTokens.height / 2.0);
        if (CGRectGetHeight(objj_msgSend(contentView, "bounds")) < scrollHeight)
            objj_msgSend(contentView, "setFrameSize:", CGSizeMake(CGRectGetWidth(objj_msgSend(self._tokenScrollView, "bounds")), scrollHeight));
        offset.x += width + spaceBetweenTokens.width;
        return r;
    };
    var placeEditor = function(useRemainingWidth)
    {
        var element = objj_msgSend(self, "_inputElement"),
            textWidth = 1;
        if (self._selectedRange.length === 0)
        {
            textWidth = objj_msgSend((element.value || "") + "X", "sizeWithFont:", font).width;
            if (useRemainingWidth)
                textWidth = MAX(contentSize.width - offset.x - 1, textWidth);
        }
        self._inputFrame = fitAndFrame(textWidth, tokenHeight);
        self._inputFrame.size.height = lineHeight;
        element.style.left = self._inputFrame.origin.x + editorInset.left + "px";
        element.style.top = self._inputFrame.origin.y + editorInset.top + "px";
        element.style.width = self._inputFrame.size.width + "px";
        element.style.height = self._inputFrame.size.height + "px";
        if (self._selectedRange.length == 0)
            objj_msgSend(objj_msgSend(self._tokenScrollView, "documentView"), "scrollPoint:", CGPointMake(0, self._inputFrame.origin.y));
    };
    for (var i = 0, count = objj_msgSend(tokens, "count"); i < count; i++)
    {
        if (isEditing && !self._selectedRange.length && i == CPMaxRange(self._selectedRange))
            placeEditor(false);
        var tokenView = objj_msgSend(tokens, "objectAtIndex:", i);
        if (objj_msgSend(tokenView, "isKindOfClass:", objj_msgSend(CPString, "class")))
            continue;
        objj_msgSend(tokenView, "setHighlighted:", CPLocationInRange(i, self._selectedRange));
        objj_msgSend(tokenView, "sizeToFit");
        var size = objj_msgSend(contentView, "bounds").size,
            tokenViewSize = objj_msgSend(tokenView, "bounds").size,
            tokenFrame = fitAndFrame(tokenViewSize.width, tokenViewSize.height);
        objj_msgSend(tokenView, "setFrame:", tokenFrame);
        objj_msgSend(tokenView, "setButtonType:", self._buttonType);
    }
    if (isEditing && !self._selectedRange.length && CPMaxRange(self._selectedRange) >= objj_msgSend(tokens, "count"))
        placeEditor(true);
    if (isEditing && self._selectedRange.length)
    {
        self._inputFrame = nil;
        var inputElement = objj_msgSend(self, "_inputElement");
        inputElement.style.display = "none";
    }
    else if (isEditing)
    {
        var inputElement = objj_msgSend(self, "_inputElement");
        inputElement.style.display = "block";
        if (document.activeElement !== inputElement)
            inputElement.focus();
    }
    var scrollHeight = offset.y + tokenHeight;
    if (CGRectGetHeight(objj_msgSend(contentView, "bounds")) > scrollHeight)
        objj_msgSend(contentView, "setFrameSize:", CGSizeMake(CGRectGetWidth(objj_msgSend(self._tokenScrollView, "bounds")), scrollHeight));
    if (self._shouldScrollTo !== CPScrollDestinationNone)
    {
        if (!(isEditing && self._selectedRange.length == 0))
        {
            var scrollToToken = self._shouldScrollTo;
            if (scrollToToken === CPScrollDestinationLeft)
                scrollToToken = tokens[self._selectedRange.location];
            else if (scrollToToken === CPScrollDestinationRight)
                scrollToToken = tokens[MAX(0, CPMaxRange(self._selectedRange) - 1)];
            objj_msgSend(self, "_scrollTokenViewToVisible:", scrollToToken);
        }
        self._shouldScrollTo = CPScrollDestinationNone;
    }
}
,["void"]), new objj_method(sel_getUid("_scrollTokenViewToVisible:"), function $CPTokenField___scrollTokenViewToVisible_(self, _cmd, aToken)
{
    if (!aToken)
        return;
    return objj_msgSend(objj_msgSend(self._tokenScrollView, "documentView"), "scrollPoint:", CGPointMake(0, objj_msgSend(aToken, "frameOrigin").y));
}
,["BOOL","_CPTokenFieldToken"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultTokenizingCharacterSet"), function $CPTokenField__defaultTokenizingCharacterSet(self, _cmd)
{
    return objj_msgSend(CPCharacterSet, "characterSetWithCharactersInString:", ",");
}
,["CPCharacterSet"]), new objj_method(sel_getUid("defaultCompletionDelay"), function $CPTokenField__defaultCompletionDelay(self, _cmd)
{
    return 0.5;
}
,["CPTimeInterval"]), new objj_method(sel_getUid("defaultThemeClass"), function $CPTokenField__defaultThemeClass(self, _cmd)
{
    return "tokenfield";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPTokenField__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CGInsetMakeZero(), "editor-inset");
}
,["CPDictionary"])]);
}{
var the_class = objj_getClass("CPTokenField")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTokenField\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_completionsForSubstring:indexOfToken:indexOfSelectedItem:"), function $CPTokenField___completionsForSubstring_indexOfToken_indexOfSelectedItem_(self, _cmd, substring, tokenIndex, selectedIndex)
{
    if (objj_msgSend(objj_msgSend(self, "delegate"), "respondsToSelector:", sel_getUid("tokenField:completionsForSubstring:indexOfToken:indexOfSelectedItem:")))
    {
        return objj_msgSend(objj_msgSend(self, "delegate"), "tokenField:completionsForSubstring:indexOfToken:indexOfSelectedItem:", self, substring, tokenIndex, selectedIndex);
    }
    return [];
}
,["CPArray","CPString","int","int"]), new objj_method(sel_getUid("_completionOrigin:"), function $CPTokenField___completionOrigin_(self, _cmd, anAutocompleteMenu)
{
    var relativeFrame = self._inputFrame ? objj_msgSend(objj_msgSend(self._tokenScrollView, "documentView"), "convertRect:toView:", self._inputFrame, self) : objj_msgSend(self, "bounds");
    return CGPointMake(CGRectGetMinX(relativeFrame), CGRectGetMaxY(relativeFrame));
}
,["CGPoint","_CPAutocompleteMenu"]), new objj_method(sel_getUid("_displayStringForRepresentedObject:"), function $CPTokenField___displayStringForRepresentedObject_(self, _cmd, representedObject)
{
    if (objj_msgSend(objj_msgSend(self, "delegate"), "respondsToSelector:", sel_getUid("tokenField:displayStringForRepresentedObject:")))
    {
        var stringForRepresentedObject = objj_msgSend(objj_msgSend(self, "delegate"), "tokenField:displayStringForRepresentedObject:", self, representedObject);
        if (stringForRepresentedObject !== nil)
        {
            return stringForRepresentedObject;
        }
    }
    return representedObject;
}
,["CPString","id"]), new objj_method(sel_getUid("_shouldAddObjects:atIndex:"), function $CPTokenField___shouldAddObjects_atIndex_(self, _cmd, tokens, index)
{
    var delegate = objj_msgSend(self, "delegate");
    if (objj_msgSend(delegate, "respondsToSelector:", sel_getUid("tokenField:shouldAddObjects:atIndex:")))
    {
        var approvedObjects = objj_msgSend(delegate, "tokenField:shouldAddObjects:atIndex:", self, tokens, index);
        if (approvedObjects !== nil)
            return approvedObjects;
    }
    return tokens;
}
,["CPArray","CPArray","int"]), new objj_method(sel_getUid("_representedObjectForEditingString:"), function $CPTokenField___representedObjectForEditingString_(self, _cmd, aString)
{
    var delegate = objj_msgSend(self, "delegate");
    if (objj_msgSend(delegate, "respondsToSelector:", sel_getUid("tokenField:representedObjectForEditingString:")))
    {
        var token = objj_msgSend(delegate, "tokenField:representedObjectForEditingString:", self, aString);
        if (token !== nil && token !== undefined)
            return token;
    }
    return aString;
}
,["id","CPString"]), new objj_method(sel_getUid("_hasMenuForRepresentedObject:"), function $CPTokenField___hasMenuForRepresentedObject_(self, _cmd, aRepresentedObject)
{
    var delegate = objj_msgSend(self, "delegate");
    if (objj_msgSend(delegate, "respondsToSelector:", sel_getUid("tokenField:hasMenuForRepresentedObject:")) && objj_msgSend(delegate, "respondsToSelector:", sel_getUid("tokenField:menuForRepresentedObject:")))
        return objj_msgSend(delegate, "tokenField:hasMenuForRepresentedObject:", self, aRepresentedObject);
    return NO;
}
,["BOOL","id"]), new objj_method(sel_getUid("_menuForRepresentedObject:"), function $CPTokenField___menuForRepresentedObject_(self, _cmd, aRepresentedObject)
{
    var delegate = objj_msgSend(self, "delegate");
    if (objj_msgSend(delegate, "respondsToSelector:", sel_getUid("tokenField:hasMenuForRepresentedObject:")) && objj_msgSend(delegate, "respondsToSelector:", sel_getUid("tokenField:menuForRepresentedObject:")))
    {
        var hasMenu = objj_msgSend(delegate, "tokenField:hasMenuForRepresentedObject:", self, aRepresentedObject);
        if (hasMenu)
            return objj_msgSend(delegate, "tokenField:menuForRepresentedObject:", self, aRepresentedObject) || nil;
    }
    return nil;
}
,["CPMenu","id"]), new objj_method(sel_getUid("_delayedShowCompletions"), function $CPTokenField___delayedShowCompletions(self, _cmd)
{
    objj_msgSend(objj_msgSend(self, "_autocompleteMenu"), "_delayedShowCompletions");
}
,["void"]), new objj_method(sel_getUid("_hideCompletions"), function $CPTokenField___hideCompletions(self, _cmd)
{
    objj_msgSend(self._autocompleteMenu, "_hideCompletions");
}
,["void"]), new objj_method(sel_getUid("setButtonType:"), function $CPTokenField__setButtonType_(self, _cmd, aButtonType)
{
    if (self._buttonType === aButtonType)
        return;
    self._buttonType = aButtonType;
    objj_msgSend(self, "setNeedsLayout");
}
,["void","int"])]);
}{var the_class = objj_allocateClassPair(CPTextField, "_CPTokenFieldToken"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_deleteButton"), new objj_ivar("_disclosureButton"), new objj_ivar("_tokenField"), new objj_ivar("_representedObject"), new objj_ivar("_buttonType")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("acceptsFirstResponder"), function $_CPTokenFieldToken__acceptsFirstResponder(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("initWithFrame:"), function $_CPTokenFieldToken__initWithFrame_(self, _cmd, frame)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTokenFieldToken").super_class }, "initWithFrame:", frame))
    {
        objj_msgSend(self, "setEditable:", NO);
        objj_msgSend(self, "setHighlighted:", NO);
        objj_msgSend(self, "setBezeled:", YES);
        objj_msgSend(self, "setButtonType:", CPTokenFieldDisclosureButtonType);
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("tokenField"), function $_CPTokenFieldToken__tokenField(self, _cmd)
{
    return self._tokenField;
}
,["CPTokenField"]), new objj_method(sel_getUid("setTokenField:"), function $_CPTokenFieldToken__setTokenField_(self, _cmd, tokenField)
{
    self._tokenField = tokenField;
}
,["void","CPTokenField"]), new objj_method(sel_getUid("representedObject"), function $_CPTokenFieldToken__representedObject(self, _cmd)
{
    return self._representedObject;
}
,["id"]), new objj_method(sel_getUid("setRepresentedObject:"), function $_CPTokenFieldToken__setRepresentedObject_(self, _cmd, representedObject)
{
    self._representedObject = representedObject;
    objj_msgSend(self, "setNeedsLayout");
}
,["void","id"]), new objj_method(sel_getUid("setEditable:"), function $_CPTokenFieldToken__setEditable_(self, _cmd, shouldBeEditable)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTokenFieldToken").super_class }, "setEditable:", shouldBeEditable);
    objj_msgSend(self, "setNeedsLayout");
}
,["void","BOOL"]), new objj_method(sel_getUid("setThemeState:"), function $_CPTokenFieldToken__setThemeState_(self, _cmd, aState)
{
    var r = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTokenFieldToken").super_class }, "setThemeState:", aState);
    if (aState.hasThemeState(CPThemeStateHovered))
    {
        objj_msgSend(self._disclosureButton, "setThemeState:", CPThemeStateHovered);
        objj_msgSend(self._deleteButton, "setThemeState:", CPThemeStateHovered);
    }
    return r;
}
,["BOOL","CPThemeState"]), new objj_method(sel_getUid("unsetThemeState:"), function $_CPTokenFieldToken__unsetThemeState_(self, _cmd, aState)
{
    var r = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTokenFieldToken").super_class }, "unsetThemeState:", aState);
    if (aState.hasThemeState(CPThemeStateHovered))
    {
        objj_msgSend(self._disclosureButton, "unsetThemeState:", CPThemeStateHovered);
        objj_msgSend(self._deleteButton, "unsetThemeState:", CPThemeStateHovered);
    }
    return r;
}
,["BOOL","CPThemeState"]), new objj_method(sel_getUid("_minimumFrameSize"), function $_CPTokenFieldToken___minimumFrameSize(self, _cmd)
{
    var size = CGSizeMakeZero(),
        minSize = objj_msgSend(self, "currentValueForThemeAttribute:", "min-size"),
        contentInset = objj_msgSend(self, "currentValueForThemeAttribute:", "content-inset");
    size.height = minSize.height;
    size.width = MAX(minSize.width, objj_msgSend(objj_msgSend(self, "stringValue") || " ", "sizeWithFont:", objj_msgSend(self, "font")).width + contentInset.left + contentInset.right);
    return size;
}
,["CGSize"]), new objj_method(sel_getUid("setButtonType:"), function $_CPTokenFieldToken__setButtonType_(self, _cmd, aButtonType)
{
    if (self._buttonType === aButtonType)
        return;
    self._buttonType = aButtonType;
    if (self._buttonType === CPTokenFieldDisclosureButtonType)
    {
        if (self._deleteButton)
        {
            objj_msgSend(self._deleteButton, "removeFromSuperview");
            self._deleteButton = nil;
        }
        if (!self._disclosureButton)
        {
            self._disclosureButton = objj_msgSend(objj_msgSend(_CPTokenFieldTokenDisclosureButton, "alloc"), "initWithFrame:", CGRectMakeZero());
            objj_msgSend(self, "addSubview:", self._disclosureButton);
        }
    }
    else
    {
        if (self._disclosureButton)
        {
            objj_msgSend(self._disclosureButton, "removeFromSuperview");
            self._disclosureButton = nil;
        }
        if (!self._deleteButton)
        {
            self._deleteButton = objj_msgSend(objj_msgSend(_CPTokenFieldTokenCloseButton, "alloc"), "initWithFrame:", CGRectMakeZero());
            objj_msgSend(self, "addSubview:", self._deleteButton);
            objj_msgSend(self._deleteButton, "setTarget:", self);
            objj_msgSend(self._deleteButton, "setAction:", sel_getUid("_delete:"));
        }
    }
    objj_msgSend(self, "setNeedsLayout");
}
,["void","int"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPTokenFieldToken__layoutSubviews(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTokenFieldToken").super_class }, "layoutSubviews");
    var bezelView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "bezel-view", CPWindowBelow, "content-view");
    if (bezelView && self._tokenField)
    {
        switch(self._buttonType) {
        case CPTokenFieldDisclosureButtonType:
            var shouldBeEnabled = objj_msgSend(self, "hasMenu");
            objj_msgSend(self._disclosureButton, "setHidden:", !shouldBeEnabled);
            if (shouldBeEnabled)
                objj_msgSend(self._disclosureButton, "setMenu:", objj_msgSend(self, "menu"));
            var frame = objj_msgSend(bezelView, "frame"),
                buttonOffset = objj_msgSend(self._disclosureButton, "currentValueForThemeAttribute:", "offset"),
                buttonSize = objj_msgSend(self._disclosureButton, "currentValueForThemeAttribute:", "min-size");
            objj_msgSend(self._disclosureButton, "setFrame:", CGRectMake(CGRectGetMaxX(frame) - buttonOffset.x, CGRectGetMinY(frame) + buttonOffset.y, buttonSize.width, buttonSize.height));
            break;
        case CPTokenFieldDeleteButtonType:
            objj_msgSend(self._deleteButton, "setEnabled:", objj_msgSend(self, "isEditable") && objj_msgSend(self, "isEnabled"));
            var frame = objj_msgSend(bezelView, "frame"),
                buttonOffset = objj_msgSend(self._deleteButton, "currentValueForThemeAttribute:", "offset"),
                buttonSize = objj_msgSend(self._deleteButton, "currentValueForThemeAttribute:", "min-size");
            objj_msgSend(self._deleteButton, "setFrame:", CGRectMake(CGRectGetMaxX(frame) - buttonOffset.x, CGRectGetMinY(frame) + buttonOffset.y, buttonSize.width, buttonSize.height));
            break;
        }
    }
}
,["void"]), new objj_method(sel_getUid("mouseDown:"), function $_CPTokenFieldToken__mouseDown_(self, _cmd, anEvent)
{
    objj_msgSend(self._tokenField, "_mouseDownOnToken:withEvent:", self, anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseUp:"), function $_CPTokenFieldToken__mouseUp_(self, _cmd, anEvent)
{
    objj_msgSend(self._tokenField, "_mouseUpOnToken:withEvent:", self, anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("_delete:"), function $_CPTokenFieldToken___delete_(self, _cmd, sender)
{
    if (objj_msgSend(self, "isEditable"))
        objj_msgSend(self._tokenField, "_deleteToken:", self);
}
,["void","id"]), new objj_method(sel_getUid("hasMenu"), function $_CPTokenFieldToken__hasMenu(self, _cmd)
{
    return objj_msgSend(self._tokenField, "_hasMenuForRepresentedObject:", self._representedObject);
}
,["BOOL"]), new objj_method(sel_getUid("menu"), function $_CPTokenFieldToken__menu(self, _cmd)
{
    return objj_msgSend(self._tokenField, "_menuForRepresentedObject:", self._representedObject);
}
,["CPMenu"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $_CPTokenFieldToken__defaultThemeClass(self, _cmd)
{
    return "tokenfield-token";
}
,["CPString"])]);
}{var the_class = objj_allocateClassPair(CPButton, "_CPTokenFieldTokenCloseButton"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("mouseEntered:"), function $_CPTokenFieldTokenCloseButton__mouseEntered_(self, _cmd, anEvent)
{
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseExited:"), function $_CPTokenFieldTokenCloseButton__mouseExited_(self, _cmd, anEvent)
{
}
,["void","CPEvent"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("themeAttributes"), function $_CPTokenFieldTokenCloseButton__themeAttributes(self, _cmd)
{
    var attributes = objj_msgSend(CPButton, "themeAttributes");
    objj_msgSend(attributes, "setObject:forKey:", CGPointMake(15, 5), "offset");
    return attributes;
}
,["CPDictionary"]), new objj_method(sel_getUid("defaultThemeClass"), function $_CPTokenFieldTokenCloseButton__defaultThemeClass(self, _cmd)
{
    return "tokenfield-token-close-button";
}
,["CPString"])]);
}{var the_class = objj_allocateClassPair(CPPopUpButton, "_CPTokenFieldTokenDisclosureButton"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $_CPTokenFieldTokenDisclosureButton__initWithFrame_(self, _cmd, aFrame)
{
    if (self = objj_msgSend(self, "initWithFrame:pullsDown:", aFrame, YES))
    {
        objj_msgSend(self, "setBordered:", YES);
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTokenFieldTokenDisclosureButton").super_class }, "setTitle:", "");
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("setTitle:"), function $_CPTokenFieldTokenDisclosureButton__setTitle_(self, _cmd, aTitle)
{
}
,["void","CPString"]), new objj_method(sel_getUid("synchronizeTitleAndSelectedItem"), function $_CPTokenFieldTokenDisclosureButton__synchronizeTitleAndSelectedItem(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("mouseEntered:"), function $_CPTokenFieldTokenDisclosureButton__mouseEntered_(self, _cmd, anEvent)
{
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseExited:"), function $_CPTokenFieldTokenDisclosureButton__mouseExited_(self, _cmd, anEvent)
{
}
,["void","CPEvent"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("themeAttributes"), function $_CPTokenFieldTokenDisclosureButton__themeAttributes(self, _cmd)
{
    var attributes = objj_msgSend(CPButton, "themeAttributes");
    objj_msgSend(attributes, "setObject:forKey:", CGPointMake(15, 5), "offset");
    return attributes;
}
,["CPDictionary"]), new objj_method(sel_getUid("defaultThemeClass"), function $_CPTokenFieldTokenDisclosureButton__defaultThemeClass(self, _cmd)
{
    return "tokenfield-token-disclosure-button";
}
,["CPString"])]);
}var CPTokenFieldTokenizingCharacterSetKey = "CPTokenFieldTokenizingCharacterSetKey",
    CPTokenFieldCompletionDelayKey = "CPTokenFieldCompletionDelay",
    CPTokenFieldButtonTypeKey = "CPTokenFieldButtonTypeKey";
{
var the_class = objj_getClass("CPTokenField")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTokenField\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPTokenField__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._tokenizingCharacterSet = objj_msgSend(aCoder, "decodeObjectForKey:", CPTokenFieldTokenizingCharacterSetKey) || objj_msgSend(objj_msgSend(self, "class"), "defaultTokenizingCharacterSet");
        self._completionDelay = objj_msgSend(aCoder, "decodeDoubleForKey:", CPTokenFieldCompletionDelayKey) || objj_msgSend(objj_msgSend(self, "class"), "defaultCompletionDelay");
        self._buttonType = objj_msgSend(aCoder, "decodeIntForKey:", CPTokenFieldButtonTypeKey) || CPTokenFieldDisclosureButtonType;
        objj_msgSend(self, "_init");
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPTokenField__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._tokenizingCharacterSet, CPTokenFieldTokenizingCharacterSetKey);
    objj_msgSend(aCoder, "encodeDouble:forKey:", self._completionDelay, CPTokenFieldCompletionDelayKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._buttonType, CPTokenFieldButtonTypeKey);
}
,["void","CPCoder"])]);
}