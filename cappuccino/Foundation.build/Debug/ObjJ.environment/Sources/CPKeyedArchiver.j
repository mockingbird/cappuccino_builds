@STATIC;1.0;i;9;CPArray.ji;9;CPCoder.ji;8;CPData.ji;14;CPDictionary.ji;10;CPNumber.ji;10;CPString.ji;9;CPValue.ji;13;_CGGeometry.jt;21077;objj_executeFile("CPArray.j", YES);objj_executeFile("CPCoder.j", YES);objj_executeFile("CPData.j", YES);objj_executeFile("CPDictionary.j", YES);objj_executeFile("CPNumber.j", YES);objj_executeFile("CPString.j", YES);objj_executeFile("CPValue.j", YES);objj_executeFile("_CGGeometry.j", YES);var CPArchiverReplacementClassNames = nil;
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
        self._plistObjects = CPArray.isa.objj_msgSend1(CPArray, "arrayWithObject:", _CPKeyedArchiverNullString);
    }
    return self;
}
,["id","CPMutableData"]), new objj_method(sel_getUid("finishEncoding"), function $CPKeyedArchiver__finishEncoding(self, _cmd)
{
    if (self._delegate && self._delegateSelectors & _CPKeyedArchiverDidFinishEncodingSelector)
        ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "archiverWillFinish:", self));
    var i = 0,
        topObject = self._plistObject,
        classes = [];
    for (; i < self._objects.length; ++i)
    {
        var object = self._objects[i];
        self._plistObject = self._plistObjects[((___r1 = self._UIDs), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", (object == null ? null : object.isa.objj_msgSend0(object, "UID"))))];
        (object == null ? null : object.isa.objj_msgSend1(object, "encodeWithCoder:", self));
        if (self._delegate && self._delegateSelectors & _CPKeyedArchiverDidEncodeObjectSelector)
            ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "archiver:didEncodeObject:", self, object));
    }
    self._plistObject = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    ((___r1 = self._plistObject), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", topObject, _CPKeyedArchiverTopKey));
    ((___r1 = self._plistObject), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", self._plistObjects, _CPKeyedArchiverObjectsKey));
    ((___r1 = self._plistObject), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", self.isa.objj_msgSend0(self, "className"), _CPKeyedArchiverArchiverKey));
    ((___r1 = self._plistObject), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", "100000", _CPKeyedArchiverVersionKey));
    ((___r1 = self._data), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setPlistObject:", self._plistObject));
    if (self._delegate && self._delegateSelectors & _CPKeyedArchiverDidFinishEncodingSelector)
        ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "archiverDidFinish:", self));
    var ___r1;
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
    ((___r1 = self._plistObject), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, aBOOL, NO), aKey));
    var ___r1;
}
,["void","BOOL","CPString"]), new objj_method(sel_getUid("encodeDouble:forKey:"), function $CPKeyedArchiver__encodeDouble_forKey_(self, _cmd, aDouble, aKey)
{
    ((___r1 = self._plistObject), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, aDouble, NO), aKey));
    var ___r1;
}
,["void","double","CPString"]), new objj_method(sel_getUid("encodeFloat:forKey:"), function $CPKeyedArchiver__encodeFloat_forKey_(self, _cmd, aFloat, aKey)
{
    ((___r1 = self._plistObject), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, aFloat, NO), aKey));
    var ___r1;
}
,["void","float","CPString"]), new objj_method(sel_getUid("encodeInt:forKey:"), function $CPKeyedArchiver__encodeInt_forKey_(self, _cmd, anInt, aKey)
{
    ((___r1 = self._plistObject), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, anInt, NO), aKey));
    var ___r1;
}
,["void","float","CPString"]), new objj_method(sel_getUid("setDelegate:"), function $CPKeyedArchiver__setDelegate_(self, _cmd, aDelegate)
{
    self._delegate = aDelegate;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("archiver:didEncodeObject:"))))
        self._delegateSelectors |= _CPKeyedArchiverDidEncodeObjectSelector;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("archiver:willEncodeObject:"))))
        self._delegateSelectors |= _CPKeyedArchiverWillEncodeObjectSelector;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("archiver:willReplaceObject:withObject:"))))
        self._delegateSelectors |= _CPKeyedArchiverWillReplaceObjectWithObjectSelector;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("archiver:didFinishEncoding:"))))
        self._delegateSelectors |= _CPKeyedArchiverDidFinishEncodingSelector;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("archiver:willFinishEncoding:"))))
        self._delegateSelectors |= _CPKeyedArchiverWillFinishEncodingSelector;
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("delegate"), function $CPKeyedArchiver__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("encodePoint:forKey:"), function $CPKeyedArchiver__encodePoint_forKey_(self, _cmd, aPoint, aKey)
{
    ((___r1 = self._plistObject), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, CGStringFromPoint(aPoint), NO), aKey));
    var ___r1;
}
,["void","CGPoint","CPString"]), new objj_method(sel_getUid("encodeRect:forKey:"), function $CPKeyedArchiver__encodeRect_forKey_(self, _cmd, aRect, aKey)
{
    ((___r1 = self._plistObject), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, CGStringFromRect(aRect), NO), aKey));
    var ___r1;
}
,["void","CGRect","CPString"]), new objj_method(sel_getUid("encodeSize:forKey:"), function $CPKeyedArchiver__encodeSize_forKey_(self, _cmd, aSize, aKey)
{
    ((___r1 = self._plistObject), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, CGStringFromSize(aSize), NO), aKey));
    var ___r1;
}
,["void","CGSize","CPString"]), new objj_method(sel_getUid("encodeConditionalObject:forKey:"), function $CPKeyedArchiver__encodeConditionalObject_forKey_(self, _cmd, anObject, aKey)
{
    ((___r1 = self._plistObject), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, anObject, YES), aKey));
    var ___r1;
}
,["void","id","CPString"]), new objj_method(sel_getUid("encodeNumber:forKey:"), function $CPKeyedArchiver__encodeNumber_forKey_(self, _cmd, aNumber, aKey)
{
    ((___r1 = self._plistObject), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, aNumber, NO), aKey));
    var ___r1;
}
,["void","CPNumber","CPString"]), new objj_method(sel_getUid("encodeObject:forKey:"), function $CPKeyedArchiver__encodeObject_forKey_(self, _cmd, anObject, aKey)
{
    ((___r1 = self._plistObject), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, anObject, NO), aKey));
    var ___r1;
}
,["void","id","CPString"]), new objj_method(sel_getUid("_encodeArrayOfObjects:forKey:"), function $CPKeyedArchiver___encodeArrayOfObjects_forKey_(self, _cmd, objects, aKey)
{
    var i = 0,
        count = objects.length,
        references = [];
    for (; i < count; ++i)
        (references == null ? null : references.isa.objj_msgSend1(references, "addObject:", _CPKeyedArchiverEncodeObject(self, objects[i], NO)));
    ((___r1 = self._plistObject), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", references, aKey));
    var ___r1;
}
,["void","CPArray","CPString"]), new objj_method(sel_getUid("_encodeDictionaryOfObjects:forKey:"), function $CPKeyedArchiver___encodeDictionaryOfObjects_forKey_(self, _cmd, aDictionary, aKey)
{
    var key,
        keys = (aDictionary == null ? null : aDictionary.isa.objj_msgSend0(aDictionary, "keyEnumerator")),
        references = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    while ((key = (keys == null ? null : keys.isa.objj_msgSend0(keys, "nextObject"))) !== nil)
        (references == null ? null : references.isa.objj_msgSend2(references, "setObject:forKey:", _CPKeyedArchiverEncodeObject(self, (aDictionary == null ? null : aDictionary.isa.objj_msgSend1(aDictionary, "objectForKey:", key)), NO), key));
    ((___r1 = self._plistObject), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", references, aKey));
    var ___r1;
}
,["void","CPDictionary","CPString"]), new objj_method(sel_getUid("setClassName:forClass:"), function $CPKeyedArchiver__setClassName_forClass_(self, _cmd, aClassName, aClass)
{
    if (!self._replacementClassNames)
        self._replacementClassNames = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    ((___r1 = self._replacementClassNames), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", aClassName, CPStringFromClass(aClass)));
    var ___r1;
}
,["void","CPString","Class"]), new objj_method(sel_getUid("classNameForClass:"), function $CPKeyedArchiver__classNameForClass_(self, _cmd, aClass)
{
    if (!self._replacementClassNames)
        return aClass.name;
    var className = ((___r1 = self._replacementClassNames), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPStringFromClass(aClass)));
    return className ? className : aClass.name;
    var ___r1;
}
,["CPString","Class"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPKeyedArchiver__initialize(self, _cmd)
{
    if (self !== CPKeyedArchiver.isa.objj_msgSend0(CPKeyedArchiver, "class"))
        return;
    _CPKeyedArchiverStringClass = CPString.isa.objj_msgSend0(CPString, "class");
    _CPKeyedArchiverNumberClass = CPNumber.isa.objj_msgSend0(CPNumber, "class");
    _CPKeyedArchiverNullReference = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", 0, _CPKeyedArchiverUIDKey);
}
,["void"]), new objj_method(sel_getUid("allowsKeyedCoding"), function $CPKeyedArchiver__allowsKeyedCoding(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("archivedDataWithRootObject:"), function $CPKeyedArchiver__archivedDataWithRootObject_(self, _cmd, anObject)
{
    var data = CPData.isa.objj_msgSend1(CPData, "dataWithPlistObject:", nil),
        archiver = ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initForWritingWithMutableData:", data));
    (archiver == null ? null : archiver.isa.objj_msgSend2(archiver, "encodeObject:forKey:", anObject, "root"));
    (archiver == null ? null : archiver.isa.objj_msgSend0(archiver, "finishEncoding"));
    return data;
    var ___r1;
}
,["CPData","id"]), new objj_method(sel_getUid("setClassName:forClass:"), function $CPKeyedArchiver__setClassName_forClass_(self, _cmd, aClassName, aClass)
{
    if (!CPArchiverReplacementClassNames)
        CPArchiverReplacementClassNames = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    (CPArchiverReplacementClassNames == null ? null : CPArchiverReplacementClassNames.isa.objj_msgSend2(CPArchiverReplacementClassNames, "setObject:forKey:", aClassName, CPStringFromClass(aClass)));
}
,["void","CPString","Class"]), new objj_method(sel_getUid("classNameForClass:"), function $CPKeyedArchiver__classNameForClass_(self, _cmd, aClass)
{
    if (!CPArchiverReplacementClassNames)
        return aClass.name;
    var className = (CPArchiverReplacementClassNames == null ? null : CPArchiverReplacementClassNames.isa.objj_msgSend1(CPArchiverReplacementClassNames, "objectForKey:", CPStringFromClass(aClass)));
    return className ? className : aClass.name;
}
,["CPString","Class"])]);
}var _CPKeyedArchiverEncodeObject = function(self, anObject, isConditional)
{
    if (anObject !== nil && anObject !== undefined && !anObject.isa)
        anObject = _CPKeyedArchiverValue.isa.objj_msgSend1(_CPKeyedArchiverValue, "valueWithJSObject:", anObject);
    var GUID = (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "UID")),
        object = ((___r1 = self._replacementObjects), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", GUID));
    if (object === nil)
    {
        object = (anObject == null ? null : anObject.isa.objj_msgSend1(anObject, "replacementObjectForKeyedArchiver:", self));
        if (self._delegate)
        {
            if (object !== anObject && self._delegateSelectors & _CPKeyedArchiverWillReplaceObjectWithObjectSelector)
                ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "archiver:willReplaceObject:withObject:", self, anObject, object));
            if (self._delegateSelectors & _CPKeyedArchiverWillEncodeObjectSelector)
            {
                anObject = ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "archiver:willEncodeObject:", self, object));
                if (anObject !== object && self._delegateSelectors & _CPKeyedArchiverWillReplaceObjectWithObjectSelector)
                    ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "archiver:willReplaceObject:withObject:", self, object, anObject));
                object = anObject;
            }
        }
        if (object != nil && GUID != nil)
            ((___r1 = self._replacementObjects), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", object, GUID));
    }
    if (object === nil)
        return _CPKeyedArchiverNullReference;
    var UID = ((___r1 = self._UIDs), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", GUID = (object == null ? null : object.isa.objj_msgSend0(object, "UID"))));
    if (UID === nil)
    {
        if (isConditional)
        {
            if ((UID = ((___r1 = self._conditionalUIDs), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", GUID))) === nil)
            {
                ((___r1 = self._conditionalUIDs), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", UID = ((___r2 = self._plistObjects), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "count")), GUID));
                ((___r1 = self._plistObjects), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", _CPKeyedArchiverNullString));
            }
        }
        else
        {
            var theClass = (object == null ? null : object.isa.objj_msgSend0(object, "classForKeyedArchiver")),
                plistObject = nil;
            if (theClass === _CPKeyedArchiverStringClass || theClass === _CPKeyedArchiverNumberClass)
                plistObject = object;
            else
            {
                plistObject = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
                ((___r1 = self._objects), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", object));
                var className = (self == null ? null : self.isa.objj_msgSend1(self, "classNameForClass:", theClass));
                if (!className)
                    className = ((___r1 = (self == null ? null : self.isa.objj_msgSend0(self, "class"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "classNameForClass:", theClass));
                if (!className)
                    className = theClass.name;
                else
                    theClass = CPClassFromString(className);
                var classUID = ((___r1 = self._UIDs), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", className));
                if (!classUID)
                {
                    var plistClass = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init"),
                        hierarchy = [];
                    (plistClass == null ? null : plistClass.isa.objj_msgSend2(plistClass, "setObject:forKey:", className, _CPKeyedArchiverClassNameKey));
                    do
                    {
                        (hierarchy == null ? null : hierarchy.isa.objj_msgSend1(hierarchy, "addObject:", CPStringFromClass(theClass)));
                    }
                    while (theClass = (theClass == null ? null : theClass.isa.objj_msgSend0(theClass, "superclass")));
                    (plistClass == null ? null : plistClass.isa.objj_msgSend2(plistClass, "setObject:forKey:", hierarchy, _CPKeyedArchiverClassesKey));
                    classUID = ((___r1 = self._plistObjects), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
                    ((___r1 = self._plistObjects), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", plistClass));
                    ((___r1 = self._UIDs), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", classUID, className));
                }
                (plistObject == null ? null : plistObject.isa.objj_msgSend2(plistObject, "setObject:forKey:", objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", classUID, _CPKeyedArchiverUIDKey), _CPKeyedArchiverClassKey));
            }
            UID = ((___r1 = self._conditionalUIDs), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", GUID));
            if (UID !== nil)
            {
                ((___r1 = self._UIDs), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", UID, GUID));
                ((___r1 = self._plistObjects), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "replaceObjectAtIndex:withObject:", UID, plistObject));
            }
            else
            {
                ((___r1 = self._UIDs), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", UID = ((___r2 = self._plistObjects), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "count")), GUID));
                ((___r1 = self._plistObjects), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", plistObject));
            }
        }
    }
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", UID, _CPKeyedArchiverUIDKey);
    var ___r1, ___r2;
};
