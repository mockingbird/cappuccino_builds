@STATIC;1.0;I;27;Foundation/CPCharacterSet.jI;23;Foundation/CPIndexSet.jI;20;Foundation/CPTimer.ji;10;CPButton.ji;14;CPScrollView.ji;13;CPTextField.ji;13;CPTableView.ji;10;CPWindow.ji;21;_CPAutocompleteMenu.jt;43616;


objj_executeFile("Foundation/CPCharacterSet.j", NO);
objj_executeFile("Foundation/CPIndexSet.j", NO);
objj_executeFile("Foundation/CPTimer.j", NO);

objj_executeFile("CPButton.j", YES);
objj_executeFile("CPScrollView.j", YES);
objj_executeFile("CPTextField.j", YES);
objj_executeFile("CPTableView.j", YES);
objj_executeFile("CPWindow.j", YES);
objj_executeFile("_CPAutocompleteMenu.j", YES);
var CPScrollDestinationNone = 0,
    CPScrollDestinationLeft = 1,
    CPScrollDestinationRight = 2;

{var the_class = objj_allocateClassPair(CPTextField, "CPTokenField"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_tokenScrollView"), new objj_ivar("_shouldScrollTo"), new objj_ivar("_selectedRange"), new objj_ivar("_autocompleteMenu"), new objj_ivar("_inputFrame"), new objj_ivar("_completionDelay"), new objj_ivar("_tokenizingCharacterSet"), new objj_ivar("_mouseDownEvent"), new objj_ivar("_preventResign"), new objj_ivar("_shouldNotifyTarget")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("tokenizingCharacterSet"), function $CPTokenField__tokenizingCharacterSet(self, _cmd)
{ with(self)
{
return _tokenizingCharacterSet;
}
},["id"]),
new objj_method(sel_getUid("setTokenizingCharacterSet:"), function $CPTokenField__setTokenizingCharacterSet_(self, _cmd, newValue)
{ with(self)
{
_tokenizingCharacterSet = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFrame:"), function $CPTokenField__initWithFrame_(self, _cmd, frame)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "initWithFrame:", frame))
    {
        _completionDelay = objj_msgSend(objj_msgSend(self, "class"), "defaultCompletionDelay");
        _tokenizingCharacterSet = objj_msgSend(objj_msgSend(self, "class"), "defaultTokenizingCharacterSet");
        objj_msgSend(self, "setBezeled:", YES);

        objj_msgSend(self, "_init");

        objj_msgSend(self, "setObjectValue:", []);

        objj_msgSend(self, "setNeedsLayout");
    }

    return self;
}
},["id","CPRect"]), new objj_method(sel_getUid("_init"), function $CPTokenField___init(self, _cmd)
{ with(self)
{
    _selectedRange = { location:(0), length:0 };

    var frame = objj_msgSend(self, "frame");

    _tokenScrollView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(_tokenScrollView, "setHasHorizontalScroller:", NO);
    objj_msgSend(_tokenScrollView, "setHasVerticalScroller:", NO);
    objj_msgSend(_tokenScrollView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);

    var contentView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(contentView, "setAutoresizingMask:", CPViewWidthSizable);
    objj_msgSend(_tokenScrollView, "setDocumentView:", contentView);

    objj_msgSend(self, "addSubview:", _tokenScrollView);
}
},["void"]), new objj_method(sel_getUid("_autocompleteMenu"), function $CPTokenField___autocompleteMenu(self, _cmd)
{ with(self)
{
    if (!_autocompleteMenu)
        _autocompleteMenu = objj_msgSend(objj_msgSend(_CPAutocompleteMenu, "alloc"), "initWithTextField:", self);
    return _autocompleteMenu;
}
},["_CPAutocompleteMenu"]), new objj_method(sel_getUid("_autocompleteWithEvent:"), function $CPTokenField___autocompleteWithEvent_(self, _cmd, anEvent)
{ with(self)
{
    if (!objj_msgSend(self, "_inputElement").value && (!objj_msgSend(_autocompleteMenu, "contentArray") || !objj_msgSend(self, "hasThemeState:", CPThemeStateAutocompleting)))
        return;

    objj_msgSend(self, "_hideCompletions");

    var token = objj_msgSend(_autocompleteMenu, "selectedItem"),
        shouldRemoveLastObject = token !== "" && objj_msgSend(self, "_inputElement").value !== "";

    if (!token)
        token = objj_msgSend(self, "_inputElement").value;




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
        objj_msgSend(objectValue, "removeObjectAtIndex:", _selectedRange.location);


    token = objj_msgSend(self, "_representedObjectForEditingString:", token);


    var delegateApprovedObjects = objj_msgSend(self, "_shouldAddObjects:atIndex:", objj_msgSend(CPArray, "arrayWithObject:", token), _selectedRange.location),
        delegateApprovedObjectsCount = objj_msgSend(delegateApprovedObjects, "count");

    if (delegateApprovedObjects)
    {
        for (var i = 0; i < delegateApprovedObjectsCount; i++)
        {
            objj_msgSend(objectValue, "insertObject:atIndex:", objj_msgSend(delegateApprovedObjects, "objectAtIndex:", i), _selectedRange.location + i);
        }
    }


    var location = _selectedRange.location;

    objj_msgSend(self, "setObjectValue:", objectValue);

    if (delegateApprovedObjectsCount)
        location += delegateApprovedObjectsCount;
    _selectedRange = { location:(location), length:0 };

    objj_msgSend(self, "_inputElement").value = "";
    objj_msgSend(self, "setNeedsLayout");

    objj_msgSend(self, "_controlTextDidChange");
}
},["void","CPEvent"]), new objj_method(sel_getUid("_autocomplete"), function $CPTokenField___autocomplete(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "_autocompleteWithEvent:", nil);
}
},["void"]), new objj_method(sel_getUid("_selectToken:byExtendingSelection:"), function $CPTokenField___selectToken_byExtendingSelection_(self, _cmd, token, extend)
{ with(self)
{
    var indexOfToken = objj_msgSend(objj_msgSend(self, "_tokens"), "indexOfObject:", token);

    if (indexOfToken == CPNotFound)
    {
        if (!extend)
            _selectedRange = { location:(objj_msgSend(objj_msgSend(self, "_tokens"), "count")), length:0 };
    }
    else if (extend)
        _selectedRange = CPUnionRange(_selectedRange, { location:(indexOfToken), length:1 });
    else
        _selectedRange = { location:(indexOfToken), length:1 };

    objj_msgSend(self, "setNeedsLayout");
}
},["void","_CPTokenFieldToken","BOOL"]), new objj_method(sel_getUid("_deselectToken:"), function $CPTokenField___deselectToken_(self, _cmd, token)
{ with(self)
{
    var indexOfToken = objj_msgSend(objj_msgSend(self, "_tokens"), "indexOfObject:", token);

    if (CPLocationInRange(indexOfToken, _selectedRange))
        _selectedRange = { location:(MAX(indexOfToken, _selectedRange.location)), length:MIN(_selectedRange.length, indexOfToken - _selectedRange.location) };

    objj_msgSend(self, "setNeedsLayout");
}
},["void","_CPTokenFieldToken"]), new objj_method(sel_getUid("_deleteToken:"), function $CPTokenField___deleteToken_(self, _cmd, token)
{ with(self)
{
    var indexOfToken = objj_msgSend(objj_msgSend(self, "_tokens"), "indexOfObject:", token),
        objectValue = objj_msgSend(self, "objectValue");



    if (indexOfToken < _selectedRange.location)
        _selectedRange.location--;
    else
        objj_msgSend(self, "_deselectToken:", token);


    var selection = CPMakeRangeCopy(_selectedRange);

    objj_msgSend(objectValue, "removeObjectAtIndex:", indexOfToken);
    objj_msgSend(self, "setObjectValue:", objectValue);
    _selectedRange = selection;

    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "_controlTextDidChange");
}
},["void","_CPTokenFieldToken"]), new objj_method(sel_getUid("_controlTextDidChange"), function $CPTokenField___controlTextDidChange(self, _cmd)
{ with(self)
{
    var binderClass = objj_msgSend(objj_msgSend(self, "class"), "_binderClassForBinding:", CPValueBinding),
        theBinding = objj_msgSend(binderClass, "getBinding:forObject:", CPValueBinding, self);

    if (theBinding)
        objj_msgSend(theBinding, "reverseSetValueFor:", "objectValue");

    objj_msgSend(self, "textDidChange:", objj_msgSend(CPNotification, "notificationWithName:object:userInfo:", CPControlTextDidChangeNotification, self, nil));

    _shouldNotifyTarget = YES;
}
},["void"]), new objj_method(sel_getUid("_removeSelectedTokens:"), function $CPTokenField___removeSelectedTokens_(self, _cmd, sender)
{ with(self)
{
    var tokens = objj_msgSend(self, "objectValue");

    for (var i = _selectedRange.length - 1; i >= 0; i--)
        objj_msgSend(tokens, "removeObjectAtIndex:", _selectedRange.location + i);

    var collapsedSelection = _selectedRange.location;

    objj_msgSend(self, "setObjectValue:", tokens);


    _selectedRange = { location:(collapsedSelection), length:0 };

    objj_msgSend(self, "_controlTextDidChange");
}
},["void","id"]), new objj_method(sel_getUid("_updatePlaceholderState"), function $CPTokenField___updatePlaceholderState(self, _cmd)
{ with(self)
{
    if ((objj_msgSend(objj_msgSend(self, "_tokens"), "count") === 0) && !objj_msgSend(self, "hasThemeState:", CPThemeStateEditing))
        objj_msgSend(self, "setThemeState:", CPTextFieldStatePlaceholder);
    else
        objj_msgSend(self, "unsetThemeState:", CPTextFieldStatePlaceholder);
}
},["void"]), new objj_method(sel_getUid("becomeFirstResponder"), function $CPTokenField__becomeFirstResponder(self, _cmd)
{ with(self)
{
    if (CPTokenFieldInputOwner && objj_msgSend(CPTokenFieldInputOwner, "window") !== objj_msgSend(self, "window"))
        objj_msgSend(objj_msgSend(CPTokenFieldInputOwner, "window"), "makeFirstResponder:", nil);

    objj_msgSend(self, "setThemeState:", CPThemeStateEditing);

    objj_msgSend(self, "_updatePlaceholderState");

    objj_msgSend(self, "setNeedsLayout");
    return YES;
}
},["BOOL"]), new objj_method(sel_getUid("resignFirstResponder"), function $CPTokenField__resignFirstResponder(self, _cmd)
{ with(self)
{
    if (_preventResign)
        return NO;

    objj_msgSend(self, "unsetThemeState:", CPThemeStateEditing);

    objj_msgSend(self, "_autocomplete");
    objj_msgSend(self, "_updatePlaceholderState");

    objj_msgSend(self, "setNeedsLayout");

    if (_shouldNotifyTarget)
    {
        _shouldNotifyTarget = NO;
        objj_msgSend(self, "textDidEndEditing:", objj_msgSend(CPNotification, "notificationWithName:object:userInfo:", CPControlTextDidEndEditingNotification, self, nil));

        if (objj_msgSend(self, "sendsActionOnEndEditing"))
            objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
    }

    return YES;
}
},["BOOL"]), new objj_method(sel_getUid("mouseDown:"), function $CPTokenField__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    _preventResign = YES;
    _mouseDownEvent = anEvent;

    objj_msgSend(self, "_selectToken:byExtendingSelection:", nil, NO);

    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "mouseDown:", anEvent);
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseUp:"), function $CPTokenField__mouseUp_(self, _cmd, anEvent)
{ with(self)
{
    _preventResign = NO;
    _mouseDownEvent = nil;
}
},["void","CPEvent"]), new objj_method(sel_getUid("_mouseDownOnToken:withEvent:"), function $CPTokenField___mouseDownOnToken_withEvent_(self, _cmd, aToken, anEvent)
{ with(self)
{
    _preventResign = YES;
    _mouseDownEvent = anEvent;
}
},["void","_CPTokenFieldToken","CPEvent"]), new objj_method(sel_getUid("_mouseUpOnToken:withEvent:"), function $CPTokenField___mouseUpOnToken_withEvent_(self, _cmd, aToken, anEvent)
{ with(self)
{
    if (_mouseDownEvent && (objj_msgSend(_mouseDownEvent, "locationInWindow").x == objj_msgSend(anEvent, "locationInWindow").x && objj_msgSend(_mouseDownEvent, "locationInWindow").y == objj_msgSend(anEvent, "locationInWindow").y))
    {
        objj_msgSend(self, "_selectToken:byExtendingSelection:", aToken, objj_msgSend(anEvent, "modifierFlags") & CPShiftKeyMask);
        objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", self);

        _shouldScrollTo = aToken;
    }

    _preventResign = NO;
}
},["void","_CPTokenFieldToken","CPEvent"]), new objj_method(sel_getUid("_tokens"), function $CPTokenField___tokens(self, _cmd)
{ with(self)
{


    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "objectValue");
}
},["CPArray"]), new objj_method(sel_getUid("stringValue"), function $CPTokenField__stringValue(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "objectValue"), "componentsJoinedByString:", ",");
}
},["CPString"]), new objj_method(sel_getUid("objectValue"), function $CPTokenField__objectValue(self, _cmd)
{ with(self)
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
},["id"]), new objj_method(sel_getUid("setObjectValue:"), function $CPTokenField__setObjectValue_(self, _cmd, aValue)
{ with(self)
{
    if (aValue !== nil && !objj_msgSend(aValue, "isKindOfClass:", objj_msgSend(CPArray, "class")))
    {
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "setObjectValue:", nil);
        return;
    }

    var superValue = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "objectValue");
    if (aValue === superValue || objj_msgSend(aValue, "isEqualToArray:", superValue))
        return;

    var contentView = objj_msgSend(_tokenScrollView, "documentView"),
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
                newToken = objj_msgSend(objj_msgSend(_CPTokenFieldToken, "alloc"), "init");
                objj_msgSend(newToken, "setTokenField:", self);
                objj_msgSend(newToken, "setRepresentedObject:", tokenObject);
                objj_msgSend(newToken, "setStringValue:", tokenValue);
                objj_msgSend(contentView, "addSubview:", newToken);
            }

            newTokens.push(newToken);
        }
    }


    for (var j = 0, oldCount = objj_msgSend(oldTokens, "count"); j < oldCount; j++)
        objj_msgSend(oldTokens[j], "removeFromSuperview");
    _value = newTokens;


    objj_msgSend(self, "_selectToken:byExtendingSelection:", nil, NO);

    objj_msgSend(self, "_updatePlaceholderState");

    _shouldScrollTo = CPScrollDestinationRight;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","id"]), new objj_method(sel_getUid("setEnabled:"), function $CPTokenField__setEnabled_(self, _cmd, shouldBeEnabled)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "setEnabled:", shouldBeEnabled);


    for (var i = 0, count = objj_msgSend(objj_msgSend(self, "_tokens"), "count"); i < count; i++)
    {
        var token = objj_msgSend(objj_msgSend(self, "_tokens"), "objectAtIndex:", i);

        if (objj_msgSend(token, "respondsToSelector:", sel_getUid("setEnabled:")))
            objj_msgSend(token, "setEnabled:", shouldBeEnabled);
    }
}
},["void","BOOL"]), new objj_method(sel_getUid("sendAction:to:"), function $CPTokenField__sendAction_to_(self, _cmd, anAction, anObject)
{ with(self)
{
    _shouldNotifyTarget = NO;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "sendAction:to:", anAction, anObject);
}
},["void","SEL","id"]), new objj_method(sel_getUid("_setStringValue:"), function $CPTokenField___setStringValue_(self, _cmd, aValue)
{ with(self)
{
}
},["void","id"]), new objj_method(sel_getUid("moveUp:"), function $CPTokenField__moveUp_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "_autocompleteMenu"), "selectPrevious");
    objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", NO);
}
},["void","id"]), new objj_method(sel_getUid("moveDown:"), function $CPTokenField__moveDown_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "_autocompleteMenu"), "selectNext");
    objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", NO);
}
},["void","id"]), new objj_method(sel_getUid("insertNewline:"), function $CPTokenField__insertNewline_(self, _cmd, sender)
{ with(self)
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
},["void","id"]), new objj_method(sel_getUid("insertTab:"), function $CPTokenField__insertTab_(self, _cmd, sender)
{ with(self)
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
},["void","id"]), new objj_method(sel_getUid("insertText:"), function $CPTokenField__insertText_(self, _cmd, characters)
{ with(self)
{



    if (objj_msgSend(_tokenizingCharacterSet, "characterIsMember:", objj_msgSend(characters, "substringToIndex:", 1)))
    {
        objj_msgSend(self, "_autocompleteWithEvent:", objj_msgSend(CPApp, "currentEvent"));
    }
    else
    {

        if (_selectedRange.length)
        {
            objj_msgSend(self, "_removeSelectedTokens:", self);

            objj_msgSend(self, "layoutSubviews");
        }







        objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
    }
}
},["void","CPString"]), new objj_method(sel_getUid("cancelOperation:"), function $CPTokenField__cancelOperation_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(self, "_hideCompletions");
}
},["void","id"]), new objj_method(sel_getUid("moveLeft:"), function $CPTokenField__moveLeft_(self, _cmd, sender)
{ with(self)
{

    if ((_selectedRange.location > 0 || _selectedRange.length) && CPTokenFieldDOMInputElement.value == "")
    {
        if (_selectedRange.length)

            _selectedRange.length = 0;
        else
            _selectedRange.location--;
        objj_msgSend(self, "setNeedsLayout");
        _shouldScrollTo = CPScrollDestinationLeft;
    }
    else
    {

        objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
    }
}
},["void","id"]), new objj_method(sel_getUid("moveLeftAndModifySelection:"), function $CPTokenField__moveLeftAndModifySelection_(self, _cmd, sender)
{ with(self)
{
    if (_selectedRange.location > 0 && CPTokenFieldDOMInputElement.value == "")
    {
        _selectedRange.location--;

        _selectedRange.length++;
        objj_msgSend(self, "setNeedsLayout");
        _shouldScrollTo = CPScrollDestinationLeft;
    }
    else
    {

        objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
    }
}
},["void","id"]), new objj_method(sel_getUid("moveRight:"), function $CPTokenField__moveRight_(self, _cmd, sender)
{ with(self)
{

    if ((_selectedRange.location < objj_msgSend(objj_msgSend(self, "_tokens"), "count") || _selectedRange.length) && CPTokenFieldDOMInputElement.value == "")
    {
        if (_selectedRange.length)
        {

            _selectedRange.location = ((_selectedRange).location + (_selectedRange).length);
            _selectedRange.length = 0;
        }
        else
        {

            _selectedRange.location = MIN(objj_msgSend(objj_msgSend(self, "_tokens"), "count"), _selectedRange.location + _selectedRange.length + 1);
        }

        objj_msgSend(self, "setNeedsLayout");
        _shouldScrollTo = CPScrollDestinationRight;
    }
    else
    {

        objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
    }
}
},["void","id"]), new objj_method(sel_getUid("moveRightAndModifySelection:"), function $CPTokenField__moveRightAndModifySelection_(self, _cmd, sender)
{ with(self)
{
    if (((_selectedRange).location + (_selectedRange).length) < objj_msgSend(objj_msgSend(self, "_tokens"), "count") && CPTokenFieldDOMInputElement.value == "")
    {

        _selectedRange.length++;
        objj_msgSend(self, "setNeedsLayout");
        _shouldScrollTo = CPScrollDestinationRight;
    }
    else
    {

        objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
    }
}
},["void","id"]), new objj_method(sel_getUid("deleteBackward:"), function $CPTokenField__deleteBackward_(self, _cmd, sender)
{ with(self)
{


    if (CPTokenFieldDOMInputElement.value == "")
    {
        objj_msgSend(self, "_hideCompletions");

        if (CPEmptyRange(_selectedRange))
        {
            if (_selectedRange.location > 0)
            {
                var tokenView = objj_msgSend(objj_msgSend(self, "_tokens"), "objectAtIndex:", (_selectedRange.location - 1));
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
},["void","id"]), new objj_method(sel_getUid("deleteForward:"), function $CPTokenField__deleteForward_(self, _cmd, sender)
{ with(self)
{


    if (CPTokenFieldDOMInputElement.value == "")
    {

        objj_msgSend(self, "_hideCompletions");

        if (CPEmptyRange(_selectedRange))
        {
            if (_selectedRange.location < objj_msgSend(objj_msgSend(self, "_tokens"), "count"))
                objj_msgSend(self, "_deleteToken:", objj_msgSend(objj_msgSend(self, "_tokens"), "objectAtIndex:", [_selectedRange.location]));
        }
        else
            objj_msgSend(self, "_removeSelectedTokens:", nil);
    }
    else
    {

        objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
    }
}
},["void","id"]), new objj_method(sel_getUid("_selectText:immediately:"), function $CPTokenField___selectText_immediately_(self, _cmd, sender, immediately)
{ with(self)
{







    if ((objj_msgSend(self, "isEditable") || objj_msgSend(self, "isSelectable")))
    {
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "_selectText:immediately:", sender, immediately);


        objj_msgSend(self, "_autocomplete");
        _selectedRange = { location:(0), length:objj_msgSend(objj_msgSend(self, "_tokens"), "count") };

        objj_msgSend(self, "setNeedsLayout");
    }
}
},["void","id","BOOL"]), new objj_method(sel_getUid("keyDown:"), function $CPTokenField__keyDown_(self, _cmd, anEvent)
{ with(self)
{
    CPTokenFieldTextDidChangeValue = objj_msgSend(self, "stringValue");






    objj_msgSend(self, "interpretKeyEvents:", [anEvent]);

    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
}
},["void","CPEvent"]), new objj_method(sel_getUid("keyUp:"), function $CPTokenField__keyUp_(self, _cmd, anEvent)
{ with(self)
{
    if (objj_msgSend(self, "stringValue") !== CPTokenFieldTextDidChangeValue)
    {
        objj_msgSend(self, "textDidChange:", objj_msgSend(CPNotification, "notificationWithName:object:userInfo:", CPControlTextDidChangeNotification, self, nil));
    }

    objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
}
},["void","CPEvent"]), new objj_method(sel_getUid("textDidChange:"), function $CPTokenField__textDidChange_(self, _cmd, aNotification)
{ with(self)
{
    if (objj_msgSend(aNotification, "object") !== self)
        return;

    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "textDidChange:", aNotification);


    objj_msgSend(self, "_delayedShowCompletions");

    _selectedRange.length = 0;


    objj_msgSend(self, "setNeedsLayout");
}
},["void","CPNotification"]), new objj_method(sel_getUid("setCompletionDelay:"), function $CPTokenField__setCompletionDelay_(self, _cmd, delay)
{ with(self)
{
    _completionDelay = delay;
}
},["void","CPTimeInterval"]), new objj_method(sel_getUid("completionDelay"), function $CPTokenField__completionDelay(self, _cmd)
{ with(self)
{
    return _completionDelay;
}
},["CPTimeInterval"]), new objj_method(sel_getUid("layoutSubviews"), function $CPTokenField__layoutSubviews(self, _cmd)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "layoutSubviews");

    objj_msgSend(_tokenScrollView, "setFrame:", objj_msgSend(self, "rectForEphemeralSubviewNamed:", "content-view"));

    var textFieldContentView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "content-view", CPWindowAbove, "bezel-view");

    if (textFieldContentView)
        objj_msgSend(textFieldContentView, "setHidden:", objj_msgSend(self, "stringValue") !== "");

    var frame = objj_msgSend(self, "frame"),
        contentView = objj_msgSend(_tokenScrollView, "documentView"),
        tokens = objj_msgSend(self, "_tokens"),
        shouldShowAutoComplete = objj_msgSend(self, "hasThemeState:", CPThemeStateAutocompleting);


    if (!objj_msgSend(tokens, "isKindOfClass:", objj_msgSend(CPArray, "class")))
        return;


    var contentRect = { origin: { x:objj_msgSend(contentView, "bounds").origin.x, y:objj_msgSend(contentView, "bounds").origin.y }, size: { width:objj_msgSend(contentView, "bounds").size.width, height:objj_msgSend(contentView, "bounds").size.height } },
        contentOrigin = contentRect.origin,
        contentSize = contentRect.size,
        offset = CPPointMake(contentOrigin.x, contentOrigin.y),
        spaceBetweenTokens = CPSizeMake(2.0, 2.0),
        isEditing = objj_msgSend(objj_msgSend(self, "window"), "firstResponder") == self,
        tokenToken = objj_msgSend(_CPTokenFieldToken, "new"),
        font = objj_msgSend(self, "currentValueForThemeAttribute:", "font"),
        lineHeight = objj_msgSend(font, "defaultLineHeightForFont"),
        editorInset = objj_msgSend(self, "currentValueForThemeAttribute:", "editor-inset");


    objj_msgSend(tokenToken, "sizeToFit");

    var tokenHeight = (objj_msgSend(tokenToken, "bounds").size.height);

    var fitAndFrame = function(width, height)
    {
        var r = { origin: { x:0, y:0 }, size: { width:width, height:height } };

        if (offset.x + width >= contentSize.width && offset.x > contentOrigin.x)
        {
            offset.x = contentOrigin.x;
            offset.y += height + spaceBetweenTokens.height;
        }

        r.origin.x = offset.x;
        r.origin.y = offset.y;


        var scrollHeight = offset.y + tokenHeight + CEIL(spaceBetweenTokens.height / 2.0);
        if ((objj_msgSend(contentView, "bounds").size.height) < scrollHeight)
            objj_msgSend(contentView, "setFrameSize:", { width:(objj_msgSend(_tokenScrollView, "bounds").size.width), height:scrollHeight });

        offset.x += width + spaceBetweenTokens.width;

        return r;
    };

    var placeEditor = function(useRemainingWidth)
    {
        var element = objj_msgSend(self, "_inputElement"),
            textWidth = 1;

        if (_selectedRange.length === 0)
        {



            textWidth = objj_msgSend((element.value || "") + "X", "sizeWithFont:", font).width;

            if (useRemainingWidth)
                textWidth = MAX(contentSize.width - offset.x - 1, textWidth);
        }

        _inputFrame = fitAndFrame(textWidth, tokenHeight);

        _inputFrame.size.height = lineHeight;

        element.style.left = (_inputFrame.origin.x + editorInset.left) + "px";
        element.style.top = (_inputFrame.origin.y + editorInset.top) + "px";
        element.style.width = _inputFrame.size.width + "px";
        element.style.height = _inputFrame.size.height + "px";


        if (_selectedRange.length == 0)
            objj_msgSend(objj_msgSend(_tokenScrollView, "documentView"), "scrollPoint:", { x:0, y:_inputFrame.origin.y });
    };

    for (var i = 0, count = objj_msgSend(tokens, "count"); i < count; i++)
    {
        if (isEditing && !_selectedRange.length && i == ((_selectedRange).location + (_selectedRange).length))
            placeEditor(false);

        var tokenView = objj_msgSend(tokens, "objectAtIndex:", i);


        if (objj_msgSend(tokenView, "isKindOfClass:", objj_msgSend(CPString, "class")))
            continue;

        objj_msgSend(tokenView, "setHighlighted:", CPLocationInRange(i, _selectedRange));
        objj_msgSend(tokenView, "sizeToFit");

        var size = objj_msgSend(contentView, "bounds").size,
            tokenViewSize = objj_msgSend(tokenView, "bounds").size,
            tokenFrame = fitAndFrame(tokenViewSize.width, tokenViewSize.height);

        objj_msgSend(tokenView, "setFrame:", tokenFrame);
    }

    if (isEditing && !_selectedRange.length && ((_selectedRange).location + (_selectedRange).length) >= objj_msgSend(tokens, "count"))
        placeEditor(true);



    if (isEditing && _selectedRange.length)
    {
        _inputFrame = nil;
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


    var scrollHeight = offset.y + tokenHeight + CEIL(spaceBetweenTokens.height / 2.0);
    if ((objj_msgSend(contentView, "bounds").size.height) > scrollHeight)
        objj_msgSend(contentView, "setFrameSize:", { width:(objj_msgSend(_tokenScrollView, "bounds").size.width), height:scrollHeight });

    if (_shouldScrollTo !== CPScrollDestinationNone)
    {

        if (!(isEditing && _selectedRange.length == 0))
        {
            var scrollToToken = _shouldScrollTo;

            if (scrollToToken === CPScrollDestinationLeft)
                scrollToToken = tokens[_selectedRange.location]
            else if (scrollToToken === CPScrollDestinationRight)
                scrollToToken = tokens[MAX(0, ((_selectedRange).location + (_selectedRange).length) - 1)];
            objj_msgSend(self, "_scrollTokenViewToVisible:", scrollToToken);
        }

        _shouldScrollTo = CPScrollDestinationNone;
    }
}
},["void"]), new objj_method(sel_getUid("_scrollTokenViewToVisible:"), function $CPTokenField___scrollTokenViewToVisible_(self, _cmd, aToken)
{ with(self)
{
    if (!aToken)
        return;

    return objj_msgSend(objj_msgSend(_tokenScrollView, "documentView"), "scrollPoint:", { x:0, y:objj_msgSend(aToken, "frameOrigin").y });
}
},["BOOL","_CPTokenFieldToken"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultTokenizingCharacterSet"), function $CPTokenField__defaultTokenizingCharacterSet(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPCharacterSet, "characterSetWithCharactersInString:", ",");
}
},["CPCharacterSet"]), new objj_method(sel_getUid("defaultCompletionDelay"), function $CPTokenField__defaultCompletionDelay(self, _cmd)
{ with(self)
{
    return 0.5;
}
},["CPTimeInterval"]), new objj_method(sel_getUid("defaultThemeClass"), function $CPTokenField__defaultThemeClass(self, _cmd)
{ with(self)
{
    return "tokenfield";
}
},["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPTokenField__themeAttributes(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", { top:(0), right:(0), bottom:(0), left:(0) }, "editor-inset");
}
},["id"])]);
}

{
var the_class = objj_getClass("CPTokenField")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTokenField\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_completionsForSubstring:indexOfToken:indexOfSelectedItem:"), function $CPTokenField___completionsForSubstring_indexOfToken_indexOfSelectedItem_(self, _cmd, substring, tokenIndex, selectedIndex)
{ with(self)
{
    if (objj_msgSend(objj_msgSend(self, "delegate"), "respondsToSelector:", sel_getUid("tokenField:completionsForSubstring:indexOfToken:indexOfSelectedItem:")))
    {
        return objj_msgSend(objj_msgSend(self, "delegate"), "tokenField:completionsForSubstring:indexOfToken:indexOfSelectedItem:", self, substring, tokenIndex, selectedIndex);
    }

    return [];
}
},["CPArray","CPString","int","int"]), new objj_method(sel_getUid("_completionOrigin:"), function $CPTokenField___completionOrigin_(self, _cmd, anAutocompleteMenu)
{ with(self)
{
    var relativeFrame = _inputFrame ? objj_msgSend(objj_msgSend(_tokenScrollView, "documentView"), "convertRect:toView:", _inputFrame, self ) : objj_msgSend(self, "bounds");
    return { x:(relativeFrame.origin.x), y:(relativeFrame.origin.y + relativeFrame.size.height) };
}
},["CGPoint","_CPAutocompleteMenu"]), new objj_method(sel_getUid("_displayStringForRepresentedObject:"), function $CPTokenField___displayStringForRepresentedObject_(self, _cmd, representedObject)
{ with(self)
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
},["CPString","id"]), new objj_method(sel_getUid("_shouldAddObjects:atIndex:"), function $CPTokenField___shouldAddObjects_atIndex_(self, _cmd, tokens, index)
{ with(self)
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
},["CPArray","CPArray","int"]), new objj_method(sel_getUid("_representedObjectForEditingString:"), function $CPTokenField___representedObjectForEditingString_(self, _cmd, aString)
{ with(self)
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
},["id","CPString"]), new objj_method(sel_getUid("_delayedShowCompletions"), function $CPTokenField___delayedShowCompletions(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "_autocompleteMenu"), "_delayedShowCompletions");
}
},["void"]), new objj_method(sel_getUid("_hideCompletions"), function $CPTokenField___hideCompletions(self, _cmd)
{ with(self)
{
    objj_msgSend(_autocompleteMenu, "_hideCompletions");
}
},["void"])]);
}

{var the_class = objj_allocateClassPair(CPTextField, "_CPTokenFieldToken"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_deleteButton"), new objj_ivar("_tokenField"), new objj_ivar("_representedObject")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $_CPTokenFieldToken__initWithFrame_(self, _cmd, frame)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTokenFieldToken").super_class }, "initWithFrame:", frame))
    {
        _deleteButton = objj_msgSend(objj_msgSend(_CPTokenFieldTokenCloseButton, "alloc"), "initWithFrame:", CPRectMakeZero());
        objj_msgSend(self, "addSubview:", _deleteButton);

        objj_msgSend(self, "setEditable:", NO);
        objj_msgSend(self, "setHighlighted:", NO);
        objj_msgSend(self, "setBezeled:", YES);
    }

    return self;
}
},["id","CPRect"]), new objj_method(sel_getUid("tokenField"), function $_CPTokenFieldToken__tokenField(self, _cmd)
{ with(self)
{
    return _tokenField;
}
},["CPTokenField"]), new objj_method(sel_getUid("setTokenField:"), function $_CPTokenFieldToken__setTokenField_(self, _cmd, tokenField)
{ with(self)
{
    _tokenField = tokenField;
}
},["void","CPTokenField"]), new objj_method(sel_getUid("representedObject"), function $_CPTokenFieldToken__representedObject(self, _cmd)
{ with(self)
{
    return _representedObject;
}
},["id"]), new objj_method(sel_getUid("setRepresentedObject:"), function $_CPTokenFieldToken__setRepresentedObject_(self, _cmd, representedObject)
{ with(self)
{
    _representedObject = representedObject;
}
},["void","id"]), new objj_method(sel_getUid("_minimumFrameSize"), function $_CPTokenFieldToken___minimumFrameSize(self, _cmd)
{ with(self)
{
    var size = { width:0.0, height:0.0 },
        minSize = objj_msgSend(self, "currentValueForThemeAttribute:", "min-size"),
        contentInset = objj_msgSend(self, "currentValueForThemeAttribute:", "content-inset");


    size.height = minSize.height;
    size.width = MAX(minSize.width, objj_msgSend((objj_msgSend(self, "stringValue") || " "), "sizeWithFont:", objj_msgSend(self, "font")).width + contentInset.left + contentInset.right);

    return size;
}
},["CGSize"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPTokenFieldToken__layoutSubviews(self, _cmd)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTokenFieldToken").super_class }, "layoutSubviews");

    var bezelView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "bezel-view", CPWindowBelow, "content-view");

    if (bezelView)
    {
        objj_msgSend(_deleteButton, "setTarget:", self);
        objj_msgSend(_deleteButton, "setAction:", sel_getUid("_delete:"));

        var frame = objj_msgSend(bezelView, "frame"),
            buttonOffset = objj_msgSend(_deleteButton, "currentValueForThemeAttribute:", "offset"),
            buttonSize = objj_msgSend(_deleteButton, "currentValueForThemeAttribute:", "min-size");

        objj_msgSend(_deleteButton, "setFrame:", { origin: { x:CPRectGetMaxX(frame) - buttonOffset.x, y:CPRectGetMinY(frame) + buttonOffset.y }, size: { width:buttonSize.width, height:buttonSize.height } });
    }
}
},["void"]), new objj_method(sel_getUid("mouseDown:"), function $_CPTokenFieldToken__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_tokenField, "_mouseDownOnToken:withEvent:", self, anEvent);
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseUp:"), function $_CPTokenFieldToken__mouseUp_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_tokenField, "_mouseUpOnToken:withEvent:", self, anEvent);
}
},["void","CPEvent"]), new objj_method(sel_getUid("_delete:"), function $_CPTokenFieldToken___delete_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(_tokenField, "_deleteToken:", self);
}
},["void","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $_CPTokenFieldToken__defaultThemeClass(self, _cmd)
{ with(self)
{
    return "tokenfield-token";
}
},["CPString"])]);
}




{var the_class = objj_allocateClassPair(CPButton, "_CPTokenFieldTokenCloseButton"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("themeAttributes"), function $_CPTokenFieldTokenCloseButton__themeAttributes(self, _cmd)
{ with(self)
{
    var attributes = objj_msgSend(CPButton, "themeAttributes");

    objj_msgSend(attributes, "setObject:forKey:", { x:15, y:5 }, "offset");

    return attributes;
}
},["id"]), new objj_method(sel_getUid("defaultThemeClass"), function $_CPTokenFieldTokenCloseButton__defaultThemeClass(self, _cmd)
{ with(self)
{
    return "tokenfield-token-close-button";
}
},["CPString"])]);
}


var CPTokenFieldTokenizingCharacterSetKey = "CPTokenFieldTokenizingCharacterSetKey",
    CPTokenFieldCompletionDelayKey = "CPTokenFieldCompletionDelay";

{
var the_class = objj_getClass("CPTokenField")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTokenField\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPTokenField__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "initWithCoder:", aCoder);

    if (self)
    {
        _tokenizingCharacterSet = objj_msgSend(aCoder, "decodeObjectForKey:", CPTokenFieldTokenizingCharacterSetKey) || objj_msgSend(objj_msgSend(self, "class"), "defaultTokenizingCharacterSet");
        _completionDelay = objj_msgSend(aCoder, "decodeDoubleForKey:", CPTokenFieldCompletionDelayKey) || objj_msgSend(objj_msgSend(self, "class"), "defaultCompletionDelay");

        objj_msgSend(self, "_init");

        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }

    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPTokenField__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTokenField").super_class }, "encodeWithCoder:", aCoder);

    objj_msgSend(aCoder, "encodeInt:forKey:", _tokenizingCharacterSet, CPTokenFieldTokenizingCharacterSetKey);
    objj_msgSend(aCoder, "encodeDouble:forKey:", _completionDelay, CPTokenFieldCompletionDelayKey);
}
},["void","CPCoder"])]);
}

