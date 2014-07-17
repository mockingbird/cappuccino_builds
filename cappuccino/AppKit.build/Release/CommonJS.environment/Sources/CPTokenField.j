@STATIC;1.0;I;27;Foundation/CPCharacterSet.jI;23;Foundation/CPIndexSet.jI;20;Foundation/CPTimer.ji;21;_CPAutocompleteMenu.ji;10;CPButton.ji;15;CPPopUpButton.ji;14;CPScrollView.ji;13;CPTableView.ji;8;CPText.ji;13;CPTextField.ji;20;CPWindow_Constants.jt;68394;objj_executeFile("Foundation/CPCharacterSet.j", NO);objj_executeFile("Foundation/CPIndexSet.j", NO);objj_executeFile("Foundation/CPTimer.j", NO);objj_executeFile("_CPAutocompleteMenu.j", YES);objj_executeFile("CPButton.j", YES);objj_executeFile("CPPopUpButton.j", YES);objj_executeFile("CPScrollView.j", YES);objj_executeFile("CPTableView.j", YES);objj_executeFile("CPText.j", YES);objj_executeFile("CPTextField.j", YES);objj_executeFile("CPWindow_Constants.j", YES);{var the_protocol = objj_allocateProtocol("CPTokenFieldDelegate");
var aProtocol = objj_getProtocol("CPObject");
if (!aProtocol) throw new SyntaxError("*** Could not find definition for protocol \"CPTokenFieldDelegate\"");
protocol_addProtocol(the_protocol, aProtocol);
objj_registerProtocol(the_protocol);
}var CPTokenFieldDelegate_tokenField_hasMenuForRepresentedObject_ = 1 << 1,
    CPTokenFieldDelegate_tokenField_completionsForSubstring_indexOfToken_indexOfSelectedItem_ = 1 << 2,
    CPTokenFieldDelegate_tokenField_shouldAddObjects_atIndex_ = 1 << 3,
    CPTokenFieldDelegate_tokenField_menuForRepresentedObject_ = 1 << 4,
    CPTokenFieldDelegate_tokenField_displayStringForRepresentedObject_ = 1 << 5,
    CPTokenFieldDelegate_tokenField_representedObjectForEditingString_ = 1 << 6;
var CPScrollDestinationNone = 0,
    CPScrollDestinationLeft = 1,
    CPScrollDestinationRight = 2;
CPTokenFieldDisclosureButtonType = 0;
CPTokenFieldDeleteButtonType = 1;
{var the_class = objj_allocateClassPair(CPTextField, "CPTokenField"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_tokenScrollView"), new objj_ivar("_shouldScrollTo"), new objj_ivar("_selectedRange"), new objj_ivar("_autocompleteMenu"), new objj_ivar("_inputFrame"), new objj_ivar("_completionDelay"), new objj_ivar("_tokenizingCharacterSet"), new objj_ivar("_mouseDownEvent"), new objj_ivar("_shouldNotifyTarget"), new objj_ivar("_buttonType"), new objj_ivar("_tokenFieldDelegate"), new objj_ivar("_implementedDelegateMethods")]);objj_registerClassPair(the_class);
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
        self._completionDelay = ((___r1 = (self == null ? null : self.isa.objj_msgSend0(self, "class"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "defaultCompletionDelay"));
        self._tokenizingCharacterSet = ((___r1 = (self == null ? null : self.isa.objj_msgSend0(self, "class"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "defaultTokenizingCharacterSet"));
        self._buttonType = CPTokenFieldDisclosureButtonType;
        (self == null ? null : self.isa.objj_msgSend1(self, "setBezeled:", YES));
        (self == null ? null : self.isa.objj_msgSend0(self, "_init"));
        (self == null ? null : self.isa.objj_msgSend1(self, "setObjectValue:", []));
        (self == null ? null : self.isa.objj_msgSend0(self, "setNeedsLayout"));
    }
    return self;
    var ___r1;
}
,["id","CGRect"]), new objj_method(sel_getUid("_init"), function $CPTokenField___init(self, _cmd)
{
    self._selectedRange = CPMakeRange(0, 0);
    var frame = self.isa.objj_msgSend0(self, "frame");
    self._tokenScrollView = ((___r1 = CPScrollView.isa.objj_msgSend0(CPScrollView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    ((___r1 = self._tokenScrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHasHorizontalScroller:", NO));
    ((___r1 = self._tokenScrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHasVerticalScroller:", NO));
    ((___r1 = self._tokenScrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
    var contentView = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setAutoresizingMask:", CPViewWidthSizable));
    ((___r1 = self._tokenScrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDocumentView:", contentView));
    self.isa.objj_msgSend1(self, "addSubview:", self._tokenScrollView);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setDelegate:"), function $CPTokenField__setDelegate_(self, _cmd, aDelegate)
{
    if (self._tokenFieldDelegate === aDelegate)
        return;
    self._tokenFieldDelegate = aDelegate;
    self._implementedDelegateMethods = 0;
    if (((___r1 = self._tokenFieldDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tokenField:hasMenuForRepresentedObject:"))))
        self._implementedDelegateMethods |= CPTokenFieldDelegate_tokenField_hasMenuForRepresentedObject_;
    if (((___r1 = self._tokenFieldDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tokenField:completionsForSubstring:indexOfToken:indexOfSelectedItem:"))))
        self._implementedDelegateMethods |= CPTokenFieldDelegate_tokenField_completionsForSubstring_indexOfToken_indexOfSelectedItem_;
    if (((___r1 = self._tokenFieldDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tokenField:shouldAddObjects:atIndex:"))))
        self._implementedDelegateMethods |= CPTokenFieldDelegate_tokenField_shouldAddObjects_atIndex_;
    if (((___r1 = self._tokenFieldDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tokenField:menuForRepresentedObject:"))))
        self._implementedDelegateMethods |= CPTokenFieldDelegate_tokenField_menuForRepresentedObject_;
    if (((___r1 = self._tokenFieldDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tokenField:displayStringForRepresentedObject:"))))
        self._implementedDelegateMethods |= CPTokenFieldDelegate_tokenField_displayStringForRepresentedObject_;
    if (((___r1 = self._tokenFieldDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tokenField:representedObjectForEditingString:"))))
        self._implementedDelegateMethods |= CPTokenFieldDelegate_tokenField_representedObjectForEditingString_;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "setDelegate:", self._tokenFieldDelegate);
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("_autocompleteMenu"), function $CPTokenField___autocompleteMenu(self, _cmd)
{
    if (!self._autocompleteMenu)
        self._autocompleteMenu = ((___r1 = _CPAutocompleteMenu.isa.objj_msgSend0(_CPAutocompleteMenu, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithTextField:", self));
    return self._autocompleteMenu;
    var ___r1;
}
,["_CPAutocompleteMenu"]), new objj_method(sel_getUid("_complete:"), function $CPTokenField___complete_(self, _cmd, anAutocompleteMenu)
{
    self.isa.objj_msgSend1(self, "_autocompleteWithEvent:", nil);
}
,["void","_CPAutocompleteMenu"]), new objj_method(sel_getUid("_autocompleteWithEvent:"), function $CPTokenField___autocompleteWithEvent_(self, _cmd, anEvent)
{
    if (!self.isa.objj_msgSend0(self, "_editorValue") && (!((___r1 = self._autocompleteMenu), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "contentArray")) || !self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateAutocompleting)))
        return;
    self.isa.objj_msgSend0(self, "_hideCompletions");
    var token = ((___r1 = self._autocompleteMenu), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selectedItem")),
        shouldRemoveLastObject = token !== "" && self.isa.objj_msgSend0(self, "_editorValue") !== "";
    if (!token)
        token = self.isa.objj_msgSend0(self, "_editorValue");
    if (!token || token === "")
    {
        var character = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "charactersIgnoringModifiers")),
            modifierFlags = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "modifierFlags"));
        if (character === CPTabCharacter)
        {
            if (!(modifierFlags & CPShiftKeyMask))
                ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "selectNextKeyView:", self));
            else
                ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "selectPreviousKeyView:", self));
        }
        else
            ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeFirstResponder:", nil));
        return;
    }
    var objectValue = self.isa.objj_msgSend0(self, "objectValue");
    if (shouldRemoveLastObject)
        (objectValue == null ? null : objectValue.isa.objj_msgSend1(objectValue, "removeObjectAtIndex:", self._selectedRange.location));
    token = self.isa.objj_msgSend1(self, "_representedObjectForEditingString:", token);
    var delegateApprovedObjects = self.isa.objj_msgSend2(self, "_shouldAddObjects:atIndex:", CPArray.isa.objj_msgSend1(CPArray, "arrayWithObject:", token), self._selectedRange.location),
        delegateApprovedObjectsCount = (delegateApprovedObjects == null ? null : delegateApprovedObjects.isa.objj_msgSend0(delegateApprovedObjects, "count"));
    if (delegateApprovedObjects)
    {
        for (var i = 0; i < delegateApprovedObjectsCount; i++)
        {
            (objectValue == null ? null : objectValue.isa.objj_msgSend2(objectValue, "insertObject:atIndex:", (delegateApprovedObjects == null ? null : delegateApprovedObjects.isa.objj_msgSend1(delegateApprovedObjects, "objectAtIndex:", i)), self._selectedRange.location + i));
        }
    }
    var location = self._selectedRange.location;
    self.isa.objj_msgSend1(self, "setObjectValue:", objectValue);
    if (delegateApprovedObjectsCount)
        location += delegateApprovedObjectsCount;
    self._selectedRange = CPMakeRange(location, 0);
    self.isa.objj_msgSend0(self, "_inputElement").value = "";
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend0(self, "_controlTextDidChange");
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("_autocomplete"), function $CPTokenField___autocomplete(self, _cmd)
{
    self.isa.objj_msgSend1(self, "_autocompleteWithEvent:", nil);
}
,["void"]), new objj_method(sel_getUid("_selectToken:byExtendingSelection:"), function $CPTokenField___selectToken_byExtendingSelection_(self, _cmd, token, extend)
{
    var indexOfToken = ((___r1 = self.isa.objj_msgSend0(self, "_tokens")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", token));
    if (indexOfToken == CPNotFound)
    {
        if (!extend)
            self._selectedRange = CPMakeRange(((___r1 = self.isa.objj_msgSend0(self, "_tokens")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")), 0);
    }
    else if (extend)
        self._selectedRange = CPUnionRange(self._selectedRange, CPMakeRange(indexOfToken, 1));
    else
        self._selectedRange = CPMakeRange(indexOfToken, 1);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    var ___r1;
}
,["void","_CPTokenFieldToken","BOOL"]), new objj_method(sel_getUid("_deselectToken:"), function $CPTokenField___deselectToken_(self, _cmd, token)
{
    var indexOfToken = ((___r1 = self.isa.objj_msgSend0(self, "_tokens")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", token));
    if (CPLocationInRange(indexOfToken, self._selectedRange))
        self._selectedRange = CPMakeRange(MAX(indexOfToken, self._selectedRange.location), MIN(self._selectedRange.length, indexOfToken - self._selectedRange.location));
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    var ___r1;
}
,["void","_CPTokenFieldToken"]), new objj_method(sel_getUid("_deleteToken:"), function $CPTokenField___deleteToken_(self, _cmd, token)
{
    var indexOfToken = ((___r1 = self.isa.objj_msgSend0(self, "_tokens")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", token)),
        objectValue = self.isa.objj_msgSend0(self, "objectValue");
    if (indexOfToken < self._selectedRange.location)
        self._selectedRange.location--;
    else
        self.isa.objj_msgSend1(self, "_deselectToken:", token);
    var selection = CPMakeRangeCopy(self._selectedRange);
    (objectValue == null ? null : objectValue.isa.objj_msgSend1(objectValue, "removeObjectAtIndex:", indexOfToken));
    self.isa.objj_msgSend1(self, "setObjectValue:", objectValue);
    self._selectedRange = selection;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend0(self, "_controlTextDidChange");
    var ___r1;
}
,["void","_CPTokenFieldToken"]), new objj_method(sel_getUid("_controlTextDidChange"), function $CPTokenField___controlTextDidChange(self, _cmd)
{
    var binderClass = ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_binderClassForBinding:", CPValueBinding)),
        theBinding = (binderClass == null ? null : binderClass.isa.objj_msgSend2(binderClass, "getBinding:forObject:", CPValueBinding, self));
    if (theBinding)
        (theBinding == null ? null : theBinding.isa.objj_msgSend1(theBinding, "reverseSetValueFor:", "objectValue"));
    self.isa.objj_msgSend1(self, "textDidChange:", CPNotification.isa.objj_msgSend3(CPNotification, "notificationWithName:object:userInfo:", CPControlTextDidChangeNotification, self, nil));
    self._shouldNotifyTarget = YES;
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_removeSelectedTokens:"), function $CPTokenField___removeSelectedTokens_(self, _cmd, sender)
{
    var tokens = self.isa.objj_msgSend0(self, "objectValue");
    for (var i = self._selectedRange.length - 1; i >= 0; i--)
        (tokens == null ? null : tokens.isa.objj_msgSend1(tokens, "removeObjectAtIndex:", self._selectedRange.location + i));
    var collapsedSelection = self._selectedRange.location;
    self.isa.objj_msgSend1(self, "setObjectValue:", tokens);
    self._selectedRange = CPMakeRange(collapsedSelection, 0);
    self.isa.objj_msgSend0(self, "_controlTextDidChange");
}
,["void","id"]), new objj_method(sel_getUid("_updatePlaceholderState"), function $CPTokenField___updatePlaceholderState(self, _cmd)
{
    if (((___r1 = self.isa.objj_msgSend0(self, "_tokens")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) === 0 && !self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateEditing))
        self.isa.objj_msgSend1(self, "setThemeState:", CPTextFieldStatePlaceholder);
    else
        self.isa.objj_msgSend1(self, "unsetThemeState:", CPTextFieldStatePlaceholder);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("becomeFirstResponder"), function $CPTokenField__becomeFirstResponder(self, _cmd)
{
    if (!objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "becomeFirstResponder"))
        return NO;
    self.isa.objj_msgSend1(self, "_setObserveWindowKeyNotifications:", YES);
    self.isa.objj_msgSend1(self, "scrollRectToVisible:", self.isa.objj_msgSend0(self, "bounds"));
    if (((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isKeyWindow")))
        return self.isa.objj_msgSend0(self, "_becomeFirstKeyResponder");
    return YES;
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("_becomeFirstKeyResponder"), function $CPTokenField___becomeFirstKeyResponder(self, _cmd)
{
    if (!self.isa.objj_msgSend0(self, "_isWithinUsablePlatformRect"))
        return NO;
    self.isa.objj_msgSend1(self, "setThemeState:", CPThemeStateEditing);
    self.isa.objj_msgSend0(self, "_updatePlaceholderState");
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("resignFirstResponder"), function $CPTokenField__resignFirstResponder(self, _cmd)
{
    self.isa.objj_msgSend0(self, "_autocomplete");
    self.isa.objj_msgSend1(self, "_setObserveWindowKeyNotifications:", NO);
    self.isa.objj_msgSend0(self, "_resignFirstKeyResponder");
    if (self._shouldNotifyTarget)
    {
        self._shouldNotifyTarget = NO;
        self.isa.objj_msgSend1(self, "textDidEndEditing:", CPNotification.isa.objj_msgSend3(CPNotification, "notificationWithName:object:userInfo:", CPControlTextDidEndEditingNotification, self, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", self.isa.objj_msgSend0(self, "_currentTextMovement"), "CPTextMovement")));
        if (self.isa.objj_msgSend0(self, "sendsActionOnEndEditing"))
            self.isa.objj_msgSend2(self, "sendAction:to:", self.isa.objj_msgSend0(self, "action"), self.isa.objj_msgSend0(self, "target"));
    }
    self.isa.objj_msgSend1(self, "textDidBlur:", CPNotification.isa.objj_msgSend3(CPNotification, "notificationWithName:object:userInfo:", CPTextFieldDidBlurNotification, self, nil));
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("_resignFirstKeyResponder"), function $CPTokenField___resignFirstKeyResponder(self, _cmd)
{
    self.isa.objj_msgSend1(self, "unsetThemeState:", CPThemeStateEditing);
    self.isa.objj_msgSend0(self, "_updatePlaceholderState");
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void"]), new objj_method(sel_getUid("mouseDown:"), function $CPTokenField__mouseDown_(self, _cmd, anEvent)
{
    self._mouseDownEvent = anEvent;
    self.isa.objj_msgSend2(self, "_selectToken:byExtendingSelection:", nil, NO);
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
    if (self._mouseDownEvent && CGPointEqualToPoint(((___r1 = self._mouseDownEvent), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "locationInWindow")), (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow"))))
    {
        self.isa.objj_msgSend2(self, "_selectToken:byExtendingSelection:", aToken, (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "modifierFlags")) & CPShiftKeyMask);
        ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeFirstResponder:", self));
        self._shouldScrollTo = aToken;
    }
    var ___r1;
}
,["void","_CPTokenFieldToken","CPEvent"]), new objj_method(sel_getUid("_tokens"), function $CPTokenField___tokens(self, _cmd)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "objectValue");
}
,["CPArray"]), new objj_method(sel_getUid("stringValue"), function $CPTokenField__stringValue(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "objectValue")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "componentsJoinedByString:", ","));
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("objectValue"), function $CPTokenField__objectValue(self, _cmd)
{
    var objectValue = [];
    for (var i = 0, count = ((___r1 = self.isa.objj_msgSend0(self, "_tokens")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")); i < count; i++)
    {
        var token = ((___r1 = self.isa.objj_msgSend0(self, "_tokens")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", i));
        if ((token == null ? null : token.isa.objj_msgSend1(token, "isKindOfClass:", CPString.isa.objj_msgSend0(CPString, "class"))))
            continue;
        (objectValue == null ? null : objectValue.isa.objj_msgSend1(objectValue, "addObject:", (token == null ? null : token.isa.objj_msgSend0(token, "representedObject"))));
    }
    return objectValue;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("setObjectValue:"), function $CPTokenField__setObjectValue_(self, _cmd, aValue)
{
    if (aValue !== nil && !(aValue == null ? null : aValue.isa.objj_msgSend1(aValue, "isKindOfClass:", CPArray.isa.objj_msgSend0(CPArray, "class"))))
    {
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "setObjectValue:", nil);
        return;
    }
    var superValue = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "objectValue");
    if (aValue === superValue || (aValue == null ? null : aValue.isa.objj_msgSend1(aValue, "isEqualToArray:", superValue)))
        return;
    var contentView = ((___r1 = self._tokenScrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "documentView")),
        oldTokens = self.isa.objj_msgSend0(self, "_tokens"),
        newTokens = [];
    if (aValue !== nil)
    {
        for (var i = 0, count = (aValue == null ? null : aValue.isa.objj_msgSend0(aValue, "count")); i < count; i++)
        {
            var tokenObject = aValue[i],
                tokenValue = self.isa.objj_msgSend1(self, "_displayStringForRepresentedObject:", tokenObject),
                newToken = nil;
            for (var j = 0, oldCount = (oldTokens == null ? null : oldTokens.isa.objj_msgSend0(oldTokens, "count")); j < oldCount; j++)
            {
                var oldToken = oldTokens[j];
                if ((oldToken == null ? null : oldToken.isa.objj_msgSend0(oldToken, "representedObject")) == tokenObject)
                {
                    (oldTokens == null ? null : oldTokens.isa.objj_msgSend1(oldTokens, "removeObjectAtIndex:", j));
                    newToken = oldToken;
                    break;
                }
            }
            if (newToken === nil)
            {
                newToken = (_CPTokenFieldToken == null ? null : _CPTokenFieldToken.isa.objj_msgSend0(_CPTokenFieldToken, "new"));
                (newToken == null ? null : newToken.isa.objj_msgSend1(newToken, "setTokenField:", self));
                (newToken == null ? null : newToken.isa.objj_msgSend1(newToken, "setRepresentedObject:", tokenObject));
                (newToken == null ? null : newToken.isa.objj_msgSend1(newToken, "setStringValue:", tokenValue));
                (newToken == null ? null : newToken.isa.objj_msgSend1(newToken, "setEditable:", self.isa.objj_msgSend0(self, "isEditable")));
                (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "addSubview:", newToken));
            }
            newTokens.push(newToken);
        }
    }
    for (var j = 0, oldCount = (oldTokens == null ? null : oldTokens.isa.objj_msgSend0(oldTokens, "count")); j < oldCount; j++)
        ((___r1 = oldTokens[j]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
    self._value = newTokens;
    self.isa.objj_msgSend2(self, "_selectToken:byExtendingSelection:", nil, NO);
    self.isa.objj_msgSend0(self, "_updatePlaceholderState");
    self._shouldScrollTo = CPScrollDestinationRight;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("setEnabled:"), function $CPTokenField__setEnabled_(self, _cmd, shouldBeEnabled)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "setEnabled:", shouldBeEnabled);
    for (var i = 0, count = ((___r1 = self.isa.objj_msgSend0(self, "_tokens")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")); i < count; i++)
    {
        var token = ((___r1 = self.isa.objj_msgSend0(self, "_tokens")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", i));
        if ((token == null ? null : token.isa.objj_msgSend1(token, "respondsToSelector:", sel_getUid("setEnabled:"))))
            (token == null ? null : token.isa.objj_msgSend1(token, "setEnabled:", shouldBeEnabled));
    }
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("setEditable:"), function $CPTokenField__setEditable_(self, _cmd, shouldBeEditable)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "setEditable:", shouldBeEditable);
    ((___r1 = self.isa.objj_msgSend0(self, "_tokens")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("setEditable:"), shouldBeEditable));
    var ___r1;
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
    if (!self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateEditing))
        return "";
    return self.isa.objj_msgSend0(self, "_inputElement").value;
}
,["CPString"]), new objj_method(sel_getUid("moveUp:"), function $CPTokenField__moveUp_(self, _cmd, sender)
{
    ((___r1 = self.isa.objj_msgSend0(self, "_autocompleteMenu")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selectPrevious"));
    ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_propagateCurrentDOMEvent:", NO));
    var ___r1, ___r2;
}
,["void","id"]), new objj_method(sel_getUid("moveDown:"), function $CPTokenField__moveDown_(self, _cmd, sender)
{
    ((___r1 = self.isa.objj_msgSend0(self, "_autocompleteMenu")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selectNext"));
    ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_propagateCurrentDOMEvent:", NO));
    var ___r1, ___r2;
}
,["void","id"]), new objj_method(sel_getUid("insertNewline:"), function $CPTokenField__insertNewline_(self, _cmd, sender)
{
    if (self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateAutocompleting))
    {
        self.isa.objj_msgSend1(self, "_autocompleteWithEvent:", (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent")));
    }
    else
    {
        self.isa.objj_msgSend2(self, "sendAction:to:", self.isa.objj_msgSend0(self, "action"), self.isa.objj_msgSend0(self, "target"));
        ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeFirstResponder:", nil));
    }
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("insertTab:"), function $CPTokenField__insertTab_(self, _cmd, sender)
{
    var anEvent = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent"));
    if (self.isa.objj_msgSend1(self, "hasThemeState:", CPThemeStateAutocompleting))
    {
        self.isa.objj_msgSend1(self, "_autocompleteWithEvent:", anEvent);
    }
    else
    {
        if (!((anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "modifierFlags")) & CPShiftKeyMask))
            ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "selectNextKeyView:", self));
        else
            ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "selectPreviousKeyView:", self));
    }
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("insertText:"), function $CPTokenField__insertText_(self, _cmd, characters)
{
    if (((___r1 = self._tokenizingCharacterSet), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "characterIsMember:", (characters == null ? null : characters.isa.objj_msgSend1(characters, "substringToIndex:", 1)))))
    {
        self.isa.objj_msgSend1(self, "_autocompleteWithEvent:", (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent")));
    }
    else
    {
        if (self._selectedRange.length)
        {
            self.isa.objj_msgSend1(self, "_removeSelectedTokens:", self);
            self.isa.objj_msgSend0(self, "layoutSubviews");
        }
        ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_propagateCurrentDOMEvent:", YES));
    }
    var ___r1, ___r2;
}
,["void","CPString"]), new objj_method(sel_getUid("cancelOperation:"), function $CPTokenField__cancelOperation_(self, _cmd, sender)
{
    self.isa.objj_msgSend0(self, "_hideCompletions");
}
,["void","id"]), new objj_method(sel_getUid("moveLeft:"), function $CPTokenField__moveLeft_(self, _cmd, sender)
{
    if ((self._selectedRange.location > 0 || self._selectedRange.length) && self.isa.objj_msgSend0(self, "_editorValue") == "")
    {
        if (self._selectedRange.length)
            self._selectedRange.length = 0;
        else
            self._selectedRange.location--;
        self.isa.objj_msgSend0(self, "setNeedsLayout");
        self._shouldScrollTo = CPScrollDestinationLeft;
    }
    else
    {
        ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_propagateCurrentDOMEvent:", YES));
    }
    var ___r1, ___r2;
}
,["void","id"]), new objj_method(sel_getUid("moveLeftAndModifySelection:"), function $CPTokenField__moveLeftAndModifySelection_(self, _cmd, sender)
{
    if (self._selectedRange.location > 0 && self.isa.objj_msgSend0(self, "_editorValue") == "")
    {
        self._selectedRange.location--;
        self._selectedRange.length++;
        self.isa.objj_msgSend0(self, "setNeedsLayout");
        self._shouldScrollTo = CPScrollDestinationLeft;
    }
    else
    {
        ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_propagateCurrentDOMEvent:", YES));
    }
    var ___r1, ___r2;
}
,["void","id"]), new objj_method(sel_getUid("moveRight:"), function $CPTokenField__moveRight_(self, _cmd, sender)
{
    if ((self._selectedRange.location < ((___r1 = self.isa.objj_msgSend0(self, "_tokens")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) || self._selectedRange.length) && self.isa.objj_msgSend0(self, "_editorValue") == "")
    {
        if (self._selectedRange.length)
        {
            self._selectedRange.location = CPMaxRange(self._selectedRange);
            self._selectedRange.length = 0;
        }
        else
        {
            self._selectedRange.location = MIN(((___r1 = self.isa.objj_msgSend0(self, "_tokens")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")), self._selectedRange.location + self._selectedRange.length + 1);
        }
        self.isa.objj_msgSend0(self, "setNeedsLayout");
        self._shouldScrollTo = CPScrollDestinationRight;
    }
    else
    {
        ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_propagateCurrentDOMEvent:", YES));
    }
    var ___r1, ___r2;
}
,["void","id"]), new objj_method(sel_getUid("moveRightAndModifySelection:"), function $CPTokenField__moveRightAndModifySelection_(self, _cmd, sender)
{
    if (CPMaxRange(self._selectedRange) < ((___r1 = self.isa.objj_msgSend0(self, "_tokens")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) && self.isa.objj_msgSend0(self, "_editorValue") == "")
    {
        self._selectedRange.length++;
        self.isa.objj_msgSend0(self, "setNeedsLayout");
        self._shouldScrollTo = CPScrollDestinationRight;
    }
    else
    {
        ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_propagateCurrentDOMEvent:", YES));
    }
    var ___r1, ___r2;
}
,["void","id"]), new objj_method(sel_getUid("deleteBackward:"), function $CPTokenField__deleteBackward_(self, _cmd, sender)
{
    if (self.isa.objj_msgSend0(self, "_editorValue") == "")
    {
        self.isa.objj_msgSend0(self, "_hideCompletions");
        if (CPEmptyRange(self._selectedRange))
        {
            if (self._selectedRange.location > 0)
            {
                var tokenView = ((___r1 = self.isa.objj_msgSend0(self, "_tokens")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", self._selectedRange.location - 1));
                self.isa.objj_msgSend2(self, "_selectToken:byExtendingSelection:", tokenView, NO);
            }
        }
        else
            self.isa.objj_msgSend1(self, "_removeSelectedTokens:", nil);
    }
    else
    {
        ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_propagateCurrentDOMEvent:", YES));
    }
    var ___r1, ___r2;
}
,["void","id"]), new objj_method(sel_getUid("deleteForward:"), function $CPTokenField__deleteForward_(self, _cmd, sender)
{
    if (self.isa.objj_msgSend0(self, "_editorValue") == "")
    {
        self.isa.objj_msgSend0(self, "_hideCompletions");
        if (CPEmptyRange(self._selectedRange))
        {
            if (self._selectedRange.location < ((___r1 = self.isa.objj_msgSend0(self, "_tokens")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")))
                self.isa.objj_msgSend1(self, "_deleteToken:", ((___r1 = self.isa.objj_msgSend0(self, "_tokens")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", [self._selectedRange.location])));
        }
        else
            self.isa.objj_msgSend1(self, "_removeSelectedTokens:", nil);
    }
    else
    {
        ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_propagateCurrentDOMEvent:", YES));
    }
    var ___r1, ___r2;
}
,["void","id"]), new objj_method(sel_getUid("_selectText:immediately:"), function $CPTokenField___selectText_immediately_(self, _cmd, sender, immediately)
{
    if (self.isa.objj_msgSend0(self, "isEditable") || self.isa.objj_msgSend0(self, "isSelectable"))
    {
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "_selectText:immediately:", sender, immediately);
        self.isa.objj_msgSend0(self, "_autocomplete");
        self._selectedRange = CPMakeRange(0, ((___r1 = self.isa.objj_msgSend0(self, "_tokens")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")));
        self.isa.objj_msgSend0(self, "setNeedsLayout");
    }
    var ___r1;
}
,["void","id","BOOL"]), new objj_method(sel_getUid("keyDown:"), function $CPTokenField__keyDown_(self, _cmd, anEvent)
{
    self.isa.objj_msgSend1(self, "interpretKeyEvents:", [anEvent]);
    ((___r1 = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "currentRunLoop")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "limitDateForMode:", CPDefaultRunLoopMode));
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("keyUp:"), function $CPTokenField__keyUp_(self, _cmd, anEvent)
{
    ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_propagateCurrentDOMEvent:", YES));
    var ___r1, ___r2;
}
,["void","CPEvent"]), new objj_method(sel_getUid("textDidChange:"), function $CPTokenField__textDidChange_(self, _cmd, aNotification)
{
    if ((aNotification == null ? null : aNotification.isa.objj_msgSend0(aNotification, "object")) !== self)
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "textDidChange:", aNotification);
    self.isa.objj_msgSend0(self, "_delayedShowCompletions");
    self._selectedRange.length = 0;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
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
    ((___r1 = self._tokenScrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", self.isa.objj_msgSend1(self, "rectForEphemeralSubviewNamed:", "content-view")));
    var textFieldContentView = self.isa.objj_msgSend3(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "content-view", CPWindowAbove, "bezel-view");
    if (textFieldContentView)
        (textFieldContentView == null ? null : textFieldContentView.isa.objj_msgSend1(textFieldContentView, "setHidden:", self.isa.objj_msgSend0(self, "stringValue") !== ""));
    var frame = self.isa.objj_msgSend0(self, "frame"),
        contentView = ((___r1 = self._tokenScrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "documentView")),
        tokens = self.isa.objj_msgSend0(self, "_tokens");
    if (!(tokens == null ? null : tokens.isa.objj_msgSend1(tokens, "isKindOfClass:", CPArray.isa.objj_msgSend0(CPArray, "class"))))
        return;
    var contentRect = CGRectMakeCopy((contentView == null ? null : contentView.isa.objj_msgSend0(contentView, "bounds"))),
        contentOrigin = contentRect.origin,
        contentSize = contentRect.size,
        offset = CGPointMake(contentOrigin.x, contentOrigin.y),
        spaceBetweenTokens = CGSizeMake(2.0, 2.0),
        isEditing = ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "firstResponder")) == self,
        tokenToken = (_CPTokenFieldToken == null ? null : _CPTokenFieldToken.isa.objj_msgSend0(_CPTokenFieldToken, "new")),
        font = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "font"),
        lineHeight = (font == null ? null : font.isa.objj_msgSend0(font, "defaultLineHeightForFont")),
        editorInset = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "editor-inset");
    offset.y += CEIL(spaceBetweenTokens.height / 2.0);
    (tokenToken == null ? null : tokenToken.isa.objj_msgSend0(tokenToken, "sizeToFit"));
    var tokenHeight = CGRectGetHeight((tokenToken == null ? null : tokenToken.isa.objj_msgSend0(tokenToken, "bounds")));
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
        if (CGRectGetHeight((contentView == null ? null : contentView.isa.objj_msgSend0(contentView, "bounds"))) < scrollHeight)
            (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setFrameSize:", CGSizeMake(CGRectGetWidth(((___r1 = self._tokenScrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds"))), scrollHeight)));
        offset.x += width + spaceBetweenTokens.width;
        return r;
        var ___r1;
    };
    var placeEditor = function(useRemainingWidth)
    {
        var element = self.isa.objj_msgSend0(self, "_inputElement"),
            textWidth = 1;
        if (self._selectedRange.length === 0)
        {
            textWidth = ((___r1 = (element.value || "") + "X"), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "sizeWithFont:", font)).width;
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
            ((___r1 = ((___r2 = self._tokenScrollView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "documentView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollPoint:", CGPointMake(0, self._inputFrame.origin.y)));
        var ___r1, ___r2;
    };
    for (var i = 0, count = (tokens == null ? null : tokens.isa.objj_msgSend0(tokens, "count")); i < count; i++)
    {
        if (isEditing && !self._selectedRange.length && i == CPMaxRange(self._selectedRange))
            placeEditor(false);
        var tokenView = (tokens == null ? null : tokens.isa.objj_msgSend1(tokens, "objectAtIndex:", i));
        if ((tokenView == null ? null : tokenView.isa.objj_msgSend1(tokenView, "isKindOfClass:", CPString.isa.objj_msgSend0(CPString, "class"))))
            continue;
        (tokenView == null ? null : tokenView.isa.objj_msgSend1(tokenView, "setHighlighted:", CPLocationInRange(i, self._selectedRange)));
        (tokenView == null ? null : tokenView.isa.objj_msgSend0(tokenView, "sizeToFit"));
        var size = (contentView == null ? null : contentView.isa.objj_msgSend0(contentView, "bounds")).size,
            tokenViewSize = (tokenView == null ? null : tokenView.isa.objj_msgSend0(tokenView, "bounds")).size,
            tokenFrame = fitAndFrame(tokenViewSize.width, tokenViewSize.height);
        (tokenView == null ? null : tokenView.isa.objj_msgSend1(tokenView, "setFrame:", tokenFrame));
        (tokenView == null ? null : tokenView.isa.objj_msgSend1(tokenView, "setButtonType:", self._buttonType));
    }
    if (isEditing && !self._selectedRange.length && CPMaxRange(self._selectedRange) >= (tokens == null ? null : tokens.isa.objj_msgSend0(tokens, "count")))
        placeEditor(true);
    if (isEditing && self._selectedRange.length)
    {
        self._inputFrame = nil;
        var inputElement = self.isa.objj_msgSend0(self, "_inputElement");
        inputElement.style.display = "none";
    }
    else if (isEditing)
    {
        var inputElement = self.isa.objj_msgSend0(self, "_inputElement");
        inputElement.style.display = "block";
        if (document.activeElement !== inputElement)
            inputElement.focus();
    }
    var scrollHeight = offset.y + tokenHeight;
    if (CGRectGetHeight((contentView == null ? null : contentView.isa.objj_msgSend0(contentView, "bounds"))) > scrollHeight)
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setFrameSize:", CGSizeMake(CGRectGetWidth(((___r1 = self._tokenScrollView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds"))), scrollHeight)));
    if (self._shouldScrollTo !== CPScrollDestinationNone)
    {
        if (!(isEditing && self._selectedRange.length == 0))
        {
            var scrollToToken = self._shouldScrollTo;
            if (scrollToToken === CPScrollDestinationLeft)
                scrollToToken = tokens[self._selectedRange.location];
            else if (scrollToToken === CPScrollDestinationRight)
                scrollToToken = tokens[MAX(0, CPMaxRange(self._selectedRange) - 1)];
            self.isa.objj_msgSend1(self, "_scrollTokenViewToVisible:", scrollToToken);
        }
        self._shouldScrollTo = CPScrollDestinationNone;
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_scrollTokenViewToVisible:"), function $CPTokenField___scrollTokenViewToVisible_(self, _cmd, aToken)
{
    if (!aToken)
        return;
    return ((___r1 = ((___r2 = self._tokenScrollView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "documentView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollPoint:", CGPointMake(0, (aToken == null ? null : aToken.isa.objj_msgSend0(aToken, "frameOrigin")).y)));
    var ___r1, ___r2;
}
,["BOOL","_CPTokenFieldToken"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultTokenizingCharacterSet"), function $CPTokenField__defaultTokenizingCharacterSet(self, _cmd)
{
    return CPCharacterSet.isa.objj_msgSend1(CPCharacterSet, "characterSetWithCharactersInString:", ",");
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
    if (!(self._implementedDelegateMethods & CPTokenFieldDelegate_tokenField_completionsForSubstring_indexOfToken_indexOfSelectedItem_))
        return [];
    return ((___r1 = self._tokenFieldDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "tokenField:completionsForSubstring:indexOfToken:indexOfSelectedItem:", self, substring, tokenIndex, selectedIndex));
    var ___r1;
}
,["CPArray","CPString","int","int"]), new objj_method(sel_getUid("_completionOrigin:"), function $CPTokenField___completionOrigin_(self, _cmd, anAutocompleteMenu)
{
    var relativeFrame = self._inputFrame ? ((___r1 = ((___r2 = self._tokenScrollView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "documentView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "convertRect:toView:", self._inputFrame, self)) : self.isa.objj_msgSend0(self, "bounds");
    return CGPointMake(CGRectGetMinX(relativeFrame), CGRectGetMaxY(relativeFrame));
    var ___r1, ___r2;
}
,["CGPoint","_CPAutocompleteMenu"]), new objj_method(sel_getUid("_displayStringForRepresentedObject:"), function $CPTokenField___displayStringForRepresentedObject_(self, _cmd, representedObject)
{
    if (self._implementedDelegateMethods & CPTokenFieldDelegate_tokenField_displayStringForRepresentedObject_)
    {
        var stringForRepresentedObject = ((___r1 = self._tokenFieldDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "tokenField:displayStringForRepresentedObject:", self, representedObject));
        if (stringForRepresentedObject !== nil)
            return stringForRepresentedObject;
    }
    return representedObject;
    var ___r1;
}
,["CPString","id"]), new objj_method(sel_getUid("_shouldAddObjects:atIndex:"), function $CPTokenField___shouldAddObjects_atIndex_(self, _cmd, tokens, index)
{
    if (self._implementedDelegateMethods & CPTokenFieldDelegate_tokenField_shouldAddObjects_atIndex_)
    {
        var approvedObjects = ((___r1 = self._tokenFieldDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "tokenField:shouldAddObjects:atIndex:", self, tokens, index));
        if (approvedObjects !== nil)
            return approvedObjects;
    }
    return tokens;
    var ___r1;
}
,["CPArray","CPArray","int"]), new objj_method(sel_getUid("_representedObjectForEditingString:"), function $CPTokenField___representedObjectForEditingString_(self, _cmd, aString)
{
    if (self._implementedDelegateMethods & CPTokenFieldDelegate_tokenField_representedObjectForEditingString_)
    {
        var token = ((___r1 = self._tokenFieldDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "tokenField:representedObjectForEditingString:", self, aString));
        if (token !== nil && token !== undefined)
            return token;
    }
    return aString;
    var ___r1;
}
,["id","CPString"]), new objj_method(sel_getUid("_hasMenuForRepresentedObject:"), function $CPTokenField___hasMenuForRepresentedObject_(self, _cmd, aRepresentedObject)
{
    if (self._implementedDelegateMethods & CPTokenFieldDelegate_tokenField_hasMenuForRepresentedObject_ && self._implementedDelegateMethods & CPTokenFieldDelegate_tokenField_menuForRepresentedObject_)
        return ((___r1 = self._tokenFieldDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "tokenField:hasMenuForRepresentedObject:", self, aRepresentedObject));
    return NO;
    var ___r1;
}
,["BOOL","id"]), new objj_method(sel_getUid("_menuForRepresentedObject:"), function $CPTokenField___menuForRepresentedObject_(self, _cmd, aRepresentedObject)
{
    if (self._implementedDelegateMethods & CPTokenFieldDelegate_tokenField_hasMenuForRepresentedObject_ && self._implementedDelegateMethods & CPTokenFieldDelegate_tokenField_menuForRepresentedObject_)
    {
        var hasMenu = ((___r1 = self._tokenFieldDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "tokenField:hasMenuForRepresentedObject:", self, aRepresentedObject));
        if (hasMenu)
            return ((___r1 = self._tokenFieldDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "tokenField:menuForRepresentedObject:", self, aRepresentedObject)) || nil;
    }
    return nil;
    var ___r1;
}
,["CPMenu","id"]), new objj_method(sel_getUid("_delayedShowCompletions"), function $CPTokenField___delayedShowCompletions(self, _cmd)
{
    ((___r1 = self.isa.objj_msgSend0(self, "_autocompleteMenu")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_delayedShowCompletions"));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_hideCompletions"), function $CPTokenField___hideCompletions(self, _cmd)
{
    ((___r1 = self._autocompleteMenu), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_hideCompletions"));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setButtonType:"), function $CPTokenField__setButtonType_(self, _cmd, aButtonType)
{
    if (self._buttonType === aButtonType)
        return;
    self._buttonType = aButtonType;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
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
        (self == null ? null : self.isa.objj_msgSend1(self, "setEditable:", NO));
        (self == null ? null : self.isa.objj_msgSend1(self, "setHighlighted:", NO));
        (self == null ? null : self.isa.objj_msgSend1(self, "setBezeled:", YES));
        (self == null ? null : self.isa.objj_msgSend1(self, "setButtonType:", CPTokenFieldDisclosureButtonType));
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
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","id"]), new objj_method(sel_getUid("setEditable:"), function $_CPTokenFieldToken__setEditable_(self, _cmd, shouldBeEditable)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTokenFieldToken").super_class }, "setEditable:", shouldBeEditable);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","BOOL"]), new objj_method(sel_getUid("setThemeState:"), function $_CPTokenFieldToken__setThemeState_(self, _cmd, aState)
{
    if (aState.isa && (aState == null ? null : aState.isa.objj_msgSend1(aState, "isKindOfClass:", CPArray)))
        aState = CPThemeState.apply(null, aState);
    var r = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTokenFieldToken").super_class }, "setThemeState:", aState);
    if (aState.hasThemeState(CPThemeStateHovered))
    {
        ((___r1 = self._disclosureButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setThemeState:", CPThemeStateHovered));
        ((___r1 = self._deleteButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setThemeState:", CPThemeStateHovered));
    }
    return r;
    var ___r1;
}
,["BOOL","ThemeState"]), new objj_method(sel_getUid("unsetThemeState:"), function $_CPTokenFieldToken__unsetThemeState_(self, _cmd, aState)
{
    if (aState.isa && (aState == null ? null : aState.isa.objj_msgSend1(aState, "isKindOfClass:", CPArray)))
        aState = CPThemeState.apply(null, aState);
    var r = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTokenFieldToken").super_class }, "unsetThemeState:", aState);
    if (aState.hasThemeState(CPThemeStateHovered))
    {
        ((___r1 = self._disclosureButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "unsetThemeState:", CPThemeStateHovered));
        ((___r1 = self._deleteButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "unsetThemeState:", CPThemeStateHovered));
    }
    return r;
    var ___r1;
}
,["BOOL","ThemeState"]), new objj_method(sel_getUid("_minimumFrameSize"), function $_CPTokenFieldToken___minimumFrameSize(self, _cmd)
{
    var size = CGSizeMakeZero(),
        minSize = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "min-size"),
        contentInset = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "content-inset");
    size.height = minSize.height;
    size.width = MAX(minSize.width, ((___r1 = self.isa.objj_msgSend0(self, "stringValue") || " "), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "sizeWithFont:", self.isa.objj_msgSend0(self, "font"))).width + contentInset.left + contentInset.right);
    return size;
    var ___r1;
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
            ((___r1 = self._deleteButton), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
            self._deleteButton = nil;
        }
        if (!self._disclosureButton)
        {
            self._disclosureButton = ((___r1 = (_CPTokenFieldTokenDisclosureButton == null ? null : _CPTokenFieldTokenDisclosureButton.isa.objj_msgSend0(_CPTokenFieldTokenDisclosureButton, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
            self.isa.objj_msgSend1(self, "addSubview:", self._disclosureButton);
        }
    }
    else
    {
        if (self._disclosureButton)
        {
            ((___r1 = self._disclosureButton), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
            self._disclosureButton = nil;
        }
        if (!self._deleteButton)
        {
            self._deleteButton = ((___r1 = (_CPTokenFieldTokenCloseButton == null ? null : _CPTokenFieldTokenCloseButton.isa.objj_msgSend0(_CPTokenFieldTokenCloseButton, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
            self.isa.objj_msgSend1(self, "addSubview:", self._deleteButton);
            ((___r1 = self._deleteButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
            ((___r1 = self._deleteButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("_delete:")));
        }
    }
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    var ___r1;
}
,["void","int"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPTokenFieldToken__layoutSubviews(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTokenFieldToken").super_class }, "layoutSubviews");
    var bezelView = self.isa.objj_msgSend3(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "bezel-view", CPWindowBelow, "content-view");
    if (bezelView && self._tokenField)
    {
        switch(self._buttonType) {
        case CPTokenFieldDisclosureButtonType:
            var shouldBeEnabled = self.isa.objj_msgSend0(self, "hasMenu");
            ((___r1 = self._disclosureButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", !shouldBeEnabled));
            if (shouldBeEnabled)
                ((___r1 = self._disclosureButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMenu:", self.isa.objj_msgSend0(self, "menu")));
            var frame = (bezelView == null ? null : bezelView.isa.objj_msgSend0(bezelView, "frame")),
                buttonOffset = ((___r1 = self._disclosureButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "offset")),
                buttonSize = ((___r1 = self._disclosureButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "min-size"));
            ((___r1 = self._disclosureButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(CGRectGetMaxX(frame) - buttonOffset.x, CGRectGetMinY(frame) + buttonOffset.y, buttonSize.width, buttonSize.height)));
            break;
        case CPTokenFieldDeleteButtonType:
            ((___r1 = self._deleteButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEnabled:", self.isa.objj_msgSend0(self, "isEditable") && self.isa.objj_msgSend0(self, "isEnabled")));
            var frame = (bezelView == null ? null : bezelView.isa.objj_msgSend0(bezelView, "frame")),
                buttonOffset = ((___r1 = self._deleteButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "offset")),
                buttonSize = ((___r1 = self._deleteButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "min-size"));
            ((___r1 = self._deleteButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(CGRectGetMaxX(frame) - buttonOffset.x, CGRectGetMinY(frame) + buttonOffset.y, buttonSize.width, buttonSize.height)));
            break;
        }
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("mouseDown:"), function $_CPTokenFieldToken__mouseDown_(self, _cmd, anEvent)
{
    ((___r1 = self._tokenField), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "_mouseDownOnToken:withEvent:", self, anEvent));
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseUp:"), function $_CPTokenFieldToken__mouseUp_(self, _cmd, anEvent)
{
    ((___r1 = self._tokenField), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "_mouseUpOnToken:withEvent:", self, anEvent));
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("_delete:"), function $_CPTokenFieldToken___delete_(self, _cmd, sender)
{
    if (self.isa.objj_msgSend0(self, "isEditable"))
        ((___r1 = self._tokenField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_deleteToken:", self));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("hasMenu"), function $_CPTokenFieldToken__hasMenu(self, _cmd)
{
    return ((___r1 = self._tokenField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_hasMenuForRepresentedObject:", self._representedObject));
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("menu"), function $_CPTokenFieldToken__menu(self, _cmd)
{
    return ((___r1 = self._tokenField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_menuForRepresentedObject:", self._representedObject));
    var ___r1;
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
    var attributes = CPButton.isa.objj_msgSend0(CPButton, "themeAttributes");
    (attributes == null ? null : attributes.isa.objj_msgSend2(attributes, "setObject:forKey:", CGPointMake(15, 5), "offset"));
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
    if (self = (self == null ? null : self.isa.objj_msgSend2(self, "initWithFrame:pullsDown:", aFrame, YES)))
    {
        (self == null ? null : self.isa.objj_msgSend1(self, "setBordered:", YES));
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
    var attributes = CPButton.isa.objj_msgSend0(CPButton, "themeAttributes");
    (attributes == null ? null : attributes.isa.objj_msgSend2(attributes, "setObject:forKey:", CGPointMake(15, 5), "offset"));
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
        self._tokenizingCharacterSet = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTokenFieldTokenizingCharacterSetKey)) || ((___r1 = (self == null ? null : self.isa.objj_msgSend0(self, "class"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "defaultTokenizingCharacterSet"));
        self._completionDelay = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeDoubleForKey:", CPTokenFieldCompletionDelayKey)) || ((___r1 = (self == null ? null : self.isa.objj_msgSend0(self, "class"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "defaultCompletionDelay"));
        self._buttonType = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPTokenFieldButtonTypeKey)) || CPTokenFieldDisclosureButtonType;
        (self == null ? null : self.isa.objj_msgSend0(self, "_init"));
        (self == null ? null : self.isa.objj_msgSend0(self, "setNeedsLayout"));
        (self == null ? null : self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES));
    }
    return self;
    var ___r1;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPTokenField__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._tokenizingCharacterSet, CPTokenFieldTokenizingCharacterSetKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeDouble:forKey:", self._completionDelay, CPTokenFieldCompletionDelayKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._buttonType, CPTokenFieldButtonTypeKey));
}
,["void","CPCoder"])]);
}