@STATIC;1.0;I;21;Foundation/CPObject.jI;28;Foundation/CPURLConnection.jI;25;Foundation/CPURLRequest.ji;20;_CPCibClassSwapper.ji;20;_CPCibCustomObject.ji;22;_CPCibCustomResource.ji;18;_CPCibCustomView.ji;23;_CPCibKeyedUnarchiver.ji;18;_CPCibObjectData.ji;19;_CPCibProxyObject.ji;22;_CPCibWindowTemplate.jt;10061;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPURLConnection.j", NO);objj_executeFile("Foundation/CPURLRequest.j", NO);objj_executeFile("_CPCibClassSwapper.j", YES);objj_executeFile("_CPCibCustomObject.j", YES);objj_executeFile("_CPCibCustomResource.j", YES);objj_executeFile("_CPCibCustomView.j", YES);objj_executeFile("_CPCibKeyedUnarchiver.j", YES);objj_executeFile("_CPCibObjectData.j", YES);objj_executeFile("_CPCibProxyObject.j", YES);objj_executeFile("_CPCibWindowTemplate.j", YES);CPCibOwner = "CPCibOwner";
CPCibTopLevelObjects = "CPCibTopLevelObjects";
CPCibReplacementClasses = "CPCibReplacementClasses";
CPCibExternalObjects = "CPCibExternalObjects";
var CPCibObjectDataKey = "CPCibObjectDataKey";
{var the_class = objj_allocateClassPair(CPObject, "CPCib"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_data"), new objj_ivar("_bundle"), new objj_ivar("_awakenCustomResources"), new objj_ivar("_loadDelegate")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentsOfURL:"), function $CPCib__initWithContentsOfURL_(self, _cmd, aURL)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCib").super_class }, "init");
    if (self)
    {
        self._data = CPURLConnection.isa.objj_msgSend2(CPURLConnection, "sendSynchronousRequest:returningResponse:", CPURLRequest.isa.objj_msgSend1(CPURLRequest, "requestWithURL:", aURL), nil);
        if (!self._data)
            return nil;
        self._awakenCustomResources = YES;
    }
    return self;
}
,["id","CPURL"]), new objj_method(sel_getUid("initWithContentsOfURL:loadDelegate:"), function $CPCib__initWithContentsOfURL_loadDelegate_(self, _cmd, aURL, aLoadDelegate)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCib").super_class }, "init");
    if (self)
    {
        CPURLConnection.isa.objj_msgSend2(CPURLConnection, "connectionWithRequest:delegate:", CPURLRequest.isa.objj_msgSend1(CPURLRequest, "requestWithURL:", aURL), self);
        self._awakenCustomResources = YES;
        self._loadDelegate = aLoadDelegate;
    }
    return self;
}
,["id","CPURL","id"]), new objj_method(sel_getUid("initWithCibNamed:bundle:"), function $CPCib__initWithCibNamed_bundle_(self, _cmd, aName, aBundle)
{
    if (!(aName == null ? null : aName.isa.objj_msgSend1(aName, "hasSuffix:", ".cib")))
        aName = (aName == null ? null : aName.isa.objj_msgSend1(aName, "stringByAppendingString:", ".cib"));
    self = (self == null ? null : self.isa.objj_msgSend1(self, "initWithContentsOfURL:", ((___r1 = aBundle || CPBundle.isa.objj_msgSend0(CPBundle, "mainBundle")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "pathForResource:", aName))));
    if (self)
        self._bundle = aBundle;
    return self;
    var ___r1;
}
,["id","CPString","CPBundle"]), new objj_method(sel_getUid("initWithCibNamed:bundle:loadDelegate:"), function $CPCib__initWithCibNamed_bundle_loadDelegate_(self, _cmd, aName, aBundle, aLoadDelegate)
{
    if (!(aName == null ? null : aName.isa.objj_msgSend1(aName, "hasSuffix:", ".cib")))
        aName = (aName == null ? null : aName.isa.objj_msgSend1(aName, "stringByAppendingString:", ".cib"));
    self = (self == null ? null : self.isa.objj_msgSend2(self, "initWithContentsOfURL:loadDelegate:", ((___r1 = aBundle || CPBundle.isa.objj_msgSend0(CPBundle, "mainBundle")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "pathForResource:", aName)), aLoadDelegate));
    if (self)
        self._bundle = aBundle;
    return self;
    var ___r1;
}
,["id","CPString","CPBundle","id"]), new objj_method(sel_getUid("_setAwakenCustomResources:"), function $CPCib___setAwakenCustomResources_(self, _cmd, shouldAwakenCustomResources)
{
    self._awakenCustomResources = shouldAwakenCustomResources;
}
,["void","BOOL"]), new objj_method(sel_getUid("_awakenCustomResources"), function $CPCib___awakenCustomResources(self, _cmd)
{
    return self._awakenCustomResources;
}
,["BOOL"]), new objj_method(sel_getUid("instantiateCibWithExternalNameTable:"), function $CPCib__instantiateCibWithExternalNameTable_(self, _cmd, anExternalNameTable)
{
    var bundle = self._bundle,
        owner = (anExternalNameTable == null ? null : anExternalNameTable.isa.objj_msgSend1(anExternalNameTable, "objectForKey:", CPCibOwner));
    if (!bundle && owner)
        bundle = CPBundle.isa.objj_msgSend1(CPBundle, "bundleForClass:", (owner == null ? null : owner.isa.objj_msgSend0(owner, "class")));
    var unarchiver = ((___r1 = _CPCibKeyedUnarchiver.isa.objj_msgSend0(_CPCibKeyedUnarchiver, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initForReadingWithData:bundle:awakenCustomResources:", self._data, bundle, self._awakenCustomResources)),
        replacementClasses = (anExternalNameTable == null ? null : anExternalNameTable.isa.objj_msgSend1(anExternalNameTable, "objectForKey:", CPCibReplacementClasses));
    if (replacementClasses)
    {
        var key = nil,
            keyEnumerator = (replacementClasses == null ? null : replacementClasses.isa.objj_msgSend0(replacementClasses, "keyEnumerator"));
        while ((key = (keyEnumerator == null ? null : keyEnumerator.isa.objj_msgSend0(keyEnumerator, "nextObject"))) !== nil)
            (unarchiver == null ? null : unarchiver.isa.objj_msgSend2(unarchiver, "setClass:forClassName:", (replacementClasses == null ? null : replacementClasses.isa.objj_msgSend1(replacementClasses, "objectForKey:", key)), key));
    }
    (unarchiver == null ? null : unarchiver.isa.objj_msgSend1(unarchiver, "setExternalObjectsForProxyIdentifiers:", (anExternalNameTable == null ? null : anExternalNameTable.isa.objj_msgSend1(anExternalNameTable, "objectForKey:", CPCibExternalObjects))));
    var objectData = (unarchiver == null ? null : unarchiver.isa.objj_msgSend1(unarchiver, "decodeObjectForKey:", CPCibObjectDataKey));
    if (!objectData || !(objectData == null ? null : objectData.isa.objj_msgSend1(objectData, "isKindOfClass:", _CPCibObjectData.isa.objj_msgSend0(_CPCibObjectData, "class"))))
        return NO;
    var topLevelObjects = (anExternalNameTable == null ? null : anExternalNameTable.isa.objj_msgSend1(anExternalNameTable, "objectForKey:", CPCibTopLevelObjects));
    (objectData == null ? null : objectData.isa.objj_msgSend2(objectData, "instantiateWithOwner:topLevelObjects:", owner, topLevelObjects));
    (objectData == null ? null : objectData.isa.objj_msgSend2(objectData, "establishConnectionsWithOwner:topLevelObjects:", owner, topLevelObjects));
    (objectData == null ? null : objectData.isa.objj_msgSend2(objectData, "awakeWithOwner:topLevelObjects:", owner, topLevelObjects));
    (objectData == null ? null : objectData.isa.objj_msgSend0(objectData, "displayVisibleWindows"));
    return YES;
    var ___r1;
}
,["BOOL","CPDictionary"]), new objj_method(sel_getUid("instantiateCibWithOwner:topLevelObjects:"), function $CPCib__instantiateCibWithOwner_topLevelObjects_(self, _cmd, anOwner, topLevelObjects)
{
    var nameTable = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", topLevelObjects, CPCibTopLevelObjects);
    if (anOwner)
        (nameTable == null ? null : nameTable.isa.objj_msgSend2(nameTable, "setObject:forKey:", anOwner, CPCibOwner));
    return self.isa.objj_msgSend1(self, "instantiateCibWithExternalNameTable:", nameTable);
}
,["BOOL","id","CPArray"])]);
}{
var the_class = objj_getClass("CPCib")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPCib\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("connection:didReceiveData:"), function $CPCib__connection_didReceiveData_(self, _cmd, aConnection, data)
{
    if (!data)
        return self.isa.objj_msgSend2(self, "connection:didFailWithError:", aConnection, nil);
    self._data = CPData.isa.objj_msgSend1(CPData, "dataWithRawString:", data);
}
,["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $CPCib__connection_didFailWithError_(self, _cmd, aConnection, anError)
{
    if (((___r1 = self._loadDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("cibDidFailToLoad:"))))
        ((___r1 = self._loadDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "cibDidFailToLoad:", self));
    self._loadDelegate = nil;
    var ___r1;
}
,["void","CPURLConnection","CPError"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $CPCib__connectionDidFinishLoading_(self, _cmd, aConnection)
{
    if (((___r1 = self._loadDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("cibDidFinishLoading:"))))
        ((___r1 = self._loadDelegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "cibDidFinishLoading:", self));
    self._loadDelegate = nil;
    var ___r1;
}
,["void","CPURLConnection"])]);
}var CPCibDataFileKey = "CPCibDataFileKey",
    CPCibBundleIdentifierKey = "CPCibBundleIdentifierKey";
{
var the_class = objj_getClass("CPCib")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPCib\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPCib__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCib").super_class }, "init");
    var base64 = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPCibDataFileKey));
    self._data = CPData.isa.objj_msgSend1(CPData, "dataWithBase64:", base64);
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPCib__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", ((___r1 = self._data), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "base64")), CPCibDataFileKey));
    var ___r1;
}
,["void","CPCoder"])]);
}