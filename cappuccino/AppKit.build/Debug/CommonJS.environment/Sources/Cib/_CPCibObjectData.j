@STATIC;1.0;I;20;Foundation/CPArray.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;23;CPCibBindingConnector.ji;16;CPCibConnector.ji;23;CPCibControlConnector.ji;20;CPCibHelpConnector.ji;22;CPCibOutletConnector.ji;33;CPCibRuntimeAttributesConnector.ji;12;CPClipView.jt;9795;objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("CPCibBindingConnector.j", YES);objj_executeFile("CPCibConnector.j", YES);objj_executeFile("CPCibControlConnector.j", YES);objj_executeFile("CPCibHelpConnector.j", YES);objj_executeFile("CPCibOutletConnector.j", YES);objj_executeFile("CPCibRuntimeAttributesConnector.j", YES);objj_executeFile("CPClipView.j", YES);{var the_class = objj_allocateClassPair(CPObject, "_CPCibObjectData"),
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
        self._visibleWindows = objj_msgSend(CPSet, "set");
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("displayVisibleWindows"), function $_CPCibObjectData__displayVisibleWindows(self, _cmd)
{
    var object = nil,
        objectEnumerator = objj_msgSend(self._visibleWindows, "objectEnumerator");
    while ((object = objj_msgSend(objectEnumerator, "nextObject")) !== nil)
        objj_msgSend(self._replacementObjects[objj_msgSend(object, "UID")], "makeKeyAndOrderFront:", self);
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
        self._namesKeys = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataNamesKeysKey);
        self._namesValues = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataNamesValuesKey);
        self._classesKeys = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataClassesKeysKey);
        self._classesValues = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataClassesValuesKey);
        self._connections = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataConnectionsKey);
        self._framework = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataFrameworkKey);
        self._nextOid = objj_msgSend(aCoder, "decodeIntForKey:", _CPCibObjectDataNextOidKey);
        self._objectsKeys = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataObjectsKeysKey);
        self._objectsValues = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataObjectsValuesKey);
        self._oidKeys = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataOidKeysKey);
        self._oidValues = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataOidValuesKey);
        self._fileOwner = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataFileOwnerKey);
        self._visibleWindows = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataVisibleWindowsKey);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPCibObjectData__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", self._namesKeys, _CPCibObjectDataNamesKeysKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._namesValues, _CPCibObjectDataNamesValuesKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._classesKeys, _CPCibObjectDataClassesKeysKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._classesValues, _CPCibObjectDataClassesValuesKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._connections, _CPCibObjectDataConnectionsKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._framework, _CPCibObjectDataFrameworkKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._nextOid, _CPCibObjectDataNextOidKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._objectsKeys, _CPCibObjectDataObjectsKeysKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._objectsValues, _CPCibObjectDataObjectsValuesKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._oidKeys, _CPCibObjectDataOidKeysKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._oidValues, _CPCibObjectDataOidValuesKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._fileOwner, _CPCibObjectDataFileOwnerKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._visibleWindows, _CPCibObjectDataVisibleWindowsKey);
}
,["void","CPCoder"]), new objj_method(sel_getUid("instantiateWithOwner:topLevelObjects:"), function $_CPCibObjectData__instantiateWithOwner_topLevelObjects_(self, _cmd, anOwner, topLevelObjects)
{
    var count = objj_msgSend(self._objectsKeys, "count");
    while (count--)
    {
        var object = self._objectsKeys[count],
            parent = self._objectsValues[count],
            instantiatedObject = object;
        if (objj_msgSend(object, "respondsToSelector:", sel_getUid("_cibInstantiate")))
        {
            var instantiatedObject = objj_msgSend(object, "_cibInstantiate");
            if (instantiatedObject !== object)
            {
                self._replacementObjects[objj_msgSend(object, "UID")] = instantiatedObject;
                if (objj_msgSend(instantiatedObject, "isKindOfClass:", CPView))
                {
                    var clipView = objj_msgSend(instantiatedObject, "superview");
                    if (objj_msgSend(clipView, "isKindOfClass:", CPClipView))
                    {
                        var scrollView = objj_msgSend(clipView, "superview");
                        if (objj_msgSend(scrollView, "isKindOfClass:", CPScrollView))
                            objj_msgSend(scrollView, "setDocumentView:", instantiatedObject);
                    }
                }
            }
        }
        if (topLevelObjects && parent === self._fileOwner && object !== self._fileOwner)
            topLevelObjects.push(instantiatedObject);
    }
}
,["void","id","CPMutableArray"]), new objj_method(sel_getUid("establishConnectionsWithOwner:topLevelObjects:"), function $_CPCibObjectData__establishConnectionsWithOwner_topLevelObjects_(self, _cmd, anOwner, topLevelObjects)
{
    self._replacementObjects[objj_msgSend(self._fileOwner, "UID")] = anOwner;
    for (var i = 0, count = self._connections.length; i < count; ++i)
    {
        var connection = self._connections[i];
        objj_msgSend(connection, "replaceObjects:", self._replacementObjects);
        objj_msgSend(connection, "establishConnection");
    }
}
,["void","id","CPMutableArray"]), new objj_method(sel_getUid("awakeWithOwner:topLevelObjects:"), function $_CPCibObjectData__awakeWithOwner_topLevelObjects_(self, _cmd, anOwner, topLevelObjects)
{
    var count = objj_msgSend(self._objectsKeys, "count");
    while (count--)
    {
        var object = self._objectsKeys[count],
            instantiatedObject = self._replacementObjects[objj_msgSend(object, "UID")];
        if (instantiatedObject)
            object = instantiatedObject;
        if (object !== anOwner && objj_msgSend(object, "respondsToSelector:", sel_getUid("awakeFromCib")))
            objj_msgSend(object, "awakeFromCib");
    }
    if (objj_msgSend(anOwner, "respondsToSelector:", sel_getUid("awakeFromCib")))
        objj_msgSend(anOwner, "awakeFromCib");
}
,["void","id","CPMutableArray"])]);
}