@STATIC;1.0;I;20;Foundation/CPArray.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;23;CPCibBindingConnector.ji;16;CPCibConnector.ji;23;CPCibControlConnector.ji;20;CPCibHelpConnector.ji;22;CPCibOutletConnector.ji;33;CPCibRuntimeAttributesConnector.ji;12;CPClipView.jt;11915;objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("CPCibBindingConnector.j", YES);objj_executeFile("CPCibConnector.j", YES);objj_executeFile("CPCibControlConnector.j", YES);objj_executeFile("CPCibHelpConnector.j", YES);objj_executeFile("CPCibOutletConnector.j", YES);objj_executeFile("CPCibRuntimeAttributesConnector.j", YES);objj_executeFile("CPClipView.j", YES);{var the_class = objj_allocateClassPair(CPObject, "_CPCibObjectData"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_namesKeys"), new objj_ivar("_namesValues"), new objj_ivar("_accessibilityConnectors"), new objj_ivar("_accessibilityOidsKeys"), new objj_ivar("_accessibilityOidsValues"), new objj_ivar("_classesKeys"), new objj_ivar("_classesValues"), new objj_ivar("_connections"), new objj_ivar("_fontManager"), new objj_ivar("_framework"), new objj_ivar("_nextOid"), new objj_ivar("_objectsKeys"), new objj_ivar("_objectsValues"), new objj_ivar("_oidKeys"), new objj_ivar("_oidValues"), new objj_ivar("_fileOwner"), new objj_ivar("_visibleWindows"), new objj_ivar("_replacementObjects")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $_CPCibObjectData__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPCibObjectData").super_class }, "init");
    if (self)
    {
        self._namesKeys = [];
        self._namesValues = [];
        self._classesKeys = [];
        self._classesValues = [];
        self._connections = [];
        self._framework = "";
        self._nextOid = [];
        self._objectsKeys = [];
        self._objectsValues = [];
        self._oidKeys = [];
        self._oidValues = [];
        self._fileOwner = nil;
        self._visibleWindows = CPSet.isa.objj_msgSend0(CPSet, "set");
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("displayVisibleWindows"), function $_CPCibObjectData__displayVisibleWindows(self, _cmd)
{
    var object = nil,
        objectEnumerator = ((___r1 = self._visibleWindows), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "objectEnumerator"));
    while ((object = (objectEnumerator == null ? null : objectEnumerator.isa.objj_msgSend0(objectEnumerator, "nextObject"))) !== nil)
        ((___r1 = self._replacementObjects[(object == null ? null : object.isa.objj_msgSend0(object, "UID"))]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeKeyAndOrderFront:", self));
    var ___r1;
}
,["void"])]);
}var _CPCibObjectDataNamesKeysKey = "_CPCibObjectDataNamesKeysKey",
    _CPCibObjectDataNamesValuesKey = "_CPCibObjectDataNamesValuesKey",
    _CPCibObjectDataAccessibilityConnectorsKey = "_CPCibObjectDataAccessibilityConnectors",
    _CPCibObjectDataAccessibilityOidsKeysKey = "_CPCibObjectDataAccessibilityOidsKeys",
    _CPCibObjectDataAccessibilityOidsValuesKey = "_CPCibObjectDataAccessibilityOidsValues",
    _CPCibObjectDataClassesKeysKey = "_CPCibObjectDataClassesKeysKey",
    _CPCibObjectDataClassesValuesKey = "_CPCibObjectDataClassesValuesKey",
    _CPCibObjectDataConnectionsKey = "_CPCibObjectDataConnectionsKey",
    _CPCibObjectDataFontManagerKey = "_CPCibObjectDataFontManagerKey",
    _CPCibObjectDataFrameworkKey = "_CPCibObjectDataFrameworkKey",
    _CPCibObjectDataNextOidKey = "_CPCibObjectDataNextOidKey",
    _CPCibObjectDataObjectsKeysKey = "_CPCibObjectDataObjectsKeysKey",
    _CPCibObjectDataObjectsValuesKey = "_CPCibObjectDataObjectsValuesKey",
    _CPCibObjectDataOidKeysKey = "_CPCibObjectDataOidKeysKey",
    _CPCibObjectDataOidValuesKey = "_CPCibObjectDataOidValuesKey",
    _CPCibObjectDataFileOwnerKey = "_CPCibObjectDataFileOwnerKey",
    _CPCibObjectDataVisibleWindowsKey = "_CPCibObjectDataVisibleWindowsKey";
{
var the_class = objj_getClass("_CPCibObjectData")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPCibObjectData\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_CPCibObjectData__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPCibObjectData").super_class }, "init");
    if (self)
    {
        self._replacementObjects = {};
        self._namesKeys = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibObjectDataNamesKeysKey));
        self._namesValues = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibObjectDataNamesValuesKey));
        self._classesKeys = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibObjectDataClassesKeysKey));
        self._classesValues = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibObjectDataClassesValuesKey));
        self._connections = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibObjectDataConnectionsKey));
        self._framework = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibObjectDataFrameworkKey));
        self._nextOid = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", _CPCibObjectDataNextOidKey));
        self._objectsKeys = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibObjectDataObjectsKeysKey));
        self._objectsValues = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibObjectDataObjectsValuesKey));
        self._oidKeys = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibObjectDataOidKeysKey));
        self._oidValues = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibObjectDataOidValuesKey));
        self._fileOwner = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibObjectDataFileOwnerKey));
        self._visibleWindows = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPCibObjectDataVisibleWindowsKey));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPCibObjectData__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._namesKeys, _CPCibObjectDataNamesKeysKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._namesValues, _CPCibObjectDataNamesValuesKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._classesKeys, _CPCibObjectDataClassesKeysKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._classesValues, _CPCibObjectDataClassesValuesKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._connections, _CPCibObjectDataConnectionsKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._framework, _CPCibObjectDataFrameworkKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._nextOid, _CPCibObjectDataNextOidKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._objectsKeys, _CPCibObjectDataObjectsKeysKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._objectsValues, _CPCibObjectDataObjectsValuesKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._oidKeys, _CPCibObjectDataOidKeysKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._oidValues, _CPCibObjectDataOidValuesKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._fileOwner, _CPCibObjectDataFileOwnerKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._visibleWindows, _CPCibObjectDataVisibleWindowsKey));
}
,["void","CPCoder"]), new objj_method(sel_getUid("instantiateWithOwner:topLevelObjects:"), function $_CPCibObjectData__instantiateWithOwner_topLevelObjects_(self, _cmd, anOwner, topLevelObjects)
{
    var count = ((___r1 = self._objectsKeys), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    while (count--)
    {
        var object = self._objectsKeys[count],
            parent = self._objectsValues[count],
            instantiatedObject = object;
        if ((object == null ? null : object.isa.objj_msgSend1(object, "respondsToSelector:", sel_getUid("_cibInstantiate"))))
        {
            var instantiatedObject = (object == null ? null : object.isa.objj_msgSend0(object, "_cibInstantiate"));
            if (instantiatedObject !== object)
            {
                self._replacementObjects[(object == null ? null : object.isa.objj_msgSend0(object, "UID"))] = instantiatedObject;
                if ((instantiatedObject == null ? null : instantiatedObject.isa.objj_msgSend1(instantiatedObject, "isKindOfClass:", CPView)))
                {
                    var clipView = (instantiatedObject == null ? null : instantiatedObject.isa.objj_msgSend0(instantiatedObject, "superview"));
                    if ((clipView == null ? null : clipView.isa.objj_msgSend1(clipView, "isKindOfClass:", CPClipView)))
                    {
                        var scrollView = (clipView == null ? null : clipView.isa.objj_msgSend0(clipView, "superview"));
                        if ((scrollView == null ? null : scrollView.isa.objj_msgSend1(scrollView, "isKindOfClass:", CPScrollView)))
                            (scrollView == null ? null : scrollView.isa.objj_msgSend1(scrollView, "setDocumentView:", instantiatedObject));
                    }
                }
            }
        }
        if (topLevelObjects && parent === self._fileOwner && object !== self._fileOwner)
            topLevelObjects.push(instantiatedObject);
    }
    var ___r1;
}
,["void","id","CPMutableArray"]), new objj_method(sel_getUid("establishConnectionsWithOwner:topLevelObjects:"), function $_CPCibObjectData__establishConnectionsWithOwner_topLevelObjects_(self, _cmd, anOwner, topLevelObjects)
{
    self._replacementObjects[((___r1 = self._fileOwner), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "UID"))] = anOwner;
    for (var i = 0, count = self._connections.length; i < count; ++i)
    {
        var connection = self._connections[i];
        (connection == null ? null : connection.isa.objj_msgSend1(connection, "replaceObjects:", self._replacementObjects));
        (connection == null ? null : connection.isa.objj_msgSend0(connection, "establishConnection"));
    }
    var ___r1;
}
,["void","id","CPMutableArray"]), new objj_method(sel_getUid("awakeWithOwner:topLevelObjects:"), function $_CPCibObjectData__awakeWithOwner_topLevelObjects_(self, _cmd, anOwner, topLevelObjects)
{
    var count = ((___r1 = self._objectsKeys), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    while (count--)
    {
        var object = self._objectsKeys[count],
            instantiatedObject = self._replacementObjects[(object == null ? null : object.isa.objj_msgSend0(object, "UID"))];
        if (instantiatedObject)
            object = instantiatedObject;
        if (object !== anOwner && (object == null ? null : object.isa.objj_msgSend1(object, "respondsToSelector:", sel_getUid("awakeFromCib"))))
            (object == null ? null : object.isa.objj_msgSend0(object, "awakeFromCib"));
    }
    if ((anOwner == null ? null : anOwner.isa.objj_msgSend1(anOwner, "respondsToSelector:", sel_getUid("awakeFromCib"))))
        (anOwner == null ? null : anOwner.isa.objj_msgSend0(anOwner, "awakeFromCib"));
    var ___r1;
}
,["void","id","CPMutableArray"])]);
}