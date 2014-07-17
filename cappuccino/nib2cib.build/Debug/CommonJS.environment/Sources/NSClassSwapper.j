@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;27;AppKit/_CPCibClassSwapper.jt;4151;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("AppKit/_CPCibClassSwapper.j", NO);var NSClassSwapperClassNames = {},
    NSClassSwapperOriginalClassNames = {};
var _CPCibClassSwapperClassNameKey = "_CPCibClassSwapperClassNameKey",
    _CPCibClassSwapperOriginalClassNameKey = "_CPCibClassSwapperOriginalClassNameKey";
{var the_class = objj_allocateClassPair(_CPCibClassSwapper, "NSClassSwapper"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("swapperClassForClassName:originalClassName:"), function $NSClassSwapper__swapperClassForClassName_originalClassName_(self, _cmd, aClassName, anOriginalClassName)
{
    var swapperClassName = "$NSClassSwapper_" + aClassName + "_" + anOriginalClassName,
        swapperClass = objj_lookUpClass(swapperClassName);
    if (!swapperClass)
    {
        var nsClass = nil;
        if (((___r1 = ((___r2 = (Nib2Cib == null ? null : Nib2Cib.isa.objj_msgSend0(Nib2Cib, "sharedNib2Cib"))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "userNSClasses"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsObject:", aClassName)))
            nsClass = objj_lookUpClass("NS_" + aClassName);
        var originalClass = nsClass || objj_lookUpClass(anOriginalClassName);
        swapperClass = objj_allocateClassPair(originalClass, swapperClassName);
        objj_registerClassPair(swapperClass);
        class_addMethod(swapperClass, sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
        {
            if (nsClass)
            {
                self.isa = nsClass;
                self = objj_msgSend(self, _cmd, aCoder);
                self.isa = swapperClass;
            }
            else
                self = objj_msgSendSuper({super_class: originalClass, receiver: self}, _cmd, aCoder);
            if (self)
            {
                var UID = (self == null ? null : self.isa.objj_msgSend0(self, "UID"));
                NSClassSwapperClassNames[UID] = aClassName;
                NSClassSwapperOriginalClassNames[UID] = anOriginalClassName;
            }
            return self;
        }, "");
        class_addMethod(swapperClass, sel_getUid("classForKeyedArchiver"), function(self, _cmd)
        {
            return _CPCibClassSwapper.isa.objj_msgSend0(_CPCibClassSwapper, "class");
        }, "");
        class_addMethod(swapperClass, sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
        {
            if (nsClass)
            {
                self.isa = nsClass;
                objj_msgSend(self, _cmd, aCoder);
                self.isa = swapperClass;
            }
            else
                objj_msgSendSuper({super_class: originalClass, receiver: self}, _cmd, aCoder);
            if (nsClass)
            {
                var classForArchiver = objj_msgSend(nsClass, "classForKeyedArchiver");
                if (classForArchiver)
                    aClassName = (classForArchiver == null ? null : classForArchiver.isa.objj_msgSend0(classForArchiver, "className"));
            }
            (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", aClassName, _CPCibClassSwapperClassNameKey));
            (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", CP_NSMapClassName(anOriginalClassName), _CPCibClassSwapperOriginalClassNameKey));
        }, "");
    }
    return swapperClass;
    var ___r1, ___r2;
}
,["id","CPString","CPString"]), new objj_method(sel_getUid("allocWithCoder:"), function $NSClassSwapper__allocWithCoder_(self, _cmd, aCoder)
{
    var className = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSClassName")),
        originalClassName = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", "NSOriginalClassName"));
    return ((___r1 = self.isa.objj_msgSend2(self, "swapperClassForClassName:originalClassName:", className, originalClassName)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "alloc"));
    var ___r1;
}
,["id","CPCoder"])]);
}