@STATIC;1.0;i;8;CPData.ji;14;CPDictionary.ji;13;CPException.ji;17;CPKeyedArchiver.ji;19;CPKeyedUnarchiver.ji;10;CPNumber.ji;10;CPObject.jt;7675;objj_executeFile("CPData.j", YES);objj_executeFile("CPDictionary.j", YES);objj_executeFile("CPException.j", YES);objj_executeFile("CPKeyedArchiver.j", YES);objj_executeFile("CPKeyedUnarchiver.j", YES);objj_executeFile("CPNumber.j", YES);objj_executeFile("CPObject.j", YES);var transformerMap = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
{var the_class = objj_allocateClassPair(CPObject, "CPValueTransformer"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("reverseTransformedValue:"), function $CPValueTransformer__reverseTransformedValue_(self, _cmd, aValue)
{
    if (!((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allowsReverseTransformation")))
    {
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, self + " is not reversible.");
    }
    return self.isa.objj_msgSend1(self, "transformedValue:", aValue);
    var ___r1;
}
,["id","id"]), new objj_method(sel_getUid("transformedValue:"), function $CPValueTransformer__transformedValue_(self, _cmd, aValue)
{
    return nil;
}
,["id","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPValueTransformer__initialize(self, _cmd)
{
    if (self !== CPValueTransformer.isa.objj_msgSend0(CPValueTransformer, "class"))
        return;
}
,["void"]), new objj_method(sel_getUid("setValueTransformer:forName:"), function $CPValueTransformer__setValueTransformer_forName_(self, _cmd, transformer, aName)
{
    (transformerMap == null ? null : transformerMap.isa.objj_msgSend2(transformerMap, "setObject:forKey:", transformer, aName));
}
,["void","CPValueTransformer","CPString"]), new objj_method(sel_getUid("valueTransformerForName:"), function $CPValueTransformer__valueTransformerForName_(self, _cmd, aName)
{
    return (transformerMap == null ? null : transformerMap.isa.objj_msgSend1(transformerMap, "objectForKey:", aName));
}
,["CPValueTransformer","CPString"]), new objj_method(sel_getUid("valueTransformerNames"), function $CPValueTransformer__valueTransformerNames(self, _cmd)
{
    return (transformerMap == null ? null : transformerMap.isa.objj_msgSend0(transformerMap, "allKeys"));
}
,["CPArray"]), new objj_method(sel_getUid("allowsReverseTransformation"), function $CPValueTransformer__allowsReverseTransformation(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("transformedValueClass"), function $CPValueTransformer__transformedValueClass(self, _cmd)
{
    return CPObject.isa.objj_msgSend0(CPObject, "class");
}
,["Class"])]);
}{var the_class = objj_allocateClassPair(CPValueTransformer, "CPNegateBooleanTransformer"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("reverseTransformedValue:"), function $CPNegateBooleanTransformer__reverseTransformedValue_(self, _cmd, aValue)
{
    return !(aValue == null ? null : aValue.isa.objj_msgSend0(aValue, "boolValue"));
}
,["id","id"]), new objj_method(sel_getUid("transformedValue:"), function $CPNegateBooleanTransformer__transformedValue_(self, _cmd, aValue)
{
    return !(aValue == null ? null : aValue.isa.objj_msgSend0(aValue, "boolValue"));
}
,["id","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("allowsReverseTransformation"), function $CPNegateBooleanTransformer__allowsReverseTransformation(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("transformedValueClass"), function $CPNegateBooleanTransformer__transformedValueClass(self, _cmd)
{
    return CPNumber.isa.objj_msgSend0(CPNumber, "class");
}
,["Class"])]);
}{var the_class = objj_allocateClassPair(CPValueTransformer, "CPIsNilTransformer"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("transformedValue:"), function $CPIsNilTransformer__transformedValue_(self, _cmd, aValue)
{
    return aValue === nil || aValue === undefined;
}
,["id","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("allowsReverseTransformation"), function $CPIsNilTransformer__allowsReverseTransformation(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("transformedValueClass"), function $CPIsNilTransformer__transformedValueClass(self, _cmd)
{
    return CPNumber.isa.objj_msgSend0(CPNumber, "class");
}
,["Class"])]);
}{var the_class = objj_allocateClassPair(CPValueTransformer, "CPIsNotNilTransformer"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("transformedValue:"), function $CPIsNotNilTransformer__transformedValue_(self, _cmd, aValue)
{
    return aValue !== nil && aValue !== undefined;
}
,["id","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("allowsReverseTransformation"), function $CPIsNotNilTransformer__allowsReverseTransformation(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("transformedValueClass"), function $CPIsNotNilTransformer__transformedValueClass(self, _cmd)
{
    return CPNumber.isa.objj_msgSend0(CPNumber, "class");
}
,["Class"])]);
}{var the_class = objj_allocateClassPair(CPValueTransformer, "CPUnarchiveFromDataTransformer"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("reverseTransformedValue:"), function $CPUnarchiveFromDataTransformer__reverseTransformedValue_(self, _cmd, aValue)
{
    return CPKeyedArchiver.isa.objj_msgSend1(CPKeyedArchiver, "archivedDataWithRootObject:", aValue);
}
,["id","id"]), new objj_method(sel_getUid("transformedValue:"), function $CPUnarchiveFromDataTransformer__transformedValue_(self, _cmd, aValue)
{
    return CPKeyedUnarchiver.isa.objj_msgSend1(CPKeyedUnarchiver, "unarchiveObjectWithData:", aValue);
}
,["id","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("allowsReverseTransformation"), function $CPUnarchiveFromDataTransformer__allowsReverseTransformation(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("transformedValueClass"), function $CPUnarchiveFromDataTransformer__transformedValueClass(self, _cmd)
{
    return CPData.isa.objj_msgSend0(CPData, "class");
}
,["Class"])]);
}CPNegateBooleanTransformerName = "CPNegateBoolean";
CPIsNilTransformerName = "CPIsNil";
CPIsNotNilTransformerName = "CPIsNotNil";
CPUnarchiveFromDataTransformerName = "CPUnarchiveFromData";
CPKeyedUnarchiveFromDataTransformerName = "CPKeyedUnarchiveFromData";
CPValueTransformer.isa.objj_msgSend2(CPValueTransformer, "setValueTransformer:forName:", ((___r1 = CPNegateBooleanTransformer.isa.objj_msgSend0(CPNegateBooleanTransformer, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init")), CPNegateBooleanTransformerName);
CPValueTransformer.isa.objj_msgSend2(CPValueTransformer, "setValueTransformer:forName:", ((___r1 = CPIsNilTransformer.isa.objj_msgSend0(CPIsNilTransformer, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init")), CPIsNilTransformerName);
CPValueTransformer.isa.objj_msgSend2(CPValueTransformer, "setValueTransformer:forName:", ((___r1 = CPIsNotNilTransformer.isa.objj_msgSend0(CPIsNotNilTransformer, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init")), CPIsNotNilTransformerName);
CPValueTransformer.isa.objj_msgSend2(CPValueTransformer, "setValueTransformer:forName:", ((___r1 = CPUnarchiveFromDataTransformer.isa.objj_msgSend0(CPUnarchiveFromDataTransformer, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init")), CPUnarchiveFromDataTransformerName);
