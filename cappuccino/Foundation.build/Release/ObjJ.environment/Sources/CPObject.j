@STATIC;1.0;t;11710;{var the_class = objj_allocateClassPair(Nil, "CPObject"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("isa")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPObject__init(self, _cmd)
{
    return self;
}
,["id"]), new objj_method(sel_getUid("copy"), function $CPObject__copy(self, _cmd)
{
    return self;
}
,["id"]), new objj_method(sel_getUid("mutableCopy"), function $CPObject__mutableCopy(self, _cmd)
{
    return objj_msgSend(self, "copy");
}
,["id"]), new objj_method(sel_getUid("dealloc"), function $CPObject__dealloc(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("class"), function $CPObject__class(self, _cmd)
{
    return self.isa;
}
,["Class"]), new objj_method(sel_getUid("isKindOfClass:"), function $CPObject__isKindOfClass_(self, _cmd, aClass)
{
    return objj_msgSend(self.isa, "isSubclassOfClass:", aClass);
}
,["BOOL","Class"]), new objj_method(sel_getUid("isMemberOfClass:"), function $CPObject__isMemberOfClass_(self, _cmd, aClass)
{
    return self.isa === aClass;
}
,["BOOL","Class"]), new objj_method(sel_getUid("isProxy"), function $CPObject__isProxy(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("respondsToSelector:"), function $CPObject__respondsToSelector_(self, _cmd, aSelector)
{
    return !!class_getInstanceMethod(self.isa, aSelector);
}
,["BOOL","SEL"]), new objj_method(sel_getUid("implementsSelector:"), function $CPObject__implementsSelector_(self, _cmd, aSelector)
{
    var methods = class_copyMethodList(self.isa),
        count = methods.length;
    while (count--)
        if (method_getName(methods[count]) === aSelector)
            return YES;
    return NO;
}
,["BOOL","SEL"]), new objj_method(sel_getUid("methodForSelector:"), function $CPObject__methodForSelector_(self, _cmd, aSelector)
{
    return class_getMethodImplementation(self.isa, aSelector);
}
,["IMP","SEL"]), new objj_method(sel_getUid("methodSignatureForSelector:"), function $CPObject__methodSignatureForSelector_(self, _cmd, aSelector)
{
    return nil;
}
,["CPMethodSignature","SEL"]), new objj_method(sel_getUid("description"), function $CPObject__description(self, _cmd)
{
    return "<" + class_getName(self.isa) + " 0x" + objj_msgSend(CPString, "stringWithHash:", objj_msgSend(self, "UID")) + ">";
}
,["CPString"]), new objj_method(sel_getUid("performSelector:"), function $CPObject__performSelector_(self, _cmd, aSelector)
{
    return objj_msgSend(self, aSelector);
}
,["id","SEL"]), new objj_method(sel_getUid("performSelector:withObject:"), function $CPObject__performSelector_withObject_(self, _cmd, aSelector, anObject)
{
    return objj_msgSend(self, aSelector, anObject);
}
,["id","SEL","id"]), new objj_method(sel_getUid("performSelector:withObject:withObject:"), function $CPObject__performSelector_withObject_withObject_(self, _cmd, aSelector, anObject, anotherObject)
{
    return objj_msgSend(self, aSelector, anObject, anotherObject);
}
,["id","SEL","id","id"]), new objj_method(sel_getUid("performSelector:withObjects:"), function $CPObject__performSelector_withObjects_(self, _cmd, aSelector, anObject)
{
    var params = [self, aSelector].concat(Array.prototype.slice.apply(arguments, [3]));
    return objj_msgSend.apply(this, params);
}
,["id","SEL","id"]), new objj_method(sel_getUid("forwardingTargetForSelector:"), function $CPObject__forwardingTargetForSelector_(self, _cmd, aSelector)
{
    return nil;
}
,["id","SEL"]), new objj_method(sel_getUid("forwardInvocation:"), function $CPObject__forwardInvocation_(self, _cmd, anInvocation)
{
    objj_msgSend(self, "doesNotRecognizeSelector:", objj_msgSend(anInvocation, "selector"));
}
,["void","CPInvocation"]), new objj_method(sel_getUid("doesNotRecognizeSelector:"), function $CPObject__doesNotRecognizeSelector_(self, _cmd, aSelector)
{
    objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, (class_isMetaClass(self.isa) ? "+" : "-") + " [" + objj_msgSend(self, "className") + " " + aSelector + "] unrecognized selector sent to " + (class_isMetaClass(self.isa) ? "class " + class_getName(self.isa) : "instance 0x" + objj_msgSend(CPString, "stringWithHash:", objj_msgSend(self, "UID"))));
}
,["void","SEL"]), new objj_method(sel_getUid("awakeAfterUsingCoder:"), function $CPObject__awakeAfterUsingCoder_(self, _cmd, aCoder)
{
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $CPObject__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(self, "classForCoder");
}
,["Class"]), new objj_method(sel_getUid("classForCoder"), function $CPObject__classForCoder(self, _cmd)
{
    return objj_msgSend(self, "class");
}
,["Class"]), new objj_method(sel_getUid("replacementObjectForArchiver:"), function $CPObject__replacementObjectForArchiver_(self, _cmd, anArchiver)
{
    return objj_msgSend(self, "replacementObjectForCoder:", anArchiver);
}
,["id","CPArchiver"]), new objj_method(sel_getUid("replacementObjectForKeyedArchiver:"), function $CPObject__replacementObjectForKeyedArchiver_(self, _cmd, anArchiver)
{
    return objj_msgSend(self, "replacementObjectForCoder:", anArchiver);
}
,["id","CPKeyedArchiver"]), new objj_method(sel_getUid("replacementObjectForCoder:"), function $CPObject__replacementObjectForCoder_(self, _cmd, aCoder)
{
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("className"), function $CPObject__className(self, _cmd)
{
    return self.isa.name;
}
,["CPString"]), new objj_method(sel_getUid("autorelease"), function $CPObject__autorelease(self, _cmd)
{
    return self;
}
,["id"]), new objj_method(sel_getUid("hash"), function $CPObject__hash(self, _cmd)
{
    return objj_msgSend(self, "UID");
}
,["unsigned"]), new objj_method(sel_getUid("UID"), function $CPObject__UID(self, _cmd)
{
    if (typeof self._UID === "undefined")
        self._UID = objj_generateObjectUID();
    return self._UID + "";
}
,["CPString"]), new objj_method(sel_getUid("isEqual:"), function $CPObject__isEqual_(self, _cmd, anObject)
{
    return self === anObject || objj_msgSend(self, "UID") === objj_msgSend(anObject, "UID");
}
,["BOOL","id"]), new objj_method(sel_getUid("retain"), function $CPObject__retain(self, _cmd)
{
    return self;
}
,["id"]), new objj_method(sel_getUid("release"), function $CPObject__release(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("self"), function $CPObject__self(self, _cmd)
{
    return self;
}
,["id"]), new objj_method(sel_getUid("superclass"), function $CPObject__superclass(self, _cmd)
{
    return self.isa.super_class;
}
,["Class"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("load"), function $CPObject__load(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("initialize"), function $CPObject__initialize(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("new"), function $CPObject__new(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
,["id"]), new objj_method(sel_getUid("alloc"), function $CPObject__alloc(self, _cmd)
{
    return class_createInstance(self);
}
,["id"]), new objj_method(sel_getUid("allocWithCoder:"), function $CPObject__allocWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "alloc");
}
,["id","CPCoder"]), new objj_method(sel_getUid("class"), function $CPObject__class(self, _cmd)
{
    return self;
}
,["Class"]), new objj_method(sel_getUid("superclass"), function $CPObject__superclass(self, _cmd)
{
    return self.super_class;
}
,["Class"]), new objj_method(sel_getUid("isSubclassOfClass:"), function $CPObject__isSubclassOfClass_(self, _cmd, aClass)
{
    var theClass = self;
    for (; theClass; theClass = theClass.super_class)
        if (theClass === aClass)
            return YES;
    return NO;
}
,["BOOL","Class"]), new objj_method(sel_getUid("isKindOfClass:"), function $CPObject__isKindOfClass_(self, _cmd, aClass)
{
    return objj_msgSend(self, "isSubclassOfClass:", aClass);
}
,["BOOL","Class"]), new objj_method(sel_getUid("isMemberOfClass:"), function $CPObject__isMemberOfClass_(self, _cmd, aClass)
{
    return self === aClass;
}
,["BOOL","Class"]), new objj_method(sel_getUid("instancesRespondToSelector:"), function $CPObject__instancesRespondToSelector_(self, _cmd, aSelector)
{
    return !!class_getInstanceMethod(self, aSelector);
}
,["BOOL","SEL"]), new objj_method(sel_getUid("instanceMethodForSelector:"), function $CPObject__instanceMethodForSelector_(self, _cmd, aSelector)
{
    return class_getMethodImplementation(self, aSelector);
}
,["IMP","SEL"]), new objj_method(sel_getUid("description"), function $CPObject__description(self, _cmd)
{
    return class_getName(self.isa);
}
,["CPString"]), new objj_method(sel_getUid("setVersion:"), function $CPObject__setVersion_(self, _cmd, aVersion)
{
    class_setVersion(self, aVersion);
}
,["void","int"]), new objj_method(sel_getUid("version"), function $CPObject__version(self, _cmd)
{
    return class_getVersion(self);
}
,["int"])]);
}CPDescriptionOfObject = function(anObject, maximumRecursionDepth)
{
    if (anObject === nil)
        return "nil";
    if (anObject === undefined)
        return "undefined";
    if (anObject === window)
        return "window";
    if (maximumRecursionDepth === 0)
        return "...";
    if (anObject.isa)
    {
        if (objj_msgSend(anObject, "isKindOfClass:", CPString))
            return '@"' + objj_msgSend(anObject, "description") + '"';
        if (objj_msgSend(anObject, "respondsToSelector:", sel_getUid("_descriptionWithMaximumDepth:")))
            return objj_msgSend(anObject, "_descriptionWithMaximumDepth:", maximumRecursionDepth !== undefined ? maximumRecursionDepth - 1 : maximumRecursionDepth);
        return objj_msgSend(anObject, "description");
    }
    if (typeof anObject !== "object")
        return String(anObject);
    var properties = [],
        desc;
    for (var property in anObject)
        if (anObject.hasOwnProperty(property))
            properties.push(property);
    properties.sort();
    if (properties.length === 2 && anObject.hasOwnProperty("width") && anObject.hasOwnProperty("height"))
        desc = objj_msgSend(CPString, "stringWithFormat:", "CGSize: (%f, %f)", anObject.width, anObject.height);
    else if (properties.length === 2 && anObject.hasOwnProperty("x") && anObject.hasOwnProperty("y"))
        desc = objj_msgSend(CPString, "stringWithFormat:", "CGPoint: (%f, %f)", anObject.x, anObject.y);
    else if (properties.length === 2 && anObject.hasOwnProperty("origin") && anObject.hasOwnProperty("size"))
        desc = objj_msgSend(CPString, "stringWithFormat:", "CGRect: (%f, %f), (%f, %f)", anObject.origin.x, anObject.origin.y, anObject.size.width, anObject.size.height);
    else if (properties.length === 4 && anObject.hasOwnProperty("top") && anObject.hasOwnProperty("right") && anObject.hasOwnProperty("bottom") && anObject.hasOwnProperty("left"))
        desc = objj_msgSend(CPString, "stringWithFormat:", "CGInset: { top:%f, right:%f, bottom:%f, left:%f }", anObject.top, anObject.right, anObject.bottom, anObject.left);
    else
    {
        desc = "{";
        for (var i = 0; i < properties.length; ++i)
        {
            if (i === 0)
                desc += "\n";
            var value = anObject[properties[i]],
                valueDescription = ((CPDescriptionOfObject(value, maximumRecursionDepth !== undefined ? maximumRecursionDepth - 1 : maximumRecursionDepth)).split("\n")).join("\n    ");
            desc += "    " + properties[i] + ": " + valueDescription;
            if (i < properties.length - 1)
                desc += ",\n";
            else
                desc += "\n";
        }
        desc += "}";
    }
    return desc;
}
