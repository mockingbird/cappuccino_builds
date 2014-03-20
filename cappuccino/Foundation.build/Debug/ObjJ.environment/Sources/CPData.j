@STATIC;1.0;i;10;CPObject.ji;10;CPString.jt;6542;objj_executeFile("CPObject.j", YES);objj_executeFile("CPString.j", YES);{var the_class = objj_allocateClassPair(CPObject, "CPData"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithRawString:"), function $CPData__initWithRawString_(self, _cmd, aString)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPData").super_class }, "init");
    if (self)
        objj_msgSend(self, "setRawString:", aString);
    return self;
}
,["id","CPString"]), new objj_method(sel_getUid("initWithPlistObject:"), function $CPData__initWithPlistObject_(self, _cmd, aPlistObject)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPData").super_class }, "init");
    if (self)
        objj_msgSend(self, "setPlistObject:", aPlistObject);
    return self;
}
,["id","id"]), new objj_method(sel_getUid("initWithPlistObject:format:"), function $CPData__initWithPlistObject_format_(self, _cmd, aPlistObject, aFormat)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPData").super_class }, "init");
    if (self)
        objj_msgSend(self, "setPlistObject:format:", aPlistObject, aFormat);
    return self;
}
,["id","id","id"]), new objj_method(sel_getUid("initWithJSONObject:"), function $CPData__initWithJSONObject_(self, _cmd, anObject)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPData").super_class }, "init");
    if (self)
        objj_msgSend(self, "setJSONObject:", anObject);
    return self;
}
,["id","Object"]), new objj_method(sel_getUid("rawString"), function $CPData__rawString(self, _cmd)
{
    return self.rawString();
}
,["CPString"]), new objj_method(sel_getUid("plistObject"), function $CPData__plistObject(self, _cmd)
{
    return self.propertyList();
}
,["id"]), new objj_method(sel_getUid("JSONObject"), function $CPData__JSONObject(self, _cmd)
{
    return self.JSONObject();
}
,["Object"]), new objj_method(sel_getUid("bytes"), function $CPData__bytes(self, _cmd)
{
    return self.bytes();
}
,["CPArray"]), new objj_method(sel_getUid("base64"), function $CPData__base64(self, _cmd)
{
    return self.base64();
}
,["CPString"]), new objj_method(sel_getUid("length"), function $CPData__length(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self, "rawString"), "length");
}
,["int"]), new objj_method(sel_getUid("description"), function $CPData__description(self, _cmd)
{
    return self.toString();
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function $CPData__alloc(self, _cmd)
{
    var result = new CFMutableData();
    result.isa = objj_msgSend(self, "class");
    return result;
}
,["id"]), new objj_method(sel_getUid("data"), function $CPData__data(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
,["CPData"]), new objj_method(sel_getUid("dataWithRawString:"), function $CPData__dataWithRawString_(self, _cmd, aString)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithRawString:", aString);
}
,["CPData","CPString"]), new objj_method(sel_getUid("dataWithPlistObject:"), function $CPData__dataWithPlistObject_(self, _cmd, aPlistObject)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithPlistObject:", aPlistObject);
}
,["CPData","id"]), new objj_method(sel_getUid("dataWithPlistObject:format:"), function $CPData__dataWithPlistObject_format_(self, _cmd, aPlistObject, aFormat)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithPlistObject:format:", aPlistObject, aFormat);
}
,["CPData","id","CPPropertyListFormat"]), new objj_method(sel_getUid("dataWithJSONObject:"), function $CPData__dataWithJSONObject_(self, _cmd, anObject)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithJSONObject:", anObject);
}
,["CPData","Object"]), new objj_method(sel_getUid("dataWithBytes:"), function $CPData__dataWithBytes_(self, _cmd, bytesArray)
{
    var data = objj_msgSend(objj_msgSend(self, "alloc"), "init");
    data.setBytes(bytesArray);
    return data;
}
,["CPData","CPArray"]), new objj_method(sel_getUid("dataWithBase64:"), function $CPData__dataWithBase64_(self, _cmd, aString)
{
    var data = objj_msgSend(objj_msgSend(self, "alloc"), "init");
    data.setBase64String(aString);
    return data;
}
,["CPData","CPString"])]);
}{
var the_class = objj_getClass("CPData")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPData\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setRawString:"), function $CPData__setRawString_(self, _cmd, aString)
{
    self.setRawString(aString);
}
,["void","CPString"]), new objj_method(sel_getUid("setPlistObject:"), function $CPData__setPlistObject_(self, _cmd, aPlistObject)
{
    self.setPropertyList(aPlistObject);
}
,["void","id"]), new objj_method(sel_getUid("setPlistObject:format:"), function $CPData__setPlistObject_format_(self, _cmd, aPlistObject, aFormat)
{
    self.setPropertyList(aPlistObject, aFormat);
}
,["void","id","CPPropertyListFormat"]), new objj_method(sel_getUid("setJSONObject:"), function $CPData__setJSONObject_(self, _cmd, anObject)
{
    self.setJSONObject(anObject);
}
,["void","Object"])]);
}{
var the_class = objj_getClass("CPData")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPData\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithString:"), function $CPData__initWithString_(self, _cmd, aString)
{
    _CPReportLenientDeprecation(self, _cmd, sel_getUid("initWithRawString:"));
    return objj_msgSend(self, "initWithRawString:", aString);
}
,["id","CPString"]), new objj_method(sel_getUid("setString:"), function $CPData__setString_(self, _cmd, aString)
{
    _CPReportLenientDeprecation(self, _cmd, sel_getUid("setRawString:"));
    objj_msgSend(self, "setRawString:", aString);
}
,["void","CPString"]), new objj_method(sel_getUid("string"), function $CPData__string(self, _cmd)
{
    _CPReportLenientDeprecation(self, _cmd, sel_getUid("rawString"));
    return objj_msgSend(self, "rawString");
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("dataWithString:"), function $CPData__dataWithString_(self, _cmd, aString)
{
    _CPReportLenientDeprecation(self, _cmd, sel_getUid("dataWithRawString:"));
    return objj_msgSend(self, "dataWithRawString:", aString);
}
,["id","CPString"])]);
}CFData.prototype.isa = CPData;
CFMutableData.prototype.isa = CPData;
