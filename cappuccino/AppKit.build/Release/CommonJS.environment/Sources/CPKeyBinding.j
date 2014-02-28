@STATIC;1.0;I;21;Foundation/CPObject.jI;20;Foundation/CPArray.ji;19;CPEvent_Constants.ji;8;CPText.jt;11433;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("CPEvent_Constants.j", YES);objj_executeFile("CPText.j", YES);CPStandardKeyBindings = {"@.": "cancelOperation:", "@a": "selectAll:", "^a": "moveToBeginningOfParagraph:", "^$a": "moveToBeginningOfParagraphAndModifySelection:", "^b": "moveBackward:", "^$b": "moveBackwardAndModifySelection:", "^~b": "moveWordBackward:", "^~$b": "moveWordBackwardAndModifySelection:", "^d": "deleteForward:", "^e": "moveToEndOfParagraph:", "^$e": "moveToEndOfParagraphAndModifySelection:", "^f": "moveForward:", "^$f": "moveForwardAndModifySelection:", "^~f": "moveWordForward:", "^~$f": "moveWordForwardAndModifySelection:", "^h": "deleteBackward:", "^k": "deleteToEndOfParagraph:", "^l": "centerSelectionInVisibleArea:", "^n": "moveDown:", "^$n": "moveDownAndModifySelection:", "^o": ["insertNewlineIgnoringFieldEditor:", "moveBackward:"], "^p": "moveUp:", "^$p": "moveUpAndModifySelection:", "^t": "transpose:", "^v": "pageDown:", "^$v": "pageDownAndModifySelection:", "^y": "yank:"};
CPStandardKeyBindings[CPNewlineCharacter] = "insertNewline:";
CPStandardKeyBindings[CPCarriageReturnCharacter] = "insertNewline:";
CPStandardKeyBindings[CPEnterCharacter] = "insertNewline:";
CPStandardKeyBindings["~" + CPNewlineCharacter] = "insertNewlineIgnoringFieldEditor:";
CPStandardKeyBindings["~" + CPCarriageReturnCharacter] = "insertNewlineIgnoringFieldEditor:";
CPStandardKeyBindings["~" + CPEnterCharacter] = "insertNewlineIgnoringFieldEditor:";
CPStandardKeyBindings["^" + CPNewlineCharacter] = "insertLineBreak:";
CPStandardKeyBindings["^" + CPCarriageReturnCharacter] = "insertLineBreak:";
CPStandardKeyBindings["^" + CPEnterCharacter] = "insertLineBreak:";
CPStandardKeyBindings[CPBackspaceCharacter] = "deleteBackward:";
CPStandardKeyBindings["~" + CPBackspaceCharacter] = "deleteWordBackward:";
CPStandardKeyBindings[CPDeleteCharacter] = "deleteBackward:";
CPStandardKeyBindings["@" + CPDeleteCharacter] = "deleteToBeginningOfLine:";
CPStandardKeyBindings["~" + CPDeleteCharacter] = "deleteWordBackward:";
CPStandardKeyBindings["^" + CPDeleteCharacter] = "deleteBackwardByDecomposingPreviousCharacter:";
CPStandardKeyBindings["^~" + CPDeleteCharacter] = "deleteWordBackward:";
CPStandardKeyBindings[CPDeleteFunctionKey] = "deleteForward:";
CPStandardKeyBindings["~" + CPDeleteFunctionKey] = "deleteWordForward:";
CPStandardKeyBindings[CPTabCharacter] = "insertTab:";
CPStandardKeyBindings["~" + CPTabCharacter] = "insertTabIgnoringFieldEditor:";
CPStandardKeyBindings["^" + CPTabCharacter] = "selectNextKeyView:";
CPStandardKeyBindings[CPBackTabCharacter] = "insertBacktab:";
CPStandardKeyBindings["^" + CPBackTabCharacter] = "selectPreviousKeyView:";
CPStandardKeyBindings[CPEscapeFunctionKey] = "cancelOperation:";
CPStandardKeyBindings["~" + CPEscapeFunctionKey] = "complete:";
CPStandardKeyBindings[CPF5FunctionKey] = "complete:";
CPStandardKeyBindings[CPLeftArrowFunctionKey] = "moveLeft:";
CPStandardKeyBindings["~" + CPLeftArrowFunctionKey] = "moveWordLeft:";
CPStandardKeyBindings["^" + CPLeftArrowFunctionKey] = "moveToLeftEndOfLine:";
CPStandardKeyBindings["@" + CPLeftArrowFunctionKey] = "moveToLeftEndOfLine:";
CPStandardKeyBindings["$" + CPLeftArrowFunctionKey] = "moveLeftAndModifySelection:";
CPStandardKeyBindings["$~" + CPLeftArrowFunctionKey] = "moveWordLeftAndModifySelection:";
CPStandardKeyBindings["$^" + CPLeftArrowFunctionKey] = "moveToLeftEndOfLineAndModifySelection:";
CPStandardKeyBindings["$@" + CPLeftArrowFunctionKey] = "moveToLeftEndOfLineAndModifySelection:";
CPStandardKeyBindings["@^" + CPLeftArrowFunctionKey] = "makeBaseWritingDirectionRightToLeft:";
CPStandardKeyBindings["@^~" + CPLeftArrowFunctionKey] = "makeTextWritingDirectionRightToLeft:";
CPStandardKeyBindings[CPRightArrowFunctionKey] = "moveRight:";
CPStandardKeyBindings["~" + CPRightArrowFunctionKey] = "moveWordRight:";
CPStandardKeyBindings["^" + CPRightArrowFunctionKey] = "moveToRightEndOfLine:";
CPStandardKeyBindings["@" + CPRightArrowFunctionKey] = "moveToRightEndOfLine:";
CPStandardKeyBindings["$" + CPRightArrowFunctionKey] = "moveRightAndModifySelection:";
CPStandardKeyBindings["$~" + CPRightArrowFunctionKey] = "moveWordRightAndModifySelection:";
CPStandardKeyBindings["$^" + CPRightArrowFunctionKey] = "moveToRightEndOfLineAndModifySelection:";
CPStandardKeyBindings["$@" + CPRightArrowFunctionKey] = "moveToRightEndOfLineAndModifySelection:";
CPStandardKeyBindings["@^" + CPRightArrowFunctionKey] = "makeBaseWritingDirectionLeftToRight:";
CPStandardKeyBindings["@^~" + CPRightArrowFunctionKey] = "makeTextWritingDirectionLeftToRight:";
CPStandardKeyBindings[CPUpArrowFunctionKey] = "moveUp:";
CPStandardKeyBindings["~" + CPUpArrowFunctionKey] = ["moveBackward:", "moveToBeginningOfParagraph:"];
CPStandardKeyBindings["^" + CPUpArrowFunctionKey] = "scrollPageUp:";
CPStandardKeyBindings["@" + CPUpArrowFunctionKey] = "moveToBeginningOfDocument:";
CPStandardKeyBindings["$" + CPUpArrowFunctionKey] = "moveUpAndModifySelection:";
CPStandardKeyBindings["$~" + CPUpArrowFunctionKey] = "moveParagraphBackwardAndModifySelection:";
CPStandardKeyBindings["$@" + CPUpArrowFunctionKey] = "moveToBeginningOfDocumentAndModifySelection:";
CPStandardKeyBindings[CPDownArrowFunctionKey] = "moveDown:";
CPStandardKeyBindings["~" + CPDownArrowFunctionKey] = ["moveForward:", "moveToEndOfParagraph:"];
CPStandardKeyBindings["^" + CPDownArrowFunctionKey] = "scrollPageDown:";
CPStandardKeyBindings["@" + CPDownArrowFunctionKey] = "moveToEndOfDocument:";
CPStandardKeyBindings["$" + CPDownArrowFunctionKey] = "moveDownAndModifySelection:";
CPStandardKeyBindings["$~" + CPDownArrowFunctionKey] = "moveParagraphForwardAndModifySelection:";
CPStandardKeyBindings["$@" + CPDownArrowFunctionKey] = "moveToEndOfDocumentAndModifySelection:";
CPStandardKeyBindings["@^" + CPDownArrowFunctionKey] = "makeBaseWritingDirectionNatural:";
CPStandardKeyBindings["@^~" + CPDownArrowFunctionKey] = "makeTextWritingDirectionNatural:";
CPStandardKeyBindings[CPHomeFunctionKey] = "scrollToBeginningOfDocument:";
CPStandardKeyBindings["$" + CPHomeFunctionKey] = "moveToBeginningOfDocumentAndModifySelection:";
CPStandardKeyBindings[CPEndFunctionKey] = "scrollToEndOfDocument:";
CPStandardKeyBindings["$" + CPEndFunctionKey] = "moveToEndOfDocumentAndModifySelection:";
CPStandardKeyBindings[CPPageUpFunctionKey] = "scrollPageUp:";
CPStandardKeyBindings["~" + CPPageUpFunctionKey] = "pageUp:";
CPStandardKeyBindings["$" + CPPageUpFunctionKey] = "pageUpAndModifySelection:";
CPStandardKeyBindings[CPPageDownFunctionKey] = "scrollPageDown:";
CPStandardKeyBindings["~" + CPPageDownFunctionKey] = "pageDown:";
CPStandardKeyBindings["$" + CPPageDownFunctionKey] = "pageDownAndModifySelection:";
var CPKeyBindingCache = {};
{var the_class = objj_allocateClassPair(CPObject, "CPKeyBinding"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_key"), new objj_ivar("_modifierFlags"), new objj_ivar("_selectors"), new objj_ivar("_cacheName")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithPhysicalKeyString:selectors:"), function $CPKeyBinding__initWithPhysicalKeyString_selectors_(self, _cmd, binding, selectors)
{
    var components = binding.split(""),
        modifierFlags = (objj_msgSend(components, "containsObject:", "$") ? CPShiftKeyMask : 0) | (objj_msgSend(components, "containsObject:", "^") ? CPControlKeyMask : 0) | (objj_msgSend(components, "containsObject:", "~") ? CPAlternateKeyMask : 0) | (objj_msgSend(components, "containsObject:", "@") ? CPCommandKeyMask : 0);
    if (!objj_msgSend(selectors, "isKindOfClass:", CPArray))
        selectors = [selectors];
    return objj_msgSend(self, "initWithKey:modifierFlags:selectors:", objj_msgSend(components, "lastObject"), modifierFlags, selectors);
}
,["id","CPString","CPArray"]), new objj_method(sel_getUid("initWithKey:modifierFlags:selectors:"), function $CPKeyBinding__initWithKey_modifierFlags_selectors_(self, _cmd, aKey, aFlag, selectors)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPKeyBinding").super_class }, "init");
    if (self)
    {
        self._key = aKey;
        self._modifierFlags = aFlag;
        self._selectors = selectors;
        var cacheName = [];
        if (self._modifierFlags & CPCommandKeyMask)
            cacheName.push("@");
        if (self._modifierFlags & CPControlKeyMask)
            cacheName.push("^");
        if (self._modifierFlags & CPAlternateKeyMask)
            cacheName.push("~");
        if (self._modifierFlags & CPShiftKeyMask)
            cacheName.push("$");
        cacheName.push(self._key);
        self._cacheName = cacheName.join("");
    }
    return self;
}
,["id","CPString","unsigned","CPArray"]), new objj_method(sel_getUid("key"), function $CPKeyBinding__key(self, _cmd)
{
    return self._key;
}
,["CPString"]), new objj_method(sel_getUid("modifierFlags"), function $CPKeyBinding__modifierFlags(self, _cmd)
{
    return self._modifierFlags;
}
,["unsigned"]), new objj_method(sel_getUid("selectors"), function $CPKeyBinding__selectors(self, _cmd)
{
    return self._selectors;
}
,["CPArray"]), new objj_method(sel_getUid("_cacheName"), function $CPKeyBinding___cacheName(self, _cmd)
{
    return self._cacheName;
}
,["CPString"]), new objj_method(sel_getUid("isEqual:"), function $CPKeyBinding__isEqual_(self, _cmd, rhs)
{
    return self._key === objj_msgSend(rhs, "key") && self._modifierFlags === objj_msgSend(rhs, "modifierFlags");
}
,["BOOL","CPKeyBinding"]), new objj_method(sel_getUid("description"), function $CPKeyBinding__description(self, _cmd)
{
    return objj_msgSend(CPString, "stringWithFormat:", "<KeyBinding string: '%@' modifierFlags: 0x%lx selectors: %@>", self._key, self._modifierFlags, self._selectors);
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPKeyBinding__initialize(self, _cmd)
{
    if (self !== objj_msgSend(CPKeyBinding, "class"))
        return;
    objj_msgSend(self, "createKeyBindingsFromJSObject:", CPStandardKeyBindings);
}
,["void"]), new objj_method(sel_getUid("createKeyBindingsFromJSObject:"), function $CPKeyBinding__createKeyBindingsFromJSObject_(self, _cmd, anObject)
{
    var binding;
    for (binding in anObject)
        objj_msgSend(self, "cacheKeyBinding:", objj_msgSend(objj_msgSend(CPKeyBinding, "alloc"), "initWithPhysicalKeyString:selectors:", binding, anObject[binding]));
}
,["void","JSObject"]), new objj_method(sel_getUid("cacheKeyBinding:"), function $CPKeyBinding__cacheKeyBinding_(self, _cmd, aBinding)
{
    if (!aBinding)
        return;
    CPKeyBindingCache[objj_msgSend(aBinding, "_cacheName")] = aBinding;
}
,["void","CPKeyBinding"]), new objj_method(sel_getUid("keyBindingForKey:modifierFlags:"), function $CPKeyBinding__keyBindingForKey_modifierFlags_(self, _cmd, aKey, aFlag)
{
    var tempBinding = objj_msgSend(objj_msgSend(self, "alloc"), "initWithKey:modifierFlags:selectors:", aKey, aFlag, nil);
    return CPKeyBindingCache[objj_msgSend(tempBinding, "_cacheName")];
}
,["CPKeyBinding","CPString","unsigned"]), new objj_method(sel_getUid("selectorsForKey:modifierFlags:"), function $CPKeyBinding__selectorsForKey_modifierFlags_(self, _cmd, aKey, aFlag)
{
    return objj_msgSend(objj_msgSend(self, "keyBindingForKey:modifierFlags:", aKey, aFlag), "selectors");
}
,["CPArray","CPString","unsigned"])]);
}