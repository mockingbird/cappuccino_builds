@STATIC;1.0;i;10;CPObject.jt;5343;objj_executeFile("CPObject.j", YES);var _CPCollectionKVCOperatorSimpleRE = /^@(avg|count|m(ax|in)|sum)(\.|$)/;
{var the_class = objj_allocateClassPair(CPObject, "_CPCollectionKVCOperator"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("isSimpleCollectionOperator:"), function $_CPCollectionKVCOperator__isSimpleCollectionOperator_(self, _cmd, operator)
{
    return _CPCollectionKVCOperatorSimpleRE.test(operator);
}
,["BOOL","CPString"]), new objj_method(sel_getUid("performOperation:withCollection:propertyPath:"), function $_CPCollectionKVCOperator__performOperation_withCollection_propertyPath_(self, _cmd, operator, aCollection, propertyPath)
{
    var selector = CPSelectorFromString(operator + "ForCollection:propertyPath:");
    if (!self.isa.objj_msgSend1(self, "respondsToSelector:", selector))
        return (aCollection == null ? null : aCollection.isa.objj_msgSend1(aCollection, "valueForUndefinedKey:", "@" + operator));
    return self.isa.objj_msgSend3(self, "performSelector:withObject:withObject:", selector, aCollection, propertyPath);
}
,["id","CPString","id","CPString"]), new objj_method(sel_getUid("avgForCollection:propertyPath:"), function $_CPCollectionKVCOperator__avgForCollection_propertyPath_(self, _cmd, aCollection, propertyPath)
{
    if (!propertyPath)
        return (aCollection == null ? null : aCollection.isa.objj_msgSend1(aCollection, "valueForUndefinedKey:", "@avg"));
    var objects = (aCollection == null ? null : aCollection.isa.objj_msgSend1(aCollection, "valueForKeyPath:", propertyPath)),
        average = 0.0,
        enumerator = (objects == null ? null : objects.isa.objj_msgSend0(objects, "objectEnumerator")),
        object;
    while ((object = (enumerator == null ? null : enumerator.isa.objj_msgSend0(enumerator, "nextObject"))) !== nil)
        average += (object == null ? null : object.isa.objj_msgSend0(object, "doubleValue"));
    return average / (objects == null ? null : objects.isa.objj_msgSend0(objects, "count"));
}
,["double","id","CPString"]), new objj_method(sel_getUid("minForCollection:propertyPath:"), function $_CPCollectionKVCOperator__minForCollection_propertyPath_(self, _cmd, aCollection, propertyPath)
{
    if (!propertyPath)
        return (aCollection == null ? null : aCollection.isa.objj_msgSend1(aCollection, "valueForUndefinedKey:", "@min"));
    var objects = (aCollection == null ? null : aCollection.isa.objj_msgSend1(aCollection, "valueForKeyPath:", propertyPath));
    if ((objects == null ? null : objects.isa.objj_msgSend0(objects, "count")) === 0)
        return nil;
    var enumerator = (objects == null ? null : objects.isa.objj_msgSend0(objects, "objectEnumerator")),
        min = (enumerator == null ? null : enumerator.isa.objj_msgSend0(enumerator, "nextObject")),
        object;
    while ((object = (enumerator == null ? null : enumerator.isa.objj_msgSend0(enumerator, "nextObject"))) !== nil)
    {
        if ((min == null ? null : min.isa.objj_msgSend1(min, "compare:", object)) > 0)
            min = object;
    }
    return min;
}
,["double","id","CPString"]), new objj_method(sel_getUid("maxForCollection:propertyPath:"), function $_CPCollectionKVCOperator__maxForCollection_propertyPath_(self, _cmd, aCollection, propertyPath)
{
    if (!propertyPath)
        return (aCollection == null ? null : aCollection.isa.objj_msgSend1(aCollection, "valueForUndefinedKey:", "@max"));
    var objects = (aCollection == null ? null : aCollection.isa.objj_msgSend1(aCollection, "valueForKeyPath:", propertyPath));
    if ((objects == null ? null : objects.isa.objj_msgSend0(objects, "count")) === 0)
        return nil;
    var enumerator = (objects == null ? null : objects.isa.objj_msgSend0(objects, "objectEnumerator")),
        max = (enumerator == null ? null : enumerator.isa.objj_msgSend0(enumerator, "nextObject")),
        object;
    while ((object = (enumerator == null ? null : enumerator.isa.objj_msgSend0(enumerator, "nextObject"))) !== nil)
    {
        if ((max == null ? null : max.isa.objj_msgSend1(max, "compare:", object)) < 0)
            max = object;
    }
    return max;
}
,["double","id","CPString"]), new objj_method(sel_getUid("sumForCollection:propertyPath:"), function $_CPCollectionKVCOperator__sumForCollection_propertyPath_(self, _cmd, aCollection, propertyPath)
{
    if (!propertyPath)
        return (aCollection == null ? null : aCollection.isa.objj_msgSend1(aCollection, "valueForUndefinedKey:", "@sum"));
    var objects = (aCollection == null ? null : aCollection.isa.objj_msgSend1(aCollection, "valueForKeyPath:", propertyPath)),
        sum = 0.0,
        enumerator = (objects == null ? null : objects.isa.objj_msgSend0(objects, "objectEnumerator")),
        object;
    while ((object = (enumerator == null ? null : enumerator.isa.objj_msgSend0(enumerator, "nextObject"))) !== nil)
        sum += (object == null ? null : object.isa.objj_msgSend0(object, "doubleValue"));
    return sum;
}
,["double","id","CPString"]), new objj_method(sel_getUid("countForCollection:propertyPath:"), function $_CPCollectionKVCOperator__countForCollection_propertyPath_(self, _cmd, aCollection, propertyPath)
{
    return (aCollection == null ? null : aCollection.isa.objj_msgSend0(aCollection, "count"));
}
,["int","id","CPString"])]);
}