@STATIC;1.0;i;9;CPArray.ji;9;CPCoder.ji;8;CPData.ji;14;CPDictionary.ji;13;CPException.ji;17;CPKeyedArchiver.ji;8;CPNull.ji;10;CPNumber.ji;10;CPString.jt;16318;objj_executeFile("CPArray.j", YES);objj_executeFile("CPCoder.j", YES);objj_executeFile("CPData.j", YES);objj_executeFile("CPDictionary.j", YES);objj_executeFile("CPException.j", YES);objj_executeFile("CPKeyedArchiver.j", YES);objj_executeFile("CPNull.j", YES);objj_executeFile("CPNumber.j", YES);objj_executeFile("CPString.j", YES);CPInvalidUnarchiveOperationException = "CPInvalidUnarchiveOperationException";
var _CPKeyedUnarchiverCannotDecodeObjectOfClassNameOriginalClassesSelector = 1 << 0,
    _CPKeyedUnarchiverDidDecodeObjectSelector = 1 << 1,
    _CPKeyedUnarchiverWillReplaceObjectWithObjectSelector = 1 << 2,
    _CPKeyedUnarchiverWillFinishSelector = 1 << 3,
    _CPKeyedUnarchiverDidFinishSelector = 1 << 4,
    CPKeyedUnarchiverDelegate_unarchiver_cannotDecodeObjectOfClassName_originalClasses_ = 1 << 5;
var _CPKeyedArchiverNullString = "$null",
    _CPKeyedArchiverUIDKey = "CP$UID",
    _CPKeyedArchiverTopKey = "$top",
    _CPKeyedArchiverObjectsKey = "$objects",
    _CPKeyedArchiverArchiverKey = "$archiver",
    _CPKeyedArchiverVersionKey = "$version",
    _CPKeyedArchiverClassNameKey = "$classname",
    _CPKeyedArchiverClassesKey = "$classes",
    _CPKeyedArchiverClassKey = "$class";
var CPArrayClass = Nil,
    CPMutableArrayClass = Nil,
    CPStringClass = Nil,
    CPDictionaryClass = Nil,
    CPMutableDictionaryClass = Nil,
    CPNumberClass = Nil,
    CPDataClass = Nil,
    _CPKeyedArchiverValueClass = Nil;
{var the_class = objj_allocateClassPair(CPCoder, "CPKeyedUnarchiver"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_delegate"), new objj_ivar("_delegateSelectors"), new objj_ivar("_data"), new objj_ivar("_replacementClasses"), new objj_ivar("_objects"), new objj_ivar("_archive"), new objj_ivar("_plistObject"), new objj_ivar("_plistObjects")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initForReadingWithData:"), function $CPKeyedUnarchiver__initForReadingWithData_(self, _cmd, data)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPKeyedUnarchiver").super_class }, "init");
    if (self)
    {
        self._archive = (data == null ? null : data.isa.objj_msgSend0(data, "plistObject"));
        self._objects = [CPNull.isa.objj_msgSend0(CPNull, "null")];
        self._plistObject = ((___r1 = self._archive), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", _CPKeyedArchiverTopKey));
        self._plistObjects = ((___r1 = self._archive), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", _CPKeyedArchiverObjectsKey));
        self._replacementClasses = new CFMutableDictionary();
    }
    return self;
    var ___r1;
}
,["id","CPData"]), new objj_method(sel_getUid("containsValueForKey:"), function $CPKeyedUnarchiver__containsValueForKey_(self, _cmd, aKey)
{
    return self._plistObject.valueForKey(aKey) != nil;
}
,["BOOL","CPString"]), new objj_method(sel_getUid("_decodeDictionaryOfObjectsForKey:"), function $CPKeyedUnarchiver___decodeDictionaryOfObjectsForKey_(self, _cmd, aKey)
{
    var object = self._plistObject.valueForKey(aKey),
        objectClass = object != nil && object.isa;
    if (objectClass === CPDictionaryClass || objectClass === CPMutableDictionaryClass)
    {
        var keys = object.keys(),
            index = 0,
            count = keys.length,
            dictionary = new CFMutableDictionary();
        for (; index < count; ++index)
        {
            var key = keys[index];
            dictionary.setValueForKey(key, _CPKeyedUnarchiverDecodeObjectAtIndex(self, (object.valueForKey(key)).valueForKey(_CPKeyedArchiverUIDKey)));
        }
        return dictionary;
    }
    return nil;
}
,["CPDictionary","CPString"]), new objj_method(sel_getUid("decodeBoolForKey:"), function $CPKeyedUnarchiver__decodeBoolForKey_(self, _cmd, aKey)
{
    return !!self.isa.objj_msgSend1(self, "decodeObjectForKey:", aKey);
}
,["BOOL","CPString"]), new objj_method(sel_getUid("decodeFloatForKey:"), function $CPKeyedUnarchiver__decodeFloatForKey_(self, _cmd, aKey)
{
    var f = self.isa.objj_msgSend1(self, "decodeObjectForKey:", aKey);
    return f === nil ? 0.0 : f;
}
,["float","CPString"]), new objj_method(sel_getUid("decodeDoubleForKey:"), function $CPKeyedUnarchiver__decodeDoubleForKey_(self, _cmd, aKey)
{
    var d = self.isa.objj_msgSend1(self, "decodeObjectForKey:", aKey);
    return d === nil ? 0.0 : d;
}
,["double","CPString"]), new objj_method(sel_getUid("decodeIntForKey:"), function $CPKeyedUnarchiver__decodeIntForKey_(self, _cmd, aKey)
{
    var i = self.isa.objj_msgSend1(self, "decodeObjectForKey:", aKey);
    return i === nil ? 0 : i;
}
,["int","CPString"]), new objj_method(sel_getUid("decodePointForKey:"), function $CPKeyedUnarchiver__decodePointForKey_(self, _cmd, aKey)
{
    var object = self.isa.objj_msgSend1(self, "decodeObjectForKey:", aKey);
    if (object)
        return CGPointFromString(object);
    else
        return CGPointMakeZero();
}
,["CGPoint","CPString"]), new objj_method(sel_getUid("decodeRectForKey:"), function $CPKeyedUnarchiver__decodeRectForKey_(self, _cmd, aKey)
{
    var object = self.isa.objj_msgSend1(self, "decodeObjectForKey:", aKey);
    if (object)
        return CGRectFromString(object);
    else
        return CGRectMakeZero();
}
,["CGRect","CPString"]), new objj_method(sel_getUid("decodeSizeForKey:"), function $CPKeyedUnarchiver__decodeSizeForKey_(self, _cmd, aKey)
{
    var object = self.isa.objj_msgSend1(self, "decodeObjectForKey:", aKey);
    if (object)
        return CGSizeFromString(object);
    else
        return CGSizeMakeZero();
}
,["CGSize","CPString"]), new objj_method(sel_getUid("decodeObjectForKey:"), function $CPKeyedUnarchiver__decodeObjectForKey_(self, _cmd, aKey)
{
    var object = self._plistObject.valueForKey(aKey),
        objectClass = object != nil && object.isa;
    if (objectClass === CPDictionaryClass || objectClass === CPMutableDictionaryClass)
        return _CPKeyedUnarchiverDecodeObjectAtIndex(self, object.valueForKey(_CPKeyedArchiverUIDKey));
    else if (objectClass === CPNumberClass || objectClass === CPDataClass || objectClass === CPStringClass)
        return object;
    else if (objectClass === _CPJavaScriptArray)
    {
        var index = 0,
            count = object.length,
            array = [];
        for (; index < count; ++index)
            array[index] = _CPKeyedUnarchiverDecodeObjectAtIndex(self, object[index].valueForKey(_CPKeyedArchiverUIDKey));
        return array;
    }
    return nil;
}
,["id","CPString"]), new objj_method(sel_getUid("decodeBytesForKey:"), function $CPKeyedUnarchiver__decodeBytesForKey_(self, _cmd, aKey)
{
    var data = self.isa.objj_msgSend1(self, "decodeObjectForKey:", aKey);
    if (!data)
        return nil;
    var objectClass = data.isa;
    if (objectClass === CPDataClass)
        return data.bytes();
    return nil;
}
,["id","CPString"]), new objj_method(sel_getUid("finishDecoding"), function $CPKeyedUnarchiver__finishDecoding(self, _cmd)
{
    if (self._delegateSelectors & _CPKeyedUnarchiverWillFinishSelector)
        ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "unarchiverWillFinish:", self));
    if (self._delegateSelectors & _CPKeyedUnarchiverDidFinishSelector)
        ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "unarchiverDidFinish:", self));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("delegate"), function $CPKeyedUnarchiver__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("setDelegate:"), function $CPKeyedUnarchiver__setDelegate_(self, _cmd, aDelegate)
{
    self._delegate = aDelegate;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("unarchiver:cannotDecodeObjectOfClassName:originalClasses:"))))
        self._delegateSelectors |= _CPKeyedUnarchiverCannotDecodeObjectOfClassNameOriginalClassesSelector;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("unarchiver:didDecodeObject:"))))
        self._delegateSelectors |= _CPKeyedUnarchiverDidDecodeObjectSelector;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("unarchiver:willReplaceObject:withObject:"))))
        self._delegateSelectors |= _CPKeyedUnarchiverWillReplaceObjectWithObjectSelector;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("unarchiverWillFinish:"))))
        self._delegateSelectors |= _CPKeyedUnarchiverWillFinishSelector;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("unarchiverDidFinish:"))))
        self._delegateSelectors |= _CPKeyedUnarchiverDidFinishSelector;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("unarchiver:cannotDecodeObjectOfClassName:originalClasses:"))))
        self._delegateSelectors |= CPKeyedUnarchiverDelegate_unarchiver_cannotDecodeObjectOfClassName_originalClasses_;
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("setClass:forClassName:"), function $CPKeyedUnarchiver__setClass_forClassName_(self, _cmd, aClass, aClassName)
{
    self._replacementClasses.setValueForKey(aClassName, aClass);
}
,["void","Class","CPString"]), new objj_method(sel_getUid("classForClassName:"), function $CPKeyedUnarchiver__classForClassName_(self, _cmd, aClassName)
{
    return self._replacementClasses.valueForKey(aClassName);
}
,["Class","CPString"]), new objj_method(sel_getUid("allowsKeyedCoding"), function $CPKeyedUnarchiver__allowsKeyedCoding(self, _cmd)
{
    return YES;
}
,["BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPKeyedUnarchiver__initialize(self, _cmd)
{
    if (self !== CPKeyedUnarchiver.isa.objj_msgSend0(CPKeyedUnarchiver, "class"))
        return;
    CPArrayClass = CPArray.isa.objj_msgSend0(CPArray, "class");
    CPMutableArrayClass = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "class");
    CPStringClass = CPString.isa.objj_msgSend0(CPString, "class");
    CPDictionaryClass = CPDictionary.isa.objj_msgSend0(CPDictionary, "class");
    CPMutableDictionaryClass = CPMutableDictionary.isa.objj_msgSend0(CPMutableDictionary, "class");
    CPNumberClass = CPNumber.isa.objj_msgSend0(CPNumber, "class");
    CPDataClass = CPData.isa.objj_msgSend0(CPData, "class");
    _CPKeyedArchiverValueClass = _CPKeyedArchiverValue.isa.objj_msgSend0(_CPKeyedArchiverValue, "class");
}
,["void"]), new objj_method(sel_getUid("unarchiveObjectWithData:"), function $CPKeyedUnarchiver__unarchiveObjectWithData_(self, _cmd, aData)
{
    if (!aData)
    {
        CPLog.error("Null data passed to -[CPKeyedUnarchiver unarchiveObjectWithData:].");
        return nil;
    }
    var unarchiver = ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initForReadingWithData:", aData)),
        object = (unarchiver == null ? null : unarchiver.isa.objj_msgSend1(unarchiver, "decodeObjectForKey:", "root"));
    (unarchiver == null ? null : unarchiver.isa.objj_msgSend0(unarchiver, "finishDecoding"));
    return object;
    var ___r1;
}
,["id","CPData"]), new objj_method(sel_getUid("unarchiveObjectWithFile:"), function $CPKeyedUnarchiver__unarchiveObjectWithFile_(self, _cmd, aFilePath)
{
}
,["id","CPString"]), new objj_method(sel_getUid("unarchiveObjectWithFile:asynchronously:"), function $CPKeyedUnarchiver__unarchiveObjectWithFile_asynchronously_(self, _cmd, aFilePath, aFlag)
{
}
,["id","CPString","BOOL"])]);
}var _CPKeyedUnarchiverDecodeObjectAtIndex = function(self, anIndex)
{
    var object = self._objects[anIndex];
    if (object)
    {
        if (object === self._objects[0])
            return nil;
    }
    else
    {
        var plistObject = self._plistObjects[anIndex],
            plistObjectClass = plistObject.isa;
        if (plistObjectClass === CPDictionaryClass || plistObjectClass === CPMutableDictionaryClass)
        {
            var plistClass = self._plistObjects[(plistObject.valueForKey(_CPKeyedArchiverClassKey)).valueForKey(_CPKeyedArchiverUIDKey)],
                className = plistClass.valueForKey(_CPKeyedArchiverClassNameKey),
                classes = plistClass.valueForKey(_CPKeyedArchiverClassesKey),
                theClass = (self == null ? null : self.isa.objj_msgSend1(self, "classForClassName:", className));
            if (!theClass)
                theClass = CPClassFromString(className);
            if (!theClass && self._delegateSelectors & CPKeyedUnarchiverDelegate_unarchiver_cannotDecodeObjectOfClassName_originalClasses_)
            {
                theClass = ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "unarchiver:cannotDecodeObjectOfClassName:originalClasses:", self, className, classes));
            }
            if (!theClass)
                CPException.isa.objj_msgSend3(CPException, "raise:format:", CPInvalidUnarchiveOperationException, "-[CPKeyedUnarchiver decodeObjectForKey:]: cannot decode object of class (%@)", className);
            var savedPlistObject = self._plistObject;
            self._plistObject = plistObject;
            object = (theClass == null ? null : theClass.isa.objj_msgSend1(theClass, "allocWithCoder:", self));
            self._objects[anIndex] = object;
            var processedObject = (object == null ? null : object.isa.objj_msgSend1(object, "initWithCoder:", self));
            self._plistObject = savedPlistObject;
            if (processedObject !== object)
            {
                if (self._delegateSelectors & _CPKeyedUnarchiverWillReplaceObjectWithObjectSelector)
                    ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "unarchiver:willReplaceObject:withObject:", self, object, processedObject));
                object = processedObject;
                self._objects[anIndex] = processedObject;
            }
            processedObject = (object == null ? null : object.isa.objj_msgSend1(object, "awakeAfterUsingCoder:", self));
            if (processedObject !== object)
            {
                if (self._delegateSelectors & _CPKeyedUnarchiverWillReplaceObjectWithObjectSelector)
                    ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "unarchiver:willReplaceObject:withObject:", self, object, processedObject));
                object = processedObject;
                self._objects[anIndex] = processedObject;
            }
            if (self._delegate)
            {
                if (self._delegateSelectors & _CPKeyedUnarchiverDidDecodeObjectSelector)
                    processedObject = ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "unarchiver:didDecodeObject:", self, object));
                if (processedObject && processedObject != object)
                {
                    if (self._delegateSelectors & _CPKeyedUnarchiverWillReplaceObjectWithObjectSelector)
                        ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "unarchiver:willReplaceObject:withObject:", self, object, processedObject));
                    object = processedObject;
                    self._objects[anIndex] = processedObject;
                }
            }
        }
        else
        {
            self._objects[anIndex] = object = plistObject;
            if ((object == null ? null : object.isa.objj_msgSend0(object, "class")) === CPStringClass)
            {
                if (object === _CPKeyedArchiverNullString)
                {
                    self._objects[anIndex] = self._objects[0];
                    return nil;
                }
                else
                    self._objects[anIndex] = object = plistObject;
            }
        }
    }
    if (object != nil && object.isa === _CPKeyedArchiverValueClass)
        object = (object == null ? null : object.isa.objj_msgSend0(object, "JSObject"));
    return object;
    var ___r1;
};
