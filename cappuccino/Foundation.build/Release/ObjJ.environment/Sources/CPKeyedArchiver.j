@STATIC;1.0;i;9;CPArray.ji;9;CPCoder.ji;8;CPData.ji;14;CPDictionary.ji;10;CPNumber.ji;10;CPString.ji;9;CPValue.ji;13;_CGGeometry.jt;16964;objj_executeFile("CPArray.j", YES);objj_executeFile("CPCoder.j", YES);objj_executeFile("CPData.j", YES);objj_executeFile("CPDictionary.j", YES);objj_executeFile("CPNumber.j", YES);objj_executeFile("CPString.j", YES);objj_executeFile("CPValue.j", YES);objj_executeFile("_CGGeometry.j", YES);var CPArchiverReplacementClassNames = nil;
var _CPKeyedArchiverDidEncodeObjectSelector = 1,
    _CPKeyedArchiverWillEncodeObjectSelector = 2,
    _CPKeyedArchiverWillReplaceObjectWithObjectSelector = 4,
    _CPKeyedArchiverDidFinishEncodingSelector = 8,
    _CPKeyedArchiverWillFinishEncodingSelector = 16;
var _CPKeyedArchiverNullString = "$null",
    _CPKeyedArchiverNullReference = nil,
    _CPKeyedArchiverUIDKey = "CP$UID",
    _CPKeyedArchiverTopKey = "$top",
    _CPKeyedArchiverObjectsKey = "$objects",
    _CPKeyedArchiverArchiverKey = "$archiver",
    _CPKeyedArchiverVersionKey = "$version",
    _CPKeyedArchiverClassNameKey = "$classname",
    _CPKeyedArchiverClassesKey = "$classes",
    _CPKeyedArchiverClassKey = "$class";
var _CPKeyedArchiverStringClass = Nil,
    _CPKeyedArchiverNumberClass = Nil;
{var the_class = objj_allocateClassPair(CPValue, "_CPKeyedArchiverValue"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}{var the_class = objj_allocateClassPair(CPCoder, "CPKeyedArchiver"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_delegate"), new objj_ivar("_delegateSelectors"), new objj_ivar("_data"), new objj_ivar("_objects"), new objj_ivar("_UIDs"), new objj_ivar("_conditionalUIDs"), new objj_ivar("_replacementObjects"), new objj_ivar("_replacementClassNames"), new objj_ivar("_plistObject"), new objj_ivar("_plistObjects"), new objj_ivar("_outputFormat")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initForWritingWithMutableData:"), function $CPKeyedArchiver__initForWritingWithMutableData_(self, _cmd, data)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPKeyedArchiver").super_class }, "init");
    if (self)
    {
        self._data = data;
        self._objects = [];
        self._UIDs = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        self._conditionalUIDs = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        self._replacementObjects = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        self._plistObject = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        self._plistObjects = objj_msgSend(CPArray, "arrayWithObject:", _CPKeyedArchiverNullString);
    }
    return self;
}
,["id","CPMutableData"]), new objj_method(sel_getUid("finishEncoding"), function $CPKeyedArchiver__finishEncoding(self, _cmd)
{
    if (self._delegate && self._delegateSelectors & _CPKeyedArchiverDidFinishEncodingSelector)
        objj_msgSend(self._delegate, "archiverWillFinish:", self);
    var i = 0,
        topObject = self._plistObject,
        classes = [];
    for (; i < self._objects.length; ++i)
    {
        var object = self._objects[i];
        self._plistObject = self._plistObjects[objj_msgSend(self._UIDs, "objectForKey:", objj_msgSend(object, "UID"))];
        objj_msgSend(object, "encodeWithCoder:", self);
        if (self._delegate && self._delegateSelectors & _CPKeyedArchiverDidEncodeObjectSelector)
            objj_msgSend(self._delegate, "archiver:didEncodeObject:", self, object);
    }
    self._plistObject = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    objj_msgSend(self._plistObject, "setObject:forKey:", topObject, _CPKeyedArchiverTopKey);
    objj_msgSend(self._plistObject, "setObject:forKey:", self._plistObjects, _CPKeyedArchiverObjectsKey);
    objj_msgSend(self._plistObject, "setObject:forKey:", objj_msgSend(self, "className"), _CPKeyedArchiverArchiverKey);
    objj_msgSend(self._plistObject, "setObject:forKey:", "100000", _CPKeyedArchiverVersionKey);
    objj_msgSend(self._data, "setPlistObject:", self._plistObject);
    if (self._delegate && self._delegateSelectors & _CPKeyedArchiverDidFinishEncodingSelector)
        objj_msgSend(self._delegate, "archiverDidFinish:", self);
}
,["void"]), new objj_method(sel_getUid("outputFormat"), function $CPKeyedArchiver__outputFormat(self, _cmd)
{
    return self._outputFormat;
}
,["CPPropertyListFormat"]), new objj_method(sel_getUid("setOutputFormat:"), function $CPKeyedArchiver__setOutputFormat_(self, _cmd, aPropertyListFormat)
{
    self._outputFormat = aPropertyListFormat;
}
,["void","CPPropertyListFormat"]), new objj_method(sel_getUid("encodeBool:forKey:"), function $CPKeyedArchiver__encodeBool_forKey_(self, _cmd, aBOOL, aKey)
{
    objj_msgSend(self._plistObject, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, aBOOL, NO), aKey);
}
,["void","BOOL","CPString"]), new objj_method(sel_getUid("encodeDouble:forKey:"), function $CPKeyedArchiver__encodeDouble_forKey_(self, _cmd, aDouble, aKey)
{
    objj_msgSend(self._plistObject, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, aDouble, NO), aKey);
}
,["void","double","CPString"]), new objj_method(sel_getUid("encodeFloat:forKey:"), function $CPKeyedArchiver__encodeFloat_forKey_(self, _cmd, aFloat, aKey)
{
    objj_msgSend(self._plistObject, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, aFloat, NO), aKey);
}
,["void","float","CPString"]), new objj_method(sel_getUid("encodeInt:forKey:"), function $CPKeyedArchiver__encodeInt_forKey_(self, _cmd, anInt, aKey)
{
    objj_msgSend(self._plistObject, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, anInt, NO), aKey);
}
,["void","float","CPString"]), new objj_method(sel_getUid("setDelegate:"), function $CPKeyedArchiver__setDelegate_(self, _cmd, aDelegate)
{
    self._delegate = aDelegate;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("archiver:didEncodeObject:")))
        self._delegateSelectors |= _CPKeyedArchiverDidEncodeObjectSelector;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("archiver:willEncodeObject:")))
        self._delegateSelectors |= _CPKeyedArchiverWillEncodeObjectSelector;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("archiver:willReplaceObject:withObject:")))
        self._delegateSelectors |= _CPKeyedArchiverWillReplaceObjectWithObjectSelector;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("archiver:didFinishEncoding:")))
        self._delegateSelectors |= _CPKeyedArchiverDidFinishEncodingSelector;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("archiver:willFinishEncoding:")))
        self._delegateSelectors |= _CPKeyedArchiverWillFinishEncodingSelector;
}
,["void","id"]), new objj_method(sel_getUid("delegate"), function $CPKeyedArchiver__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("encodePoint:forKey:"), function $CPKeyedArchiver__encodePoint_forKey_(self, _cmd, aPoint, aKey)
{
    objj_msgSend(self._plistObject, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, CGStringFromPoint(aPoint), NO), aKey);
}
,["void","CGPoint","CPString"]), new objj_method(sel_getUid("encodeRect:forKey:"), function $CPKeyedArchiver__encodeRect_forKey_(self, _cmd, aRect, aKey)
{
    objj_msgSend(self._plistObject, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, CGStringFromRect(aRect), NO), aKey);
}
,["void","CGRect","CPString"]), new objj_method(sel_getUid("encodeSize:forKey:"), function $CPKeyedArchiver__encodeSize_forKey_(self, _cmd, aSize, aKey)
{
    objj_msgSend(self._plistObject, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, CGStringFromSize(aSize), NO), aKey);
}
,["void","CGSize","CPString"]), new objj_method(sel_getUid("encodeConditionalObject:forKey:"), function $CPKeyedArchiver__encodeConditionalObject_forKey_(self, _cmd, anObject, aKey)
{
    objj_msgSend(self._plistObject, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, anObject, YES), aKey);
}
,["void","id","CPString"]), new objj_method(sel_getUid("encodeNumber:forKey:"), function $CPKeyedArchiver__encodeNumber_forKey_(self, _cmd, aNumber, aKey)
{
    objj_msgSend(self._plistObject, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, aNumber, NO), aKey);
}
,["void","CPNumber","CPString"]), new objj_method(sel_getUid("encodeObject:forKey:"), function $CPKeyedArchiver__encodeObject_forKey_(self, _cmd, anObject, aKey)
{
    objj_msgSend(self._plistObject, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, anObject, NO), aKey);
}
,["void","id","CPString"]), new objj_method(sel_getUid("_encodeArrayOfObjects:forKey:"), function $CPKeyedArchiver___encodeArrayOfObjects_forKey_(self, _cmd, objects, aKey)
{
    var i = 0,
        count = objects.length,
        references = [];
    for (; i < count; ++i)
        objj_msgSend(references, "addObject:", _CPKeyedArchiverEncodeObject(self, objects[i], NO));
    objj_msgSend(self._plistObject, "setObject:forKey:", references, aKey);
}
,["void","CPArray","CPString"]), new objj_method(sel_getUid("_encodeDictionaryOfObjects:forKey:"), function $CPKeyedArchiver___encodeDictionaryOfObjects_forKey_(self, _cmd, aDictionary, aKey)
{
    var key,
        keys = objj_msgSend(aDictionary, "keyEnumerator"),
        references = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    while ((key = objj_msgSend(keys, "nextObject")) !== nil)
        objj_msgSend(references, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, objj_msgSend(aDictionary, "objectForKey:", key), NO), key);
    objj_msgSend(self._plistObject, "setObject:forKey:", references, aKey);
}
,["void","CPDictionary","CPString"]), new objj_method(sel_getUid("setClassName:forClass:"), function $CPKeyedArchiver__setClassName_forClass_(self, _cmd, aClassName, aClass)
{
    if (!self._replacementClassNames)
        self._replacementClassNames = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    objj_msgSend(self._replacementClassNames, "setObject:forKey:", aClassName, CPStringFromClass(aClass));
}
,["void","CPString","Class"]), new objj_method(sel_getUid("classNameForClass:"), function $CPKeyedArchiver__classNameForClass_(self, _cmd, aClass)
{
    if (!self._replacementClassNames)
        return aClass.name;
    var className = objj_msgSend(self._replacementClassNames, "objectForKey:", CPStringFromClass(aClass));
    return className ? className : aClass.name;
}
,["CPString","Class"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPKeyedArchiver__initialize(self, _cmd)
{
    if (self !== objj_msgSend(CPKeyedArchiver, "class"))
        return;
    _CPKeyedArchiverStringClass = objj_msgSend(CPString, "class");
    _CPKeyedArchiverNumberClass = objj_msgSend(CPNumber, "class");
    _CPKeyedArchiverNullReference = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", 0, _CPKeyedArchiverUIDKey);
}
,["void"]), new objj_method(sel_getUid("allowsKeyedCoding"), function $CPKeyedArchiver__allowsKeyedCoding(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("archivedDataWithRootObject:"), function $CPKeyedArchiver__archivedDataWithRootObject_(self, _cmd, anObject)
{
    var data = objj_msgSend(CPData, "dataWithPlistObject:", nil),
        archiver = objj_msgSend(objj_msgSend(self, "alloc"), "initForWritingWithMutableData:", data);
    objj_msgSend(archiver, "encodeObject:forKey:", anObject, "root");
    objj_msgSend(archiver, "finishEncoding");
    return data;
}
,["CPData","id"]), new objj_method(sel_getUid("setClassName:forClass:"), function $CPKeyedArchiver__setClassName_forClass_(self, _cmd, aClassName, aClass)
{
    if (!CPArchiverReplacementClassNames)
        CPArchiverReplacementClassNames = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    objj_msgSend(CPArchiverReplacementClassNames, "setObject:forKey:", aClassName, CPStringFromClass(aClass));
}
,["void","CPString","Class"]), new objj_method(sel_getUid("classNameForClass:"), function $CPKeyedArchiver__classNameForClass_(self, _cmd, aClass)
{
    if (!CPArchiverReplacementClassNames)
        return aClass.name;
    var className = objj_msgSend(CPArchiverReplacementClassNames, "objectForKey:", CPStringFromClass(aClass));
    return className ? className : aClass.name;
}
,["CPString","Class"])]);
}var _CPKeyedArchiverEncodeObject = function(self, anObject, isConditional)
{
    if (anObject !== nil && anObject !== undefined && !anObject.isa)
        anObject = objj_msgSend(_CPKeyedArchiverValue, "valueWithJSObject:", anObject);
    var GUID = objj_msgSend(anObject, "UID"),
        object = objj_msgSend(self._replacementObjects, "objectForKey:", GUID);
    if (object === nil)
    {
        object = objj_msgSend(anObject, "replacementObjectForKeyedArchiver:", self);
        if (self._delegate)
        {
            if (object !== anObject && self._delegateSelectors & _CPKeyedArchiverWillReplaceObjectWithObjectSelector)
                objj_msgSend(self._delegate, "archiver:willReplaceObject:withObject:", self, anObject, object);
            if (self._delegateSelectors & _CPKeyedArchiverWillEncodeObjectSelector)
            {
                anObject = objj_msgSend(self._delegate, "archiver:willEncodeObject:", self, object);
                if (anObject !== object && self._delegateSelectors & _CPKeyedArchiverWillReplaceObjectWithObjectSelector)
                    objj_msgSend(self._delegate, "archiver:willReplaceObject:withObject:", self, object, anObject);
                object = anObject;
            }
        }
        if (object != nil && GUID != nil)
            objj_msgSend(self._replacementObjects, "setObject:forKey:", object, GUID);
    }
    if (object === nil)
        return _CPKeyedArchiverNullReference;
    var UID = objj_msgSend(self._UIDs, "objectForKey:", GUID = objj_msgSend(object, "UID"));
    if (UID === nil)
    {
        if (isConditional)
        {
            if ((UID = objj_msgSend(self._conditionalUIDs, "objectForKey:", GUID)) === nil)
            {
                objj_msgSend(self._conditionalUIDs, "setObject:forKey:", UID = objj_msgSend(self._plistObjects, "count"), GUID);
                objj_msgSend(self._plistObjects, "addObject:", _CPKeyedArchiverNullString);
            }
        }
        else
        {
            var theClass = objj_msgSend(object, "classForKeyedArchiver"),
                plistObject = nil;
            if (theClass === _CPKeyedArchiverStringClass || theClass === _CPKeyedArchiverNumberClass)
                plistObject = object;
            else
            {
                plistObject = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
                objj_msgSend(self._objects, "addObject:", object);
                var className = objj_msgSend(self, "classNameForClass:", theClass);
                if (!className)
                    className = objj_msgSend(objj_msgSend(self, "class"), "classNameForClass:", theClass);
                if (!className)
                    className = theClass.name;
                else
                    theClass = CPClassFromString(className);
                var classUID = objj_msgSend(self._UIDs, "objectForKey:", className);
                if (!classUID)
                {
                    var plistClass = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init"),
                        hierarchy = [];
                    objj_msgSend(plistClass, "setObject:forKey:", className, _CPKeyedArchiverClassNameKey);
                    do
                    {
                        objj_msgSend(hierarchy, "addObject:", CPStringFromClass(theClass));
                    }
                    while (theClass = objj_msgSend(theClass, "superclass"));
                    objj_msgSend(plistClass, "setObject:forKey:", hierarchy, _CPKeyedArchiverClassesKey);
                    classUID = objj_msgSend(self._plistObjects, "count");
                    objj_msgSend(self._plistObjects, "addObject:", plistClass);
                    objj_msgSend(self._UIDs, "setObject:forKey:", classUID, className);
                }
                objj_msgSend(plistObject, "setObject:forKey:", objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", classUID, _CPKeyedArchiverUIDKey), _CPKeyedArchiverClassKey);
            }
            UID = objj_msgSend(self._conditionalUIDs, "objectForKey:", GUID);
            if (UID !== nil)
            {
                objj_msgSend(self._UIDs, "setObject:forKey:", UID, GUID);
                objj_msgSend(self._plistObjects, "replaceObjectAtIndex:withObject:", UID, plistObject);
            }
            else
            {
                objj_msgSend(self._UIDs, "setObject:forKey:", UID = objj_msgSend(self._plistObjects, "count"), GUID);
                objj_msgSend(self._plistObjects, "addObject:", plistObject);
            }
        }
    }
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", UID, _CPKeyedArchiverUIDKey);
};
