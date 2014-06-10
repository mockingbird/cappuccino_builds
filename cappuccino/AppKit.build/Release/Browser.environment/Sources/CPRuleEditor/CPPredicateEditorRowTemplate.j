@STATIC;1.0;I;24;Foundation/CPPredicate.ji;12;CPCheckBox.ji;15;CPPopUpButton.ji;12;CPMenuItem.ji;13;CPTextField.ji;14;CPDatePicker.jt;33247;objj_executeFile("Foundation/CPPredicate.j", NO);objj_executeFile("CPCheckBox.j", YES);objj_executeFile("CPPopUpButton.j", YES);objj_executeFile("CPMenuItem.j", YES);objj_executeFile("CPTextField.j", YES);objj_executeFile("CPDatePicker.j", YES);CPUndefinedAttributeType = 0;
CPInteger16AttributeType = 100;
CPInteger32AttributeType = 200;
CPInteger64AttributeType = 300;
CPDecimalAttributeType = 400;
CPDoubleAttributeType = 500;
CPFloatAttributeType = 600;
CPStringAttributeType = 700;
CPBooleanAttributeType = 800;
CPDateAttributeType = 900;
CPBinaryDataAttributeType = 1000;
CPTransformableAttributeType = 1800;
{var the_class = objj_allocateClassPair(CPObject, "CPPredicateEditorRowTemplate"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_templateType"), new objj_ivar("_predicateOptions"), new objj_ivar("_predicateModifier"), new objj_ivar("_leftAttributeType"), new objj_ivar("_rightAttributeType"), new objj_ivar("_leftIsWildcard"), new objj_ivar("_rightIsWildcard"), new objj_ivar("_views")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_templateType"), function $CPPredicateEditorRowTemplate___templateType(self, _cmd)
{
    return self._templateType;
}
,["int"]), new objj_method(sel_getUid("_setTemplateType:"), function $CPPredicateEditorRowTemplate___setTemplateType_(self, _cmd, newValue)
{
    self._templateType = newValue;
}
,["void","int"]), new objj_method(sel_getUid("_predicateOptions"), function $CPPredicateEditorRowTemplate___predicateOptions(self, _cmd)
{
    return self._predicateOptions;
}
,["unsigned"]), new objj_method(sel_getUid("_setOptions:"), function $CPPredicateEditorRowTemplate___setOptions_(self, _cmd, newValue)
{
    self._predicateOptions = newValue;
}
,["void","unsigned"]), new objj_method(sel_getUid("_predicateModifier"), function $CPPredicateEditorRowTemplate___predicateModifier(self, _cmd)
{
    return self._predicateModifier;
}
,["unsigned"]), new objj_method(sel_getUid("_setModifier:"), function $CPPredicateEditorRowTemplate___setModifier_(self, _cmd, newValue)
{
    self._predicateModifier = newValue;
}
,["void","unsigned"]), new objj_method(sel_getUid("leftAttributeType"), function $CPPredicateEditorRowTemplate__leftAttributeType(self, _cmd)
{
    return self._leftAttributeType;
}
,["unsigned"]), new objj_method(sel_getUid("_setLeftAttributeType:"), function $CPPredicateEditorRowTemplate___setLeftAttributeType_(self, _cmd, newValue)
{
    self._leftAttributeType = newValue;
}
,["void","unsigned"]), new objj_method(sel_getUid("rightAttributeType"), function $CPPredicateEditorRowTemplate__rightAttributeType(self, _cmd)
{
    return self._rightAttributeType;
}
,["unsigned"]), new objj_method(sel_getUid("_setRightAttributeType:"), function $CPPredicateEditorRowTemplate___setRightAttributeType_(self, _cmd, newValue)
{
    self._rightAttributeType = newValue;
}
,["void","unsigned"]), new objj_method(sel_getUid("leftIsWildcard"), function $CPPredicateEditorRowTemplate__leftIsWildcard(self, _cmd)
{
    return self._leftIsWildcard;
}
,["BOOL"]), new objj_method(sel_getUid("setLeftIsWildcard:"), function $CPPredicateEditorRowTemplate__setLeftIsWildcard_(self, _cmd, newValue)
{
    self._leftIsWildcard = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("rightIsWildcard"), function $CPPredicateEditorRowTemplate__rightIsWildcard(self, _cmd)
{
    return self._rightIsWildcard;
}
,["BOOL"]), new objj_method(sel_getUid("setRightIsWildcard:"), function $CPPredicateEditorRowTemplate__setRightIsWildcard_(self, _cmd, newValue)
{
    self._rightIsWildcard = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("_views"), function $CPPredicateEditorRowTemplate___views(self, _cmd)
{
    return self._views;
}
,["CPArray"]), new objj_method(sel_getUid("setTemplateViews:"), function $CPPredicateEditorRowTemplate__setTemplateViews_(self, _cmd, newValue)
{
    self._views = newValue;
}
,["void","CPArray"]), new objj_method(sel_getUid("initWithLeftExpressions:rightExpressions:modifier:operators:options:"), function $CPPredicateEditorRowTemplate__initWithLeftExpressions_rightExpressions_modifier_operators_options_(self, _cmd, leftExpressions, rightExpressions, modifier, operators, options)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditorRowTemplate").super_class }, "init");
    if (self != nil)
    {
        self._templateType = 1;
        self._leftIsWildcard = NO;
        self._rightIsWildcard = NO;
        self._leftAttributeType = 0;
        self._rightAttributeType = 0;
        self._predicateModifier = modifier;
        self._predicateOptions = options;
        var leftView = objj_msgSend(self, "_viewFromExpressions:", leftExpressions),
            rightView = objj_msgSend(self, "_viewFromExpressions:", rightExpressions),
            middleView = objj_msgSend(self, "_viewFromOperatorTypes:", operators);
        self._views = objj_msgSend(objj_msgSend(CPArray, "alloc"), "initWithObjects:", leftView, middleView, rightView);
    }
    return self;
}
,["id","CPArray","CPArray","int","CPArray","int"]), new objj_method(sel_getUid("initWithLeftExpressions:rightExpressionAttributeType:modifier:operators:options:"), function $CPPredicateEditorRowTemplate__initWithLeftExpressions_rightExpressionAttributeType_modifier_operators_options_(self, _cmd, leftExpressions, attributeType, modifier, operators, options)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditorRowTemplate").super_class }, "init");
    if (self != nil)
    {
        var leftView = objj_msgSend(self, "_viewFromExpressions:", leftExpressions),
            middleView = objj_msgSend(self, "_viewFromOperatorTypes:", operators),
            rightView = objj_msgSend(self, "_viewFromAttributeType:", attributeType);
        self._templateType = 1;
        self._leftIsWildcard = NO;
        self._rightIsWildcard = YES;
        self._leftAttributeType = 0;
        self._rightAttributeType = attributeType;
        self._predicateModifier = modifier;
        self._predicateOptions = options;
        self._views = objj_msgSend(objj_msgSend(CPArray, "alloc"), "initWithObjects:", leftView, middleView, rightView);
    }
    return self;
}
,["id","CPArray","CPAttributeType","CPComparisonPredicateModifier","CPArray","int"]), new objj_method(sel_getUid("initWithCompoundTypes:"), function $CPPredicateEditorRowTemplate__initWithCompoundTypes_(self, _cmd, compoundTypes)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditorRowTemplate").super_class }, "init");
    if (self != nil)
    {
        var leftView = objj_msgSend(self, "_viewFromCompoundTypes:", compoundTypes),
            rightView = objj_msgSend(objj_msgSend(CPPopUpButton, "alloc"), "init");
        objj_msgSend(rightView, "addItemWithTitle:", "of the following are true");
        self._templateType = 2;
        self._leftIsWildcard = NO;
        self._rightIsWildcard = NO;
        self._rightAttributeType = 0;
        self._views = objj_msgSend(objj_msgSend(CPArray, "alloc"), "initWithObjects:", leftView, rightView);
    }
    return self;
}
,["id","CPArray"]), new objj_method(sel_getUid("matchForPredicate:"), function $CPPredicateEditorRowTemplate__matchForPredicate_(self, _cmd, predicate)
{
    if (objj_msgSend(self, "_templateType") == 2 && objj_msgSend(predicate, "isKindOfClass:", objj_msgSend(CPCompoundPredicate, "class")))
    {
        if (objj_msgSend(objj_msgSend(self, "compoundTypes"), "containsObject:", objj_msgSend(predicate, "compoundPredicateType")))
            return 1;
    }
    else if (objj_msgSend(self, "_templateType") == 1 && objj_msgSend(predicate, "isKindOfClass:", objj_msgSend(CPComparisonPredicate, "class")))
    {
        if (!self._leftIsWildcard && !objj_msgSend(objj_msgSend(self, "leftExpressions"), "containsObject:", objj_msgSend(predicate, "leftExpression")))
            return 0;
        if (!objj_msgSend(objj_msgSend(self, "operators"), "containsObject:", objj_msgSend(predicate, "predicateOperatorType")))
            return 0;
        if (!self._rightIsWildcard && !objj_msgSend(objj_msgSend(self, "rightExpressions"), "containsObject:", objj_msgSend(predicate, "rightExpression")))
            return 0;
        return 1;
    }
    return 0;
}
,["double","CPPredicate"]), new objj_method(sel_getUid("templateViews"), function $CPPredicateEditorRowTemplate__templateViews(self, _cmd)
{
    return self._views;
}
,["CPArray"]), new objj_method(sel_getUid("setPredicate:"), function $CPPredicateEditorRowTemplate__setPredicate_(self, _cmd, predicate)
{
    if (self._templateType == 2)
        objj_msgSend(self, "_setCompoundPredicate:", predicate);
    else
        objj_msgSend(self, "_setComparisonPredicate:", predicate);
}
,["void","CPPredicate"]), new objj_method(sel_getUid("displayableSubpredicatesOfPredicate:"), function $CPPredicateEditorRowTemplate__displayableSubpredicatesOfPredicate_(self, _cmd, predicate)
{
    if (objj_msgSend(predicate, "isKindOfClass:", objj_msgSend(CPCompoundPredicate, "class")))
    {
        var subpredicates = objj_msgSend(predicate, "subpredicates");
        if (objj_msgSend(subpredicates, "count") == 0)
            return nil;
        return subpredicates;
    }
    return nil;
}
,["CPArray","CPPredicate"]), new objj_method(sel_getUid("predicateWithSubpredicates:"), function $CPPredicateEditorRowTemplate__predicateWithSubpredicates_(self, _cmd, subpredicates)
{
    if (self._templateType == 2)
    {
        var type = objj_msgSend(objj_msgSend(self._views[0], "selectedItem"), "representedObject");
        return objj_msgSend(objj_msgSend(CPCompoundPredicate, "alloc"), "initWithType:subpredicates:", type, subpredicates);
    }
    if (self._templateType == 1)
    {
        var lhs = objj_msgSend(self, "_leftExpression"),
            rhs = objj_msgSend(self, "_rightExpression"),
            operator = objj_msgSend(objj_msgSend(self._views[1], "selectedItem"), "representedObject");
        return objj_msgSend(CPComparisonPredicate, "predicateWithLeftExpression:rightExpression:modifier:type:options:", lhs, rhs, objj_msgSend(self, "modifier"), operator, objj_msgSend(self, "options"));
    }
    return nil;
}
,["CPPredicate","CPArray"]), new objj_method(sel_getUid("leftExpressions"), function $CPPredicateEditorRowTemplate__leftExpressions(self, _cmd)
{
    if (self._templateType == 1 && !self._leftIsWildcard)
    {
        var view = objj_msgSend(self._views, "objectAtIndex:", 0);
        return objj_msgSend(objj_msgSend(view, "itemArray"), "valueForKey:", "representedObject");
    }
    return nil;
}
,["CPArray"]), new objj_method(sel_getUid("rightExpressions"), function $CPPredicateEditorRowTemplate__rightExpressions(self, _cmd)
{
    if (self._templateType == 1 && !self._rightIsWildcard)
    {
        var view = objj_msgSend(self._views, "objectAtIndex:", 2);
        return objj_msgSend(objj_msgSend(view, "itemArray"), "valueForKey:", "representedObject");
    }
    return nil;
}
,["CPArray"]), new objj_method(sel_getUid("compoundTypes"), function $CPPredicateEditorRowTemplate__compoundTypes(self, _cmd)
{
    if (self._templateType == 2)
    {
        var view = objj_msgSend(self._views, "objectAtIndex:", 0);
        return objj_msgSend(objj_msgSend(view, "itemArray"), "valueForKey:", "representedObject");
    }
    return nil;
}
,["CPArray"]), new objj_method(sel_getUid("modifier"), function $CPPredicateEditorRowTemplate__modifier(self, _cmd)
{
    if (self._templateType == 1)
        return self._predicateModifier;
    return nil;
}
,["CPComparisonPredicateModifier"]), new objj_method(sel_getUid("operators"), function $CPPredicateEditorRowTemplate__operators(self, _cmd)
{
    if (self._templateType == 1)
    {
        var view = objj_msgSend(self._views, "objectAtIndex:", 1);
        return objj_msgSend(objj_msgSend(view, "itemArray"), "valueForKey:", "representedObject");
    }
    return nil;
}
,["CPArray"]), new objj_method(sel_getUid("options"), function $CPPredicateEditorRowTemplate__options(self, _cmd)
{
    if (self._templateType == 1)
        return self._predicateOptions;
    return nil;
}
,["int"]), new objj_method(sel_getUid("rightExpressionAttributeType"), function $CPPredicateEditorRowTemplate__rightExpressionAttributeType(self, _cmd)
{
    return self._rightAttributeType;
}
,["CPAttributeType"]), new objj_method(sel_getUid("leftExpressionAttributeType"), function $CPPredicateEditorRowTemplate__leftExpressionAttributeType(self, _cmd)
{
    return self._leftAttributeType;
}
,["CPAttributeType"]), new objj_method(sel_getUid("_setCompoundPredicate:"), function $CPPredicateEditorRowTemplate___setCompoundPredicate_(self, _cmd, predicate)
{
    var left = objj_msgSend(self._views, "objectAtIndex:", 0),
        type = objj_msgSend(predicate, "compoundPredicateType"),
        index = objj_msgSend(left, "indexOfItemWithRepresentedObject:", type);
    objj_msgSend(left, "selectItemAtIndex:", index);
}
,["void","CPCompoundPredicate"]), new objj_method(sel_getUid("_setComparisonPredicate:"), function $CPPredicateEditorRowTemplate___setComparisonPredicate_(self, _cmd, predicate)
{
    var left = objj_msgSend(self._views, "objectAtIndex:", 0),
        middle = objj_msgSend(self._views, "objectAtIndex:", 1),
        right = objj_msgSend(self._views, "objectAtIndex:", 2),
        leftExpression = objj_msgSend(predicate, "leftExpression"),
        rightExpression = objj_msgSend(predicate, "rightExpression"),
        operator = objj_msgSend(predicate, "predicateOperatorType");
    if (self._leftIsWildcard)
        objj_msgSend(left, "setObjectValue:", objj_msgSend(leftExpression, "constantValue"));
    else
    {
        var index = objj_msgSend(left, "indexOfItemWithRepresentedObject:", leftExpression);
        objj_msgSend(left, "selectItemAtIndex:", index);
    }
    var op_index = objj_msgSend(middle, "indexOfItemWithRepresentedObject:", operator);
    objj_msgSend(middle, "selectItemAtIndex:", op_index);
    if (self._rightIsWildcard)
        objj_msgSend(right, "setObjectValue:", objj_msgSend(rightExpression, "constantValue"));
    else
    {
        var index = objj_msgSend(right, "indexOfItemWithRepresentedObject:", rightExpression);
        objj_msgSend(right, "selectItemAtIndex:", index);
    }
}
,["void","CPComparisonPredicate"]), new objj_method(sel_getUid("_leftExpression"), function $CPPredicateEditorRowTemplate___leftExpression(self, _cmd)
{
    return objj_msgSend(self, "_expressionFromView:forAttributeType:", self._views[0], self._leftAttributeType);
}
,["CPExpression"]), new objj_method(sel_getUid("_rightExpression"), function $CPPredicateEditorRowTemplate___rightExpression(self, _cmd)
{
    return objj_msgSend(self, "_expressionFromView:forAttributeType:", self._views[2], self._rightAttributeType);
}
,["CPExpression"]), new objj_method(sel_getUid("_expressionFromView:forAttributeType:"), function $CPPredicateEditorRowTemplate___expressionFromView_forAttributeType_(self, _cmd, aView, attributeType)
{
    if (attributeType == 0)
        return objj_msgSend(objj_msgSend(aView, "selectedItem"), "representedObject");
    var value;
    if (attributeType >= CPInteger16AttributeType && attributeType <= CPFloatAttributeType)
        value = objj_msgSend(aView, "intValue");
    else if (attributeType == CPBooleanAttributeType)
        value = objj_msgSend(aView, "state");
    else
        value = objj_msgSend(aView, "stringValue");
    return objj_msgSend(CPExpression, "expressionForConstantValue:", value);
}
,["CPExpression","CPView","CPAttributeType"]), new objj_method(sel_getUid("_rowType"), function $CPPredicateEditorRowTemplate___rowType(self, _cmd)
{
    return self._templateType - 1;
}
,["int"]), new objj_method(sel_getUid("copy"), function $CPPredicateEditorRowTemplate__copy(self, _cmd)
{
    var views = objj_msgSend(CPArray, "array");
    var copy = objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "alloc"), "init");
    objj_msgSend(copy, "_setTemplateType:", self._templateType);
    objj_msgSend(copy, "_setOptions:", self._predicateOptions);
    objj_msgSend(copy, "_setModifier:", self._predicateModifier);
    objj_msgSend(copy, "_setLeftAttributeType:", self._leftAttributeType);
    objj_msgSend(copy, "_setRightAttributeType:", self._rightAttributeType);
    objj_msgSend(copy, "setLeftIsWildcard:", self._leftIsWildcard);
    objj_msgSend(copy, "setRightIsWildcard:", self._rightIsWildcard);
    objj_msgSend(self._views, "enumerateObjectsUsingBlock:", function(aView, idx, stop)
    {
        var vcopy;
        if (objj_msgSend(aView, "implementsSelector:", sel_getUid("copy")))
        {
            vcopy = objj_msgSend(aView, "copy");
        }
        else
        {
            vcopy = objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", aView));
        }
        objj_msgSend(views, "addObject:", vcopy);
    });
    objj_msgSend(copy, "setTemplateViews:", views);
    return copy;
}
,["id"]), new objj_method(sel_getUid("_templateType"), function $CPPredicateEditorRowTemplate___templateType(self, _cmd)
{
    return self._templateType;
}
,["int"]), new objj_method(sel_getUid("_displayValueForPredicateOperator:"), function $CPPredicateEditorRowTemplate___displayValueForPredicateOperator_(self, _cmd, operator)
{
    var value;
    switch(operator) {
    case CPLessThanPredicateOperatorType:
        value = "is less than";
        break;
    case CPLessThanOrEqualToPredicateOperatorType:
        value = "is less than or equal to";
        break;
    case CPGreaterThanPredicateOperatorType:
        value = "is greater than";
        break;
    case CPGreaterThanOrEqualToPredicateOperatorType:
        value = "is greater than or equal to";
        break;
    case CPEqualToPredicateOperatorType:
        value = "is";
        break;
    case CPNotEqualToPredicateOperatorType:
        value = "is not";
        break;
    case CPMatchesPredicateOperatorType:
        value = "matches";
        break;
    case CPLikePredicateOperatorType:
        value = "is like";
        break;
    case CPBeginsWithPredicateOperatorType:
        value = "begins with";
        break;
    case CPEndsWithPredicateOperatorType:
        value = "ends with";
        break;
    case CPInPredicateOperatorType:
        value = "in";
        break;
    case CPContainsPredicateOperatorType:
        value = "contains";
        break;
    case CPBetweenPredicateOperatorType:
        value = "between";
        break;
default:
        CPLogConsole("unknown predicate operator %d" + operator);
    }
    return value;
}
,["id","int"]), new objj_method(sel_getUid("_displayValueForCompoundPredicateType:"), function $CPPredicateEditorRowTemplate___displayValueForCompoundPredicateType_(self, _cmd, predicateType)
{
    var value;
    switch(predicateType) {
    case CPNotPredicateType:
        value = "None";
        break;
    case CPAndPredicateType:
        value = "All";
        break;
    case CPOrPredicateType:
        value = "Any";
        break;
default:
        value = objj_msgSend(CPString, "stringWithFormat:", "unknown compound predicate type %d", predicateType);
    }
    return value;
}
,["id","unsigned int"]), new objj_method(sel_getUid("_displayValueForConstantValue:"), function $CPPredicateEditorRowTemplate___displayValueForConstantValue_(self, _cmd, value)
{
    return objj_msgSend(value, "description");
}
,["id","id"]), new objj_method(sel_getUid("_displayValueForKeyPath:"), function $CPPredicateEditorRowTemplate___displayValueForKeyPath_(self, _cmd, keyPath)
{
    return keyPath;
}
,["id","CPString"]), new objj_method(sel_getUid("_viewFromExpressions:"), function $CPPredicateEditorRowTemplate___viewFromExpressions_(self, _cmd, expressions)
{
    var popup = objj_msgSend(objj_msgSend(CPPopUpButton, "alloc"), "initWithFrame:", CGRectMake(0, 0, 100, 18)),
        count = objj_msgSend(expressions, "count");
    for (var i = 0; i < count; i++)
    {
        var exp = expressions[i],
            type = objj_msgSend(exp, "expressionType"),
            title;
        switch(type) {
        case CPKeyPathExpressionType:
            title = objj_msgSend(self, "_displayValueForKeyPath:", objj_msgSend(exp, "keyPath"));
            break;
        case CPConstantValueExpressionType:
            title = objj_msgSend(self, "_displayValueForConstantValue:", objj_msgSend(exp, "constantValue"));
            break;
default:
            objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "Invalid Expression type " + type);
            break;
        }
        var item = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", title, nil, "");
        objj_msgSend(item, "setRepresentedObject:", exp);
        objj_msgSend(popup, "addItem:", item);
    }
    objj_msgSend(popup, "sizeToFit");
    return popup;
}
,["CPPopUpButton","CPArray"]), new objj_method(sel_getUid("_viewFromOperatorTypes:"), function $CPPredicateEditorRowTemplate___viewFromOperatorTypes_(self, _cmd, operators)
{
    var popup = objj_msgSend(objj_msgSend(CPPopUpButton, "alloc"), "initWithFrame:", CGRectMake(0, 0, 100, 18)),
        count = objj_msgSend(operators, "count");
    for (var i = 0; i < count; i++)
    {
        var op = operators[i],
            title = objj_msgSend(self, "_displayValueForPredicateOperator:", op),
            item = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", title, nil, "");
        objj_msgSend(item, "setRepresentedObject:", op);
        objj_msgSend(popup, "addItem:", item);
    }
    objj_msgSend(popup, "sizeToFit");
    return popup;
}
,["CPPopUpButton","CPArray"]), new objj_method(sel_getUid("_viewFromCompoundTypes:"), function $CPPredicateEditorRowTemplate___viewFromCompoundTypes_(self, _cmd, compoundTypes)
{
    var popup = objj_msgSend(objj_msgSend(CPPopUpButton, "alloc"), "initWithFrame:", CGRectMake(0, 0, 100, 18)),
        count = objj_msgSend(compoundTypes, "count");
    for (var i = 0; i < count; i++)
    {
        var type = compoundTypes[i],
            title = objj_msgSend(self, "_displayValueForCompoundPredicateType:", type),
            item = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", title, nil, "");
        objj_msgSend(item, "setRepresentedObject:", type);
        objj_msgSend(popup, "addItem:", item);
    }
    objj_msgSend(popup, "sizeToFit");
    return popup;
}
,["CPView","CPArray"]), new objj_method(sel_getUid("_viewFromAttributeType:"), function $CPPredicateEditorRowTemplate___viewFromAttributeType_(self, _cmd, attributeType)
{
    var view;
    if (attributeType >= CPInteger16AttributeType && attributeType <= CPFloatAttributeType)
    {
        view = objj_msgSend(self, "_textFieldWithFrame:", CGRectMake(0, 0, 50, 26));
    }
    else if (attributeType == CPStringAttributeType)
    {
        view = objj_msgSend(self, "_textFieldWithFrame:", CGRectMake(0, 0, 150, 26));
    }
    else if (attributeType == CPBooleanAttributeType)
    {
        view = objj_msgSend(objj_msgSend(CPCheckBox, "alloc"), "initWithFrame:", CGRectMake(0, 0, 50, 26));
    }
    else if (attributeType == CPDateAttributeType)
        view = objj_msgSend(objj_msgSend(CPDatePicker, "alloc"), "initWithFrame:", CGRectMake(0, 0, 180, 26));
    else
        return nil;
    objj_msgSend(view, "setTag:", attributeType);
    return view;
}
,["CPView","CPAttributeType"]), new objj_method(sel_getUid("_textFieldWithFrame:"), function $CPPredicateEditorRowTemplate___textFieldWithFrame_(self, _cmd, frame)
{
    var textField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", frame);
    objj_msgSend(textField, "setBezeled:", YES);
    objj_msgSend(textField, "setBezelStyle:", CPTextFieldSquareBezel);
    objj_msgSend(textField, "setBordered:", YES);
    objj_msgSend(textField, "setEditable:", YES);
    objj_msgSend(textField, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 10));
    objj_msgSend(textField, "setSendsActionOnEndEditing:", YES);
    return textField;
}
,["CPTextField","CGRect"]), new objj_method(sel_getUid("_setOptions:"), function $CPPredicateEditorRowTemplate___setOptions_(self, _cmd, options)
{
    self._predicateOptions = options;
}
,["void","unsigned"]), new objj_method(sel_getUid("_setModifier:"), function $CPPredicateEditorRowTemplate___setModifier_(self, _cmd, modifier)
{
    self._predicateModifier = modifier;
}
,["void","unsigned"]), new objj_method(sel_getUid("description"), function $CPPredicateEditorRowTemplate__description(self, _cmd)
{
    if (self._templateType == 2)
        return objj_msgSend(CPString, "stringWithFormat:", "<%@ %p %@>", objj_msgSend(self, "className"), self, objj_msgSend(objj_msgSend(self, "compoundTypes"), "componentsJoinedByString:", ", "));
    else if (self._templateType == 1 && self._rightIsWildcard)
        return objj_msgSend(CPString, "stringWithFormat:", "<%@ %p [%@] [%@] %d>", objj_msgSend(self, "className"), self, objj_msgSend(objj_msgSend(self, "leftExpressions"), "componentsJoinedByString:", ", "), objj_msgSend(objj_msgSend(self, "operators"), "componentsJoinedByString:", ", "), objj_msgSend(self, "rightExpressionAttributeType"));
    else
        return objj_msgSend(CPString, "stringWithFormat:", "<%@ %p [%@] [%@] [%@]>", objj_msgSend(self, "className"), self, objj_msgSend(objj_msgSend(self, "leftExpressions"), "componentsJoinedByString:", ", "), objj_msgSend(objj_msgSend(self, "operators"), "componentsJoinedByString:", ", "), objj_msgSend(objj_msgSend(self, "rightExpressions"), "componentsJoinedByString:", ", "));
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_bestMatchForPredicate:inTemplates:quality:"), function $CPPredicateEditorRowTemplate___bestMatchForPredicate_inTemplates_quality_(self, _cmd, predicate, templates, quality)
{
    var count = objj_msgSend(templates, "count"),
        match_value = 0,
        templateIndex = CPNotFound,
        i;
    for (i = 0; i < count; i++)
    {
        var template = objj_msgSend(templates, "objectAtIndex:", i),
            amatch = objj_msgSend(template, "matchForPredicate:", predicate);
        if (amatch > match_value)
        {
            templateIndex = i;
            match_value = amatch;
        }
    }
    if (templateIndex == CPNotFound)
    {
        objj_msgSend(CPException, "raise:reason:", CPRangeException, "Unable to find template matching predicate: " + objj_msgSend(predicate, "predicateFormat"));
        return nil;
    }
    return objj_msgSend(templates, "objectAtIndex:", templateIndex);
}
,["id","CPPredicate","CPArray","double"]), new objj_method(sel_getUid("_operatorsForAttributeType:"), function $CPPredicateEditorRowTemplate___operatorsForAttributeType_(self, _cmd, attributeType)
{
    var operators_array = objj_msgSend(CPMutableArray, "array");
    switch(attributeType) {
    case CPInteger16AttributeType:
        objj_msgSend(operators_array, "addObjects:", 4, 5, 0, 2, 1, 3);
        break;
    case CPInteger32AttributeType:
        objj_msgSend(operators_array, "addObjects:", 4, 5, 0, 2, 1, 3);
        break;
    case CPInteger64AttributeType:
        objj_msgSend(operators_array, "addObjects:", 4, 5, 0, 2, 1, 3);
        break;
    case CPDecimalAttributeType:
        objj_msgSend(operators_array, "addObjects:", 4, 5, 0, 2, 1, 3);
        break;
    case CPDoubleAttributeType:
        objj_msgSend(operators_array, "addObjects:", 4, 5, 0, 2, 1, 3);
        break;
    case CPFloatAttributeType:
        objj_msgSend(operators_array, "addObjects:", 4, 5, 0, 2, 1, 3);
        break;
    case CPStringAttributeType:
        objj_msgSend(operators_array, "addObjects:", 99, 4, 5, 8, 9);
        break;
    case CPBooleanAttributeType:
        objj_msgSend(operators_array, "addObjects:", 4, 5);
        break;
    case CPDateAttributeType:
        objj_msgSend(operators_array, "addObjects:", 4, 5, 0, 2, 1, 3);
        break;
default:
        CPLogConsole("Cannot create operators for an CPAttributeType " + attributeType);
        break;
    }
    return operators_array;
}
,["id","CPAttributeType"])]);
}var CPPredicateTemplateTypeKey = "CPPredicateTemplateType",
    CPPredicateTemplateOptionsKey = "CPPredicateTemplateOptions",
    CPPredicateTemplateModifierKey = "CPPredicateTemplateModifier",
    CPPredicateTemplateLeftAttributeTypeKey = "CPPredicateTemplateLeftAttributeType",
    CPPredicateTemplateRightAttributeTypeKey = "CPPredicateTemplateRightAttributeType",
    CPPredicateTemplateLeftIsWildcardKey = "CPPredicateTemplateLeftIsWildcard",
    CPPredicateTemplateRightIsWildcardKey = "CPPredicateTemplateRightIsWildcard",
    CPPredicateTemplateViewsKey = "CPPredicateTemplateViews";
{
var the_class = objj_getClass("CPPredicateEditorRowTemplate")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPPredicateEditorRowTemplate\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPPredicateEditorRowTemplate__initWithCoder_(self, _cmd, coder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditorRowTemplate").super_class }, "init");
    if (self != nil)
    {
        self._templateType = objj_msgSend(coder, "decodeIntForKey:", CPPredicateTemplateTypeKey);
        self._predicateOptions = objj_msgSend(coder, "decodeIntForKey:", CPPredicateTemplateOptionsKey);
        self._predicateModifier = objj_msgSend(coder, "decodeIntForKey:", CPPredicateTemplateModifierKey);
        self._leftAttributeType = objj_msgSend(coder, "decodeIntForKey:", CPPredicateTemplateLeftAttributeTypeKey);
        self._rightAttributeType = objj_msgSend(coder, "decodeIntForKey:", CPPredicateTemplateRightAttributeTypeKey);
        self._leftIsWildcard = objj_msgSend(coder, "decodeBoolForKey:", CPPredicateTemplateLeftIsWildcardKey);
        self._rightIsWildcard = objj_msgSend(coder, "decodeBoolForKey:", CPPredicateTemplateRightIsWildcardKey);
        self._views = objj_msgSend(coder, "decodeObjectForKey:", CPPredicateTemplateViewsKey);
        if (self._templateType == 1 && self._leftIsWildcard == NO)
        {
            var itemArray = objj_msgSend(self._views[0], "itemArray"),
                count = objj_msgSend(itemArray, "count");
            for (var i = 0; i < count; i++)
            {
                var item = itemArray[i];
                if (objj_msgSend(item, "representedObject") == nil)
                {
                    var exp = objj_msgSend(CPExpression, "expressionForKeyPath:", objj_msgSend(item, "title"));
                    objj_msgSend(item, "setRepresentedObject:", exp);
                }
            }
        }
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPPredicateEditorRowTemplate__encodeWithCoder_(self, _cmd, coder)
{
    objj_msgSend(coder, "encodeInt:forKey:", self._templateType, CPPredicateTemplateTypeKey);
    objj_msgSend(coder, "encodeInt:forKey:", self._predicateOptions, CPPredicateTemplateOptionsKey);
    objj_msgSend(coder, "encodeInt:forKey:", self._predicateModifier, CPPredicateTemplateModifierKey);
    objj_msgSend(coder, "encodeInt:forKey:", self._leftAttributeType, CPPredicateTemplateLeftAttributeTypeKey);
    objj_msgSend(coder, "encodeInt:forKey:", self._rightAttributeType, CPPredicateTemplateRightAttributeTypeKey);
    objj_msgSend(coder, "encodeBool:forKey:", self._leftIsWildcard, CPPredicateTemplateLeftIsWildcardKey);
    objj_msgSend(coder, "encodeBool:forKey:", self._rightIsWildcard, CPPredicateTemplateRightIsWildcardKey);
    objj_msgSend(coder, "encodeObject:forKey:", self._views, CPPredicateTemplateViewsKey);
}
,["void","CPCoder"])]);
}{
var the_class = objj_getClass("CPDatePicker")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDatePicker\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("copy"), function $CPDatePicker__copy(self, _cmd)
{
    var ret = objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "alloc"), "initWithFrame:", objj_msgSend(self, "frame"));
    objj_msgSend(ret, "setTextFont:", objj_msgSend(self, "textFont"));
    objj_msgSend(ret, "setMinDate:", objj_msgSend(self, "minDate"));
    objj_msgSend(ret, "setMaxDate:", objj_msgSend(self, "maxDate"));
    objj_msgSend(ret, "setTimeInterval:", objj_msgSend(self, "timeInterval"));
    objj_msgSend(ret, "setDatePickerMode:", objj_msgSend(self, "datePickerMode"));
    objj_msgSend(ret, "setDatePickerElements:", objj_msgSend(self, "datePickerElements"));
    objj_msgSend(ret, "setDatePickerStyle:", objj_msgSend(self, "datePickerStyle"));
    objj_msgSend(ret, "setLocale:", objj_msgSend(self, "locale"));
    objj_msgSend(ret, "setDateValue:", objj_msgSend(self, "dateValue"));
    objj_msgSend(ret, "setBackgroundColor:", objj_msgSend(self, "backgroundColor"));
    objj_msgSend(ret, "setDrawsBackground:", objj_msgSend(self, "drawsBackground"));
    objj_msgSend(ret, "setBordered:", objj_msgSend(self, "isBordered"));
    objj_msgSend(ret, "_init");
    return ret;
}
,["id"])]);
}