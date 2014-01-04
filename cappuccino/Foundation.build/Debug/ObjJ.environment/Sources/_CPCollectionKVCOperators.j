@STATIC;1.0;t;3909;
{var the_class = objj_allocateClassPair(CPObject, "_CPCollectionKVCOperator"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("performOperation:withCollection:propertyPath:"), function $_CPCollectionKVCOperator__performOperation_withCollection_propertyPath_(self, _cmd, operator, aCollection, propertyPath)
{ with(self)
{
    var selector = CPSelectorFromString(operator + "ForCollection:propertyPath:");

    if (!objj_msgSend(self, "respondsToSelector:", selector))
        return objj_msgSend(aCollection, "valueForUndefinedKey:", "@" + operator);

    return objj_msgSend(self, "performSelector:withObject:withObject:", selector, aCollection, propertyPath);
}
},["id","CPString","id","CPString"]), new objj_method(sel_getUid("avgForCollection:propertyPath:"), function $_CPCollectionKVCOperator__avgForCollection_propertyPath_(self, _cmd, aCollection, propertyPath)
{ with(self)
{
    if (!propertyPath)
        return objj_msgSend(aCollection, "valueForUndefinedKey:", "@avg");

    var objects = objj_msgSend(aCollection, "valueForKeyPath:", propertyPath),
        average = 0.0,
        enumerator = objj_msgSend(objects, "objectEnumerator"),
        object;

    while ((object = objj_msgSend(enumerator, "nextObject")) !== nil)
        average += objj_msgSend(object, "doubleValue");

    return average / objj_msgSend(objects, "count");
}
},["double","id","CPString"]), new objj_method(sel_getUid("minForCollection:propertyPath:"), function $_CPCollectionKVCOperator__minForCollection_propertyPath_(self, _cmd, aCollection, propertyPath)
{ with(self)
{
    if (!propertyPath)
        return objj_msgSend(aCollection, "valueForUndefinedKey:", "@min");

    var objects = objj_msgSend(aCollection, "valueForKeyPath:", propertyPath);

    if (objj_msgSend(objects, "count") === 0)
        return nil;

    var enumerator = objj_msgSend(objects, "objectEnumerator"),
        min = objj_msgSend(enumerator, "nextObject"),
        object;

    while ((object = objj_msgSend(enumerator, "nextObject")) !== nil)
    {
        if (objj_msgSend(min, "compare:", object) > 0)
            min = object;
    }

    return min;
}
},["double","id","CPString"]), new objj_method(sel_getUid("maxForCollection:propertyPath:"), function $_CPCollectionKVCOperator__maxForCollection_propertyPath_(self, _cmd, aCollection, propertyPath)
{ with(self)
{
    if (!propertyPath)
        return objj_msgSend(aCollection, "valueForUndefinedKey:", "@max");

    var objects = objj_msgSend(aCollection, "valueForKeyPath:", propertyPath);

    if (objj_msgSend(objects, "count") === 0)
        return nil;

    var enumerator = objj_msgSend(objects, "objectEnumerator"),
        max = objj_msgSend(enumerator, "nextObject"),
        object;

    while ((object = objj_msgSend(enumerator, "nextObject")) !== nil)
    {
        if (objj_msgSend(max, "compare:", object) < 0)
            max = object;
    }

    return max;
}
},["double","id","CPString"]), new objj_method(sel_getUid("sumForCollection:propertyPath:"), function $_CPCollectionKVCOperator__sumForCollection_propertyPath_(self, _cmd, aCollection, propertyPath)
{ with(self)
{
    if (!propertyPath)
        return objj_msgSend(aCollection, "valueForUndefinedKey:", "@sum");

    var objects = objj_msgSend(aCollection, "valueForKeyPath:", propertyPath),
        sum = 0.0,
        enumerator = objj_msgSend(objects, "objectEnumerator"),
        object;

    while ((object = objj_msgSend(enumerator, "nextObject")) !== nil)
        sum += objj_msgSend(object, "doubleValue");

    return sum;
}
},["double","id","CPString"]), new objj_method(sel_getUid("countForCollection:propertyPath:"), function $_CPCollectionKVCOperator__countForCollection_propertyPath_(self, _cmd, aCollection, propertyPath)
{ with(self)
{
    return objj_msgSend(aCollection, "count");
}
},["int","id","CPString"])]);
}

