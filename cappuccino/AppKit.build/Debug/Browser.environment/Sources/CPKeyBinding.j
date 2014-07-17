@STATIC;1.0;I;21;Foundation/CPObject.jI;20;Foundation/CPArray.ji;19;CPEvent_Constants.ji;8;CPText.jt;12164;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("CPEvent_Constants.j", YES);objj_executeFile("CPText.j", YES);CPStandardKeyBindings = {"@.": "cancelOperation:", "@a": "selectAll:", "^a": "moveToBeginningOfParagraph:", "^$a": "moveToBeginningOfParagraphAndModifySelection:", "^b": "moveBackward:", "^$b": "moveBackwardAndModifySelection:", "^~b": "moveWordBackward:", "^~$b": "moveWordBackwardAndModifySelection:", "^d": "deleteForward:", "^e": "moveToEndOfParagraph:", "^$e": "moveToEndOfParagraphAndModifySelection:", "^f": "moveForward:", "^$f": "moveForwardAndModifySelection:", "^~f": "moveWordForward:", "^~$f": "moveWordForwardAndModifySelection:", "^h": "deleteBackward:", "^k": "deleteToEndOfParagraph:", "^l": "centerSelectionInVisibleArea:", "^n": "moveDown:", "^$n": "moveDownAndModifySelection:", "^o": ["insertNewlineIgnoringFieldEditor:", "moveBackward:"], "^p": "moveUp:", "^$p": "moveUpAndModifySelection:", "^t": "transpose:", "^v": "pageDown:", "^$v": "pageDownAndModifySelection:", "^y": "yank:"};
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
        modifierFlags = ((components == null ? null : components.isa.objj_msgSend1(components, "containsObject:", "$")) ? CPShiftKeyMask : 0) | ((components == null ? null : components.isa.objj_msgSend1(components, "containsObject:", "^")) ? CPControlKeyMask : 0) | ((components == null ? null : components.isa.objj_msgSend1(components, "containsObject:", "~")) ? CPAlternateKeyMask : 0) | ((components == null ? null : components.isa.objj_msgSend1(components, "containsObject:", "@")) ? CPCommandKeyMask : 0);
    if (!(selectors == null ? null : selectors.isa.objj_msgSend1(selectors, "isKindOfClass:", CPArray)))
        selectors = [selectors];
    return self.isa.objj_msgSend3(self, "initWithKey:modifierFlags:selectors:", (components == null ? null : components.isa.objj_msgSend0(components, "lastObject")), modifierFlags, selectors);
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
    return self._key === (rhs == null ? null : rhs.isa.objj_msgSend0(rhs, "key")) && self._modifierFlags === (rhs == null ? null : rhs.isa.objj_msgSend0(rhs, "modifierFlags"));
}
,["BOOL","CPKeyBinding"]), new objj_method(sel_getUid("description"), function $CPKeyBinding__description(self, _cmd)
{
    return CPString.isa.objj_msgSend(CPString, "stringWithFormat:", "<KeyBinding string: '%@' modifierFlags: 0x%lx selectors: %@>", self._key, self._modifierFlags, self._selectors);
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPKeyBinding__initialize(self, _cmd)
{
    if (self !== CPKeyBinding.isa.objj_msgSend0(CPKeyBinding, "class"))
        return;
    self.isa.objj_msgSend1(self, "createKeyBindingsFromJSObject:", CPStandardKeyBindings);
}
,["void"]), new objj_method(sel_getUid("createKeyBindingsFromJSObject:"), function $CPKeyBinding__createKeyBindingsFromJSObject_(self, _cmd, anObject)
{
    var binding;
    for (binding in anObject)
        self.isa.objj_msgSend1(self, "cacheKeyBinding:", ((___r1 = CPKeyBinding.isa.objj_msgSend0(CPKeyBinding, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithPhysicalKeyString:selectors:", binding, anObject[binding])));
    var ___r1;
}
,["void","JSObject"]), new objj_method(sel_getUid("cacheKeyBinding:"), function $CPKeyBinding__cacheKeyBinding_(self, _cmd, aBinding)
{
    if (!aBinding)
        return;
    CPKeyBindingCache[(aBinding == null ? null : aBinding.isa.objj_msgSend0(aBinding, "_cacheName"))] = aBinding;
}
,["void","CPKeyBinding"]), new objj_method(sel_getUid("keyBindingForKey:modifierFlags:"), function $CPKeyBinding__keyBindingForKey_modifierFlags_(self, _cmd, aKey, aFlag)
{
    var tempBinding = ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithKey:modifierFlags:selectors:", aKey, aFlag, nil));
    return CPKeyBindingCache[(tempBinding == null ? null : tempBinding.isa.objj_msgSend0(tempBinding, "_cacheName"))];
    var ___r1;
}
,["CPKeyBinding","CPString","unsigned"]), new objj_method(sel_getUid("selectorsForKey:modifierFlags:"), function $CPKeyBinding__selectorsForKey_modifierFlags_(self, _cmd, aKey, aFlag)
{
    return ((___r1 = self.isa.objj_msgSend2(self, "keyBindingForKey:modifierFlags:", aKey, aFlag)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "selectors"));
    var ___r1;
}
,["CPArray","CPString","unsigned"])]);
}