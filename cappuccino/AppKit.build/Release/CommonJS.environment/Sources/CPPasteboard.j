@STATIC;1.0;I;21;Foundation/CPObject.jI;20;Foundation/CPArray.jI;19;Foundation/CPData.jI;25;Foundation/CPDictionary.jI;40;Foundation/CPPropertyListSerialization.jt;11063;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("Foundation/CPData.j", NO);objj_executeFile("Foundation/CPDictionary.j", NO);objj_executeFile("Foundation/CPPropertyListSerialization.j", NO);CPGeneralPboard = "CPGeneralPboard";
CPFontPboard = "CPFontPboard";
CPRulerPboard = "CPRulerPboard";
CPFindPboard = "CPFindPboard";
CPDragPboard = "CPDragPboard";
CPColorPboardType = "CPColorPboardType";
CPFilenamesPboardType = "CPFilenamesPboardType";
CPFontPboardType = "CPFontPboardType";
CPHTMLPboardType = "CPHTMLPboardType";
CPStringPboardType = "CPStringPboardType";
CPURLPboardType = "CPURLPboardType";
CPImagesPboardType = "CPImagesPboardType";
CPVideosPboardType = "CPVideosPboardType";
UTF8PboardType = "public.utf8-plain-text";
CPImagePboardType = "CPImagePboardType";
var CPPasteboards = nil,
    supportsNativePasteboard = NO;
{var the_class = objj_allocateClassPair(CPObject, "CPPasteboard"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_types"), new objj_ivar("_owners"), new objj_ivar("_provided"), new objj_ivar("_changeCount"), new objj_ivar("_stateUID"), new objj_ivar("_nativePasteboard")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_initWithName:"), function $CPPasteboard___initWithName_(self, _cmd, aName)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPasteboard").super_class }, "init");
    if (self)
    {
        self._types = [];
        self._owners = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        self._provided = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        self._changeCount = 0;
        if (supportsNativePasteboard)
        {
            self._nativePasteboard = window.cpPasteboardWithName(aName);
            (self == null ? null : self.isa.objj_msgSend0(self, "_synchronizePasteboard"));
        }
    }
    return self;
}
,["id","CPString"]), new objj_method(sel_getUid("addTypes:owner:"), function $CPPasteboard__addTypes_owner_(self, _cmd, types, anOwner)
{
    var i = 0,
        count = types.length;
    for (; i < count; ++i)
    {
        var type = types[i];
        if (!((___r1 = self._owners), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", type)))
        {
            ((___r1 = self._types), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", type));
            ((___r1 = self._provided), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectForKey:", type));
        }
        ((___r1 = self._owners), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", anOwner, type));
    }
    if (self._nativePasteboard)
    {
        var nativeTypes = (types == null ? null : types.isa.objj_msgSend0(types, "copy"));
        if ((types == null ? null : types.isa.objj_msgSend1(types, "containsObject:", CPStringPboardType)))
            nativeTypes.push(UTF8PboardType);
        self._nativePasteboard.addTypes_(nativeTypes);
    }
    return ++self._changeCount;
    var ___r1;
}
,["unsigned","CPArray","id"]), new objj_method(sel_getUid("declareTypes:owner:"), function $CPPasteboard__declareTypes_owner_(self, _cmd, types, anOwner)
{
    self.isa.objj_msgSend3(self, "_declareTypes:owner:updateNativePasteboard:", types, anOwner, YES);
}
,["unsigned","CPArray","id"]), new objj_method(sel_getUid("_declareTypes:owner:updateNativePasteboard:"), function $CPPasteboard___declareTypes_owner_updateNativePasteboard_(self, _cmd, types, anOwner, shouldUpdate)
{
    ((___r1 = self._types), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setArray:", types));
    self._owners = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    self._provided = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    if (anOwner)
    {
        var count = self._types.length;
        while (count--)
            ((___r1 = self._owners), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", anOwner, self._types[count]));
    }
    if (self._nativePasteboard && shouldUpdate)
    {
        var nativeTypes = (types == null ? null : types.isa.objj_msgSend0(types, "copy"));
        if ((types == null ? null : types.isa.objj_msgSend1(types, "containsObject:", CPStringPboardType)))
            nativeTypes.push(UTF8PboardType);
        self._nativePasteboard.declareTypes_(nativeTypes);
        self._changeCount = self._nativePasteboard.changeCount();
    }
    return ++self._changeCount;
    var ___r1;
}
,["unsigned","CPArray","id","BOOL"]), new objj_method(sel_getUid("setData:forType:"), function $CPPasteboard__setData_forType_(self, _cmd, aData, aType)
{
    ((___r1 = self._provided), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", aData, aType));
    if (aType === CPStringPboardType)
        self.isa.objj_msgSend2(self, "setData:forType:", aData, UTF8PboardType);
    return YES;
    var ___r1;
}
,["BOOL","CPData","CPString"]), new objj_method(sel_getUid("setPropertyList:forType:"), function $CPPasteboard__setPropertyList_forType_(self, _cmd, aPropertyList, aType)
{
    return self.isa.objj_msgSend2(self, "setData:forType:", CPPropertyListSerialization.isa.objj_msgSend2(CPPropertyListSerialization, "dataFromPropertyList:format:", aPropertyList, CPPropertyList280NorthFormat_v1_0), aType);
}
,["BOOL","id","CPString"]), new objj_method(sel_getUid("setString:forType:"), function $CPPasteboard__setString_forType_(self, _cmd, aString, aType)
{
    if (aString && aString.isa && !(aString == null ? null : aString.isa.objj_msgSend1(aString, "isKindOfClass:", CPString)))
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "CPPasteboard setString:forType: must be called with a string.");
    self.isa.objj_msgSend2(self, "setPropertyList:forType:", aString, aType);
}
,["void","CPString","CPString"]), new objj_method(sel_getUid("availableTypeFromArray:"), function $CPPasteboard__availableTypeFromArray_(self, _cmd, anArray)
{
    return (anArray == null ? null : anArray.isa.objj_msgSend1(anArray, "firstObjectCommonWithArray:", self.isa.objj_msgSend0(self, "types")));
}
,["CPString","CPArray"]), new objj_method(sel_getUid("types"), function $CPPasteboard__types(self, _cmd)
{
    self.isa.objj_msgSend0(self, "_synchronizePasteboard");
    return self._types;
}
,["CPArray"]), new objj_method(sel_getUid("changeCount"), function $CPPasteboard__changeCount(self, _cmd)
{
    return self._changeCount;
}
,["unsigned"]), new objj_method(sel_getUid("dataForType:"), function $CPPasteboard__dataForType_(self, _cmd, aType)
{
    var data = ((___r1 = self._provided), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", aType));
    if (data)
        return data;
    var owner = ((___r1 = self._owners), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", aType));
    if (owner)
    {
        (owner == null ? null : owner.isa.objj_msgSend2(owner, "pasteboard:provideDataForType:", self, aType));
        return ((___r1 = self._provided), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", aType));
    }
    if (aType === CPStringPboardType)
        return self.isa.objj_msgSend1(self, "dataForType:", UTF8PboardType);
    return nil;
    var ___r1;
}
,["CPData","CPString"]), new objj_method(sel_getUid("_synchronizePasteboard"), function $CPPasteboard___synchronizePasteboard(self, _cmd)
{
    if (self._nativePasteboard && self._nativePasteboard.changeCount() > self._changeCount)
    {
        var nativeTypes = ((___r1 = self._nativePasteboard.types()), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
        if ((nativeTypes == null ? null : nativeTypes.isa.objj_msgSend1(nativeTypes, "containsObject:", UTF8PboardType)))
            nativeTypes.push(CPStringPboardType);
        self.isa.objj_msgSend3(self, "_declareTypes:owner:updateNativePasteboard:", nativeTypes, self, NO);
        self._changeCount = self._nativePasteboard.changeCount();
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("pasteboard:provideDataForType:"), function $CPPasteboard__pasteboard_provideDataForType_(self, _cmd, aPasteboard, aType)
{
    if (aType === CPStringPboardType)
    {
        var string = self._nativePasteboard.stringForType_(UTF8PboardType);
        self.isa.objj_msgSend2(self, "setString:forType:", string, CPStringPboardType);
        self.isa.objj_msgSend2(self, "setString:forType:", string, UTF8PboardType);
    }
    else
        self.isa.objj_msgSend2(self, "setString:forType:", self._nativePasteboard.stringForType_(aType), aType);
}
,["void","CPPasteboard","CPString"]), new objj_method(sel_getUid("propertyListForType:"), function $CPPasteboard__propertyListForType_(self, _cmd, aType)
{
    var data = self.isa.objj_msgSend1(self, "dataForType:", aType);
    if (data)
        return CPPropertyListSerialization.isa.objj_msgSend2(CPPropertyListSerialization, "propertyListFromData:format:", data, CPPropertyList280NorthFormat_v1_0);
    return nil;
}
,["id","CPString"]), new objj_method(sel_getUid("stringForType:"), function $CPPasteboard__stringForType_(self, _cmd, aType)
{
    return self.isa.objj_msgSend1(self, "propertyListForType:", aType);
}
,["CPString","CPString"]), new objj_method(sel_getUid("_generateStateUID"), function $CPPasteboard___generateStateUID(self, _cmd)
{
    var bits = 32;
    self._stateUID = "";
    while (bits--)
        self._stateUID += ((FLOOR(RAND() * 16.0)).toString(16)).toUpperCase();
    return self._stateUID;
}
,["CPString"]), new objj_method(sel_getUid("_stateUID"), function $CPPasteboard___stateUID(self, _cmd)
{
    return self._stateUID;
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPPasteboard__initialize(self, _cmd)
{
    if (self !== CPPasteboard.isa.objj_msgSend0(CPPasteboard, "class"))
        return;
    self.isa.objj_msgSend1(self, "setVersion:", 1.0);
    CPPasteboards = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    if (typeof window.cpPasteboardWithName !== "undefined")
        supportsNativePasteboard = YES;
}
,["void"]), new objj_method(sel_getUid("generalPasteboard"), function $CPPasteboard__generalPasteboard(self, _cmd)
{
    return CPPasteboard.isa.objj_msgSend1(CPPasteboard, "pasteboardWithName:", CPGeneralPboard);
}
,["id"]), new objj_method(sel_getUid("pasteboardWithName:"), function $CPPasteboard__pasteboardWithName_(self, _cmd, aName)
{
    var pasteboard = (CPPasteboards == null ? null : CPPasteboards.isa.objj_msgSend1(CPPasteboards, "objectForKey:", aName));
    if (pasteboard)
        return pasteboard;
    pasteboard = ((___r1 = CPPasteboard.isa.objj_msgSend0(CPPasteboard, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_initWithName:", aName));
    (CPPasteboards == null ? null : CPPasteboards.isa.objj_msgSend2(CPPasteboards, "setObject:forKey:", pasteboard, aName));
    return pasteboard;
    var ___r1;
}
,["id","CPString"])]);
}