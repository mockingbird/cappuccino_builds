@STATIC;1.0;I;24;Foundation/CPException.jI;30;Foundation/CPKeyedUnarchiver.jI;21;Foundation/CPObject.jI;20;Foundation/CPRange.jI;20;Foundation/CPValue.jI;19;AppKit/CGGeometry.jt;1741;objj_executeFile("Foundation/CPException.j", NO);objj_executeFile("Foundation/CPKeyedUnarchiver.j", NO);objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPRange.j", NO);objj_executeFile("Foundation/CPValue.j", NO);objj_executeFile("AppKit/CGGeometry.j", NO);var NSPointNSValueType = 1,
    NSSizeNSValueType = 2,
    NSRectNSValueType = 3,
    NSRangeNSValueType = 4;
{var the_class = objj_allocateClassPair(CPObject, "NSValue"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSValue__initWithCoder_(self, _cmd, aCoder)
{
    var type = objj_msgSend(aCoder, "decodeIntForKey:", "NS.special");
    switch(type) {
    case NSPointNSValueType:
        return objj_msgSend(objj_msgSend(CPValue, "alloc"), "initWithJSObject:", CGPointFromString(objj_msgSend(aCoder, "decodeObjectForKey:", "NS.pointval")));
    case NSSizeNSValueType:
        return objj_msgSend(objj_msgSend(CPValue, "alloc"), "initWithJSObject:", CGSizeFromString(objj_msgSend(aCoder, "decodeObjectForKey:", "NS.sizeval")));
    case NSRectNSValueType:
        return objj_msgSend(objj_msgSend(CPValue, "alloc"), "initWithJSObject:", CGRectFromString(objj_msgSend(aCoder, "decodeObjectForKey:", "NS.rectval")));
    case NSRangeNSValueType:
        return objj_msgSend(objj_msgSend(CPValue, "alloc"), "initWithJSObject:", CPMakeRange(objj_msgSend(aCoder, "decodeIntForKey:", "NS.rangeval.location"), objj_msgSend(aCoder, "decodeIntForKey:", "NS.rangeval.length")));
default:
        objj_msgSend(CPException, "raise:format:", CPInvalidUnarchiveOperationException, "NSValue type %d is not supported by nib2cib.", type);
    }
}
,["id","CPCoder"])]);
}