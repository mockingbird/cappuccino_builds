@STATIC;1.0;I;24;Foundation/CPPredicate.ji;12;CPCheckBox.ji;15;CPPopUpButton.ji;12;CPMenuItem.ji;13;CPTextField.ji;14;CPDatePicker.jt;41808;objj_executeFile("Foundation/CPPredicate.j", NO);objj_executeFile("CPCheckBox.j", YES);objj_executeFile("CPPopUpButton.j", YES);objj_executeFile("CPMenuItem.j", YES);objj_executeFile("CPTextField.j", YES);objj_executeFile("CPDatePicker.j", YES);CPUndefinedAttributeType = 0;
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
        var leftView = (self == null ? null : self.isa.objj_msgSend1(self, "_viewFromExpressions:", leftExpressions)),
            rightView = (self == null ? null : self.isa.objj_msgSend1(self, "_viewFromExpressions:", rightExpressions)),
            middleView = (self == null ? null : self.isa.objj_msgSend1(self, "_viewFromOperatorTypes:", operators));
        self._views = ((___r1 = CPArray.isa.objj_msgSend0(CPArray, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithObjects:", leftView, middleView, rightView));
    }
    return self;
    var ___r1;
}
,["id","CPArray","CPArray","int","CPArray","int"]), new objj_method(sel_getUid("initWithLeftExpressions:rightExpressionAttributeType:modifier:operators:options:"), function $CPPredicateEditorRowTemplate__initWithLeftExpressions_rightExpressionAttributeType_modifier_operators_options_(self, _cmd, leftExpressions, attributeType, modifier, operators, options)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditorRowTemplate").super_class }, "init");
    if (self != nil)
    {
        var leftView = (self == null ? null : self.isa.objj_msgSend1(self, "_viewFromExpressions:", leftExpressions)),
            middleView = (self == null ? null : self.isa.objj_msgSend1(self, "_viewFromOperatorTypes:", operators)),
            rightView = (self == null ? null : self.isa.objj_msgSend1(self, "_viewFromAttributeType:", attributeType));
        self._templateType = 1;
        self._leftIsWildcard = NO;
        self._rightIsWildcard = YES;
        self._leftAttributeType = 0;
        self._rightAttributeType = attributeType;
        self._predicateModifier = modifier;
        self._predicateOptions = options;
        self._views = ((___r1 = CPArray.isa.objj_msgSend0(CPArray, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithObjects:", leftView, middleView, rightView));
    }
    return self;
    var ___r1;
}
,["id","CPArray","CPAttributeType","CPComparisonPredicateModifier","CPArray","int"]), new objj_method(sel_getUid("initWithCompoundTypes:"), function $CPPredicateEditorRowTemplate__initWithCompoundTypes_(self, _cmd, compoundTypes)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPredicateEditorRowTemplate").super_class }, "init");
    if (self != nil)
    {
        var leftView = (self == null ? null : self.isa.objj_msgSend1(self, "_viewFromCompoundTypes:", compoundTypes)),
            rightView = ((___r1 = CPPopUpButton.isa.objj_msgSend0(CPPopUpButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        (rightView == null ? null : rightView.isa.objj_msgSend1(rightView, "addItemWithTitle:", "of the following are true"));
        self._templateType = 2;
        self._leftIsWildcard = NO;
        self._rightIsWildcard = NO;
        self._rightAttributeType = 0;
        self._views = ((___r1 = CPArray.isa.objj_msgSend0(CPArray, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithObjects:", leftView, rightView));
    }
    return self;
    var ___r1;
}
,["id","CPArray"]), new objj_method(sel_getUid("matchForPredicate:"), function $CPPredicateEditorRowTemplate__matchForPredicate_(self, _cmd, predicate)
{
    if (self.isa.objj_msgSend0(self, "_templateType") == 2 && (predicate == null ? null : predicate.isa.objj_msgSend1(predicate, "isKindOfClass:", CPCompoundPredicate.isa.objj_msgSend0(CPCompoundPredicate, "class"))))
    {
        if (((___r1 = self.isa.objj_msgSend0(self, "compoundTypes")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsObject:", (predicate == null ? null : predicate.isa.objj_msgSend0(predicate, "compoundPredicateType")))))
            return 1;
    }
    else if (self.isa.objj_msgSend0(self, "_templateType") == 1 && (predicate == null ? null : predicate.isa.objj_msgSend1(predicate, "isKindOfClass:", CPComparisonPredicate.isa.objj_msgSend0(CPComparisonPredicate, "class"))))
    {
        if (!self._leftIsWildcard && !((___r1 = self.isa.objj_msgSend0(self, "leftExpressions")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsObject:", (predicate == null ? null : predicate.isa.objj_msgSend0(predicate, "leftExpression")))))
            return 0;
        if (!((___r1 = self.isa.objj_msgSend0(self, "operators")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsObject:", (predicate == null ? null : predicate.isa.objj_msgSend0(predicate, "predicateOperatorType")))))
            return 0;
        if (!self._rightIsWildcard && !((___r1 = self.isa.objj_msgSend0(self, "rightExpressions")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsObject:", (predicate == null ? null : predicate.isa.objj_msgSend0(predicate, "rightExpression")))))
            return 0;
        return 1;
    }
    return 0;
    var ___r1;
}
,["double","CPPredicate"]), new objj_method(sel_getUid("templateViews"), function $CPPredicateEditorRowTemplate__templateViews(self, _cmd)
{
    return self._views;
}
,["CPArray"]), new objj_method(sel_getUid("setPredicate:"), function $CPPredicateEditorRowTemplate__setPredicate_(self, _cmd, predicate)
{
    if (self._templateType == 2)
        self.isa.objj_msgSend1(self, "_setCompoundPredicate:", predicate);
    else
        self.isa.objj_msgSend1(self, "_setComparisonPredicate:", predicate);
}
,["void","CPPredicate"]), new objj_method(sel_getUid("displayableSubpredicatesOfPredicate:"), function $CPPredicateEditorRowTemplate__displayableSubpredicatesOfPredicate_(self, _cmd, predicate)
{
    if ((predicate == null ? null : predicate.isa.objj_msgSend1(predicate, "isKindOfClass:", CPCompoundPredicate.isa.objj_msgSend0(CPCompoundPredicate, "class"))))
    {
        var subpredicates = (predicate == null ? null : predicate.isa.objj_msgSend0(predicate, "subpredicates"));
        if ((subpredicates == null ? null : subpredicates.isa.objj_msgSend0(subpredicates, "count")) == 0)
            return nil;
        return subpredicates;
    }
    return nil;
}
,["CPArray","CPPredicate"]), new objj_method(sel_getUid("predicateWithSubpredicates:"), function $CPPredicateEditorRowTemplate__predicateWithSubpredicates_(self, _cmd, subpredicates)
{
    if (self._templateType == 2)
    {
        var type = ((___r1 = ((___r2 = self._views[0]), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "selectedItem"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "representedObject"));
        return ((___r1 = CPCompoundPredicate.isa.objj_msgSend0(CPCompoundPredicate, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithType:subpredicates:", type, subpredicates));
    }
    if (self._templateType == 1)
    {
        var lhs = self.isa.objj_msgSend0(self, "_leftExpression"),
            rhs = self.isa.objj_msgSend0(self, "_rightExpression"),
            operator = ((___r1 = ((___r2 = self._views[1]), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "selectedItem"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "representedObject"));
        return CPComparisonPredicate.isa.objj_msgSend(CPComparisonPredicate, "predicateWithLeftExpression:rightExpression:modifier:type:options:", lhs, rhs, self.isa.objj_msgSend0(self, "modifier"), operator, self.isa.objj_msgSend0(self, "options"));
    }
    return nil;
    var ___r1, ___r2;
}
,["CPPredicate","CPArray"]), new objj_method(sel_getUid("leftExpressions"), function $CPPredicateEditorRowTemplate__leftExpressions(self, _cmd)
{
    if (self._templateType == 1 && !self._leftIsWildcard)
    {
        var view = ((___r1 = self._views), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", 0));
        return ((___r1 = (view == null ? null : view.isa.objj_msgSend0(view, "itemArray"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "representedObject"));
    }
    return nil;
    var ___r1;
}
,["CPArray"]), new objj_method(sel_getUid("rightExpressions"), function $CPPredicateEditorRowTemplate__rightExpressions(self, _cmd)
{
    if (self._templateType == 1 && !self._rightIsWildcard)
    {
        var view = ((___r1 = self._views), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", 2));
        return ((___r1 = (view == null ? null : view.isa.objj_msgSend0(view, "itemArray"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "representedObject"));
    }
    return nil;
    var ___r1;
}
,["CPArray"]), new objj_method(sel_getUid("compoundTypes"), function $CPPredicateEditorRowTemplate__compoundTypes(self, _cmd)
{
    if (self._templateType == 2)
    {
        var view = ((___r1 = self._views), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", 0));
        return ((___r1 = (view == null ? null : view.isa.objj_msgSend0(view, "itemArray"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "representedObject"));
    }
    return nil;
    var ___r1;
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
        var view = ((___r1 = self._views), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", 1));
        return ((___r1 = (view == null ? null : view.isa.objj_msgSend0(view, "itemArray"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "representedObject"));
    }
    return nil;
    var ___r1;
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
    var left = ((___r1 = self._views), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", 0)),
        type = (predicate == null ? null : predicate.isa.objj_msgSend0(predicate, "compoundPredicateType")),
        index = (left == null ? null : left.isa.objj_msgSend1(left, "indexOfItemWithRepresentedObject:", type));
    (left == null ? null : left.isa.objj_msgSend1(left, "selectItemAtIndex:", index));
    var ___r1;
}
,["void","CPCompoundPredicate"]), new objj_method(sel_getUid("_setComparisonPredicate:"), function $CPPredicateEditorRowTemplate___setComparisonPredicate_(self, _cmd, predicate)
{
    var left = ((___r1 = self._views), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", 0)),
        middle = ((___r1 = self._views), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", 1)),
        right = ((___r1 = self._views), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", 2)),
        leftExpression = (predicate == null ? null : predicate.isa.objj_msgSend0(predicate, "leftExpression")),
        rightExpression = (predicate == null ? null : predicate.isa.objj_msgSend0(predicate, "rightExpression")),
        operator = (predicate == null ? null : predicate.isa.objj_msgSend0(predicate, "predicateOperatorType"));
    if (self._leftIsWildcard)
        (left == null ? null : left.isa.objj_msgSend1(left, "setObjectValue:", (leftExpression == null ? null : leftExpression.isa.objj_msgSend0(leftExpression, "constantValue"))));
    else
    {
        var index = (left == null ? null : left.isa.objj_msgSend1(left, "indexOfItemWithRepresentedObject:", leftExpression));
        (left == null ? null : left.isa.objj_msgSend1(left, "selectItemAtIndex:", index));
    }
    var op_index = (middle == null ? null : middle.isa.objj_msgSend1(middle, "indexOfItemWithRepresentedObject:", operator));
    (middle == null ? null : middle.isa.objj_msgSend1(middle, "selectItemAtIndex:", op_index));
    if (self._rightIsWildcard)
        (right == null ? null : right.isa.objj_msgSend1(right, "setObjectValue:", (rightExpression == null ? null : rightExpression.isa.objj_msgSend0(rightExpression, "constantValue"))));
    else
    {
        var index = (right == null ? null : right.isa.objj_msgSend1(right, "indexOfItemWithRepresentedObject:", rightExpression));
        (right == null ? null : right.isa.objj_msgSend1(right, "selectItemAtIndex:", index));
    }
    var ___r1;
}
,["void","CPComparisonPredicate"]), new objj_method(sel_getUid("_leftExpression"), function $CPPredicateEditorRowTemplate___leftExpression(self, _cmd)
{
    return self.isa.objj_msgSend2(self, "_expressionFromView:forAttributeType:", self._views[0], self._leftAttributeType);
}
,["CPExpression"]), new objj_method(sel_getUid("_rightExpression"), function $CPPredicateEditorRowTemplate___rightExpression(self, _cmd)
{
    return self.isa.objj_msgSend2(self, "_expressionFromView:forAttributeType:", self._views[2], self._rightAttributeType);
}
,["CPExpression"]), new objj_method(sel_getUid("_expressionFromView:forAttributeType:"), function $CPPredicateEditorRowTemplate___expressionFromView_forAttributeType_(self, _cmd, aView, attributeType)
{
    if (attributeType == 0)
        return ((___r1 = (aView == null ? null : aView.isa.objj_msgSend0(aView, "selectedItem"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "representedObject"));
    var value;
    if (attributeType >= CPInteger16AttributeType && attributeType <= CPFloatAttributeType)
        value = (aView == null ? null : aView.isa.objj_msgSend0(aView, "intValue"));
    else if (attributeType == CPBooleanAttributeType)
        value = (aView == null ? null : aView.isa.objj_msgSend0(aView, "state"));
    else
        value = (aView == null ? null : aView.isa.objj_msgSend0(aView, "stringValue"));
    return CPExpression.isa.objj_msgSend1(CPExpression, "expressionForConstantValue:", value);
    var ___r1;
}
,["CPExpression","CPView","CPAttributeType"]), new objj_method(sel_getUid("_rowType"), function $CPPredicateEditorRowTemplate___rowType(self, _cmd)
{
    return self._templateType - 1;
}
,["int"]), new objj_method(sel_getUid("copy"), function $CPPredicateEditorRowTemplate__copy(self, _cmd)
{
    var views = CPArray.isa.objj_msgSend0(CPArray, "array");
    var copy = ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "class")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "_setTemplateType:", self._templateType));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "_setOptions:", self._predicateOptions));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "_setModifier:", self._predicateModifier));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "_setLeftAttributeType:", self._leftAttributeType));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "_setRightAttributeType:", self._rightAttributeType));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "setLeftIsWildcard:", self._leftIsWildcard));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "setRightIsWildcard:", self._rightIsWildcard));
    ((___r1 = self._views), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "enumerateObjectsUsingBlock:", function(aView, idx, stop)
    {
        var vcopy;
        if ((aView == null ? null : aView.isa.objj_msgSend1(aView, "implementsSelector:", sel_getUid("copy"))))
        {
            vcopy = (aView == null ? null : aView.isa.objj_msgSend0(aView, "copy"));
        }
        else
        {
            vcopy = CPKeyedUnarchiver.isa.objj_msgSend1(CPKeyedUnarchiver, "unarchiveObjectWithData:", CPKeyedArchiver.isa.objj_msgSend1(CPKeyedArchiver, "archivedDataWithRootObject:", aView));
        }
        (views == null ? null : views.isa.objj_msgSend1(views, "addObject:", vcopy));
    }));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "setTemplateViews:", views));
    return copy;
    var ___r1, ___r2;
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
        value = CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "unknown compound predicate type %d", predicateType);
    }
    return value;
}
,["id","unsigned int"]), new objj_method(sel_getUid("_displayValueForConstantValue:"), function $CPPredicateEditorRowTemplate___displayValueForConstantValue_(self, _cmd, value)
{
    return (value == null ? null : value.isa.objj_msgSend0(value, "description"));
}
,["id","id"]), new objj_method(sel_getUid("_displayValueForKeyPath:"), function $CPPredicateEditorRowTemplate___displayValueForKeyPath_(self, _cmd, keyPath)
{
    return keyPath;
}
,["id","CPString"]), new objj_method(sel_getUid("_viewFromExpressions:"), function $CPPredicateEditorRowTemplate___viewFromExpressions_(self, _cmd, expressions)
{
    var popup = ((___r1 = CPPopUpButton.isa.objj_msgSend0(CPPopUpButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, 100, 18))),
        count = (expressions == null ? null : expressions.isa.objj_msgSend0(expressions, "count"));
    for (var i = 0; i < count; i++)
    {
        var exp = expressions[i],
            type = (exp == null ? null : exp.isa.objj_msgSend0(exp, "expressionType")),
            title;
        switch(type) {
        case CPKeyPathExpressionType:
            title = self.isa.objj_msgSend1(self, "_displayValueForKeyPath:", (exp == null ? null : exp.isa.objj_msgSend0(exp, "keyPath")));
            break;
        case CPConstantValueExpressionType:
            title = self.isa.objj_msgSend1(self, "_displayValueForConstantValue:", (exp == null ? null : exp.isa.objj_msgSend0(exp, "constantValue")));
            break;
default:
            CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "Invalid Expression type " + type);
            break;
        }
        var item = ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", title, nil, ""));
        (item == null ? null : item.isa.objj_msgSend1(item, "setRepresentedObject:", exp));
        (popup == null ? null : popup.isa.objj_msgSend1(popup, "addItem:", item));
    }
    (popup == null ? null : popup.isa.objj_msgSend0(popup, "sizeToFit"));
    return popup;
    var ___r1;
}
,["CPPopUpButton","CPArray"]), new objj_method(sel_getUid("_viewFromOperatorTypes:"), function $CPPredicateEditorRowTemplate___viewFromOperatorTypes_(self, _cmd, operators)
{
    var popup = ((___r1 = CPPopUpButton.isa.objj_msgSend0(CPPopUpButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, 100, 18))),
        count = (operators == null ? null : operators.isa.objj_msgSend0(operators, "count"));
    for (var i = 0; i < count; i++)
    {
        var op = operators[i],
            title = self.isa.objj_msgSend1(self, "_displayValueForPredicateOperator:", op),
            item = ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", title, nil, ""));
        (item == null ? null : item.isa.objj_msgSend1(item, "setRepresentedObject:", op));
        (popup == null ? null : popup.isa.objj_msgSend1(popup, "addItem:", item));
    }
    (popup == null ? null : popup.isa.objj_msgSend0(popup, "sizeToFit"));
    return popup;
    var ___r1;
}
,["CPPopUpButton","CPArray"]), new objj_method(sel_getUid("_viewFromCompoundTypes:"), function $CPPredicateEditorRowTemplate___viewFromCompoundTypes_(self, _cmd, compoundTypes)
{
    var popup = ((___r1 = CPPopUpButton.isa.objj_msgSend0(CPPopUpButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, 100, 18))),
        count = (compoundTypes == null ? null : compoundTypes.isa.objj_msgSend0(compoundTypes, "count"));
    for (var i = 0; i < count; i++)
    {
        var type = compoundTypes[i],
            title = self.isa.objj_msgSend1(self, "_displayValueForCompoundPredicateType:", type),
            item = ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", title, nil, ""));
        (item == null ? null : item.isa.objj_msgSend1(item, "setRepresentedObject:", type));
        (popup == null ? null : popup.isa.objj_msgSend1(popup, "addItem:", item));
    }
    (popup == null ? null : popup.isa.objj_msgSend0(popup, "sizeToFit"));
    return popup;
    var ___r1;
}
,["CPView","CPArray"]), new objj_method(sel_getUid("_viewFromAttributeType:"), function $CPPredicateEditorRowTemplate___viewFromAttributeType_(self, _cmd, attributeType)
{
    var view;
    if (attributeType >= CPInteger16AttributeType && attributeType <= CPFloatAttributeType)
    {
        view = self.isa.objj_msgSend1(self, "_textFieldWithFrame:", CGRectMake(0, 0, 50, 26));
    }
    else if (attributeType == CPStringAttributeType)
    {
        view = self.isa.objj_msgSend1(self, "_textFieldWithFrame:", CGRectMake(0, 0, 150, 26));
    }
    else if (attributeType == CPBooleanAttributeType)
    {
        view = ((___r1 = CPCheckBox.isa.objj_msgSend0(CPCheckBox, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, 50, 26)));
    }
    else if (attributeType == CPDateAttributeType)
        view = ((___r1 = CPDatePicker.isa.objj_msgSend0(CPDatePicker, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, 180, 26)));
    else
        return nil;
    (view == null ? null : view.isa.objj_msgSend1(view, "setTag:", attributeType));
    return view;
    var ___r1;
}
,["CPView","CPAttributeType"]), new objj_method(sel_getUid("_textFieldWithFrame:"), function $CPPredicateEditorRowTemplate___textFieldWithFrame_(self, _cmd, frame)
{
    var textField = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", frame));
    (textField == null ? null : textField.isa.objj_msgSend1(textField, "setBezeled:", YES));
    (textField == null ? null : textField.isa.objj_msgSend1(textField, "setBezelStyle:", CPTextFieldSquareBezel));
    (textField == null ? null : textField.isa.objj_msgSend1(textField, "setBordered:", YES));
    (textField == null ? null : textField.isa.objj_msgSend1(textField, "setEditable:", YES));
    (textField == null ? null : textField.isa.objj_msgSend1(textField, "setFont:", CPFont.isa.objj_msgSend1(CPFont, "systemFontOfSize:", 10)));
    (textField == null ? null : textField.isa.objj_msgSend1(textField, "setSendsActionOnEndEditing:", YES));
    return textField;
    var ___r1;
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
        return CPString.isa.objj_msgSend(CPString, "stringWithFormat:", "<%@ %p %@>", self.isa.objj_msgSend0(self, "className"), self, ((___r1 = self.isa.objj_msgSend0(self, "compoundTypes")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "componentsJoinedByString:", ", ")));
    else if (self._templateType == 1 && self._rightIsWildcard)
        return CPString.isa.objj_msgSend(CPString, "stringWithFormat:", "<%@ %p [%@] [%@] %d>", self.isa.objj_msgSend0(self, "className"), self, ((___r1 = self.isa.objj_msgSend0(self, "leftExpressions")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "componentsJoinedByString:", ", ")), ((___r1 = self.isa.objj_msgSend0(self, "operators")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "componentsJoinedByString:", ", ")), self.isa.objj_msgSend0(self, "rightExpressionAttributeType"));
    else
        return CPString.isa.objj_msgSend(CPString, "stringWithFormat:", "<%@ %p [%@] [%@] [%@]>", self.isa.objj_msgSend0(self, "className"), self, ((___r1 = self.isa.objj_msgSend0(self, "leftExpressions")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "componentsJoinedByString:", ", ")), ((___r1 = self.isa.objj_msgSend0(self, "operators")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "componentsJoinedByString:", ", ")), ((___r1 = self.isa.objj_msgSend0(self, "rightExpressions")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "componentsJoinedByString:", ", ")));
    var ___r1;
}
,["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_bestMatchForPredicate:inTemplates:quality:"), function $CPPredicateEditorRowTemplate___bestMatchForPredicate_inTemplates_quality_(self, _cmd, predicate, templates, quality)
{
    var count = (templates == null ? null : templates.isa.objj_msgSend0(templates, "count")),
        match_value = 0,
        templateIndex = CPNotFound,
        i;
    for (i = 0; i < count; i++)
    {
        var template = (templates == null ? null : templates.isa.objj_msgSend1(templates, "objectAtIndex:", i)),
            amatch = (template == null ? null : template.isa.objj_msgSend1(template, "matchForPredicate:", predicate));
        if (amatch > match_value)
        {
            templateIndex = i;
            match_value = amatch;
        }
    }
    if (templateIndex == CPNotFound)
    {
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPRangeException, "Unable to find template matching predicate: " + (predicate == null ? null : predicate.isa.objj_msgSend0(predicate, "predicateFormat")));
        return nil;
    }
    return (templates == null ? null : templates.isa.objj_msgSend1(templates, "objectAtIndex:", templateIndex));
}
,["id","CPPredicate","CPArray","double"]), new objj_method(sel_getUid("_operatorsForAttributeType:"), function $CPPredicateEditorRowTemplate___operatorsForAttributeType_(self, _cmd, attributeType)
{
    var operators_array = CPMutableArray.isa.objj_msgSend0(CPMutableArray, "array");
    switch(attributeType) {
    case CPInteger16AttributeType:
        (operators_array == null ? null : operators_array.isa.objj_msgSend(operators_array, "addObjects:", 4, 5, 0, 2, 1, 3));
        break;
    case CPInteger32AttributeType:
        (operators_array == null ? null : operators_array.isa.objj_msgSend(operators_array, "addObjects:", 4, 5, 0, 2, 1, 3));
        break;
    case CPInteger64AttributeType:
        (operators_array == null ? null : operators_array.isa.objj_msgSend(operators_array, "addObjects:", 4, 5, 0, 2, 1, 3));
        break;
    case CPDecimalAttributeType:
        (operators_array == null ? null : operators_array.isa.objj_msgSend(operators_array, "addObjects:", 4, 5, 0, 2, 1, 3));
        break;
    case CPDoubleAttributeType:
        (operators_array == null ? null : operators_array.isa.objj_msgSend(operators_array, "addObjects:", 4, 5, 0, 2, 1, 3));
        break;
    case CPFloatAttributeType:
        (operators_array == null ? null : operators_array.isa.objj_msgSend(operators_array, "addObjects:", 4, 5, 0, 2, 1, 3));
        break;
    case CPStringAttributeType:
        (operators_array == null ? null : operators_array.isa.objj_msgSend(operators_array, "addObjects:", 99, 4, 5, 8, 9));
        break;
    case CPBooleanAttributeType:
        (operators_array == null ? null : operators_array.isa.objj_msgSend2(operators_array, "addObjects:", 4, 5));
        break;
    case CPDateAttributeType:
        (operators_array == null ? null : operators_array.isa.objj_msgSend(operators_array, "addObjects:", 4, 5, 0, 2, 1, 3));
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
        self._templateType = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeIntForKey:", CPPredicateTemplateTypeKey));
        self._predicateOptions = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeIntForKey:", CPPredicateTemplateOptionsKey));
        self._predicateModifier = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeIntForKey:", CPPredicateTemplateModifierKey));
        self._leftAttributeType = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeIntForKey:", CPPredicateTemplateLeftAttributeTypeKey));
        self._rightAttributeType = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeIntForKey:", CPPredicateTemplateRightAttributeTypeKey));
        self._leftIsWildcard = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeBoolForKey:", CPPredicateTemplateLeftIsWildcardKey));
        self._rightIsWildcard = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeBoolForKey:", CPPredicateTemplateRightIsWildcardKey));
        self._views = (coder == null ? null : coder.isa.objj_msgSend1(coder, "decodeObjectForKey:", CPPredicateTemplateViewsKey));
        if (self._templateType == 1 && self._leftIsWildcard == NO)
        {
            var itemArray = ((___r1 = self._views[0]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "itemArray")),
                count = (itemArray == null ? null : itemArray.isa.objj_msgSend0(itemArray, "count"));
            for (var i = 0; i < count; i++)
            {
                var item = itemArray[i];
                if ((item == null ? null : item.isa.objj_msgSend0(item, "representedObject")) == nil)
                {
                    var exp = CPExpression.isa.objj_msgSend1(CPExpression, "expressionForKeyPath:", (item == null ? null : item.isa.objj_msgSend0(item, "title")));
                    (item == null ? null : item.isa.objj_msgSend1(item, "setRepresentedObject:", exp));
                }
            }
        }
    }
    return self;
    var ___r1;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPPredicateEditorRowTemplate__encodeWithCoder_(self, _cmd, coder)
{
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeInt:forKey:", self._templateType, CPPredicateTemplateTypeKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeInt:forKey:", self._predicateOptions, CPPredicateTemplateOptionsKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeInt:forKey:", self._predicateModifier, CPPredicateTemplateModifierKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeInt:forKey:", self._leftAttributeType, CPPredicateTemplateLeftAttributeTypeKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeInt:forKey:", self._rightAttributeType, CPPredicateTemplateRightAttributeTypeKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeBool:forKey:", self._leftIsWildcard, CPPredicateTemplateLeftIsWildcardKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeBool:forKey:", self._rightIsWildcard, CPPredicateTemplateRightIsWildcardKey));
    (coder == null ? null : coder.isa.objj_msgSend2(coder, "encodeObject:forKey:", self._views, CPPredicateTemplateViewsKey));
}
,["void","CPCoder"])]);
}{
var the_class = objj_getClass("CPDatePicker")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDatePicker\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("copy"), function $CPDatePicker__copy(self, _cmd)
{
    var ret = ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "class")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", self.isa.objj_msgSend0(self, "frame")));
    (ret == null ? null : ret.isa.objj_msgSend1(ret, "setTextFont:", self.isa.objj_msgSend0(self, "textFont")));
    (ret == null ? null : ret.isa.objj_msgSend1(ret, "setMinDate:", self.isa.objj_msgSend0(self, "minDate")));
    (ret == null ? null : ret.isa.objj_msgSend1(ret, "setMaxDate:", self.isa.objj_msgSend0(self, "maxDate")));
    (ret == null ? null : ret.isa.objj_msgSend1(ret, "setTimeInterval:", self.isa.objj_msgSend0(self, "timeInterval")));
    (ret == null ? null : ret.isa.objj_msgSend1(ret, "setDatePickerMode:", self.isa.objj_msgSend0(self, "datePickerMode")));
    (ret == null ? null : ret.isa.objj_msgSend1(ret, "setDatePickerElements:", self.isa.objj_msgSend0(self, "datePickerElements")));
    (ret == null ? null : ret.isa.objj_msgSend1(ret, "setDatePickerStyle:", self.isa.objj_msgSend0(self, "datePickerStyle")));
    (ret == null ? null : ret.isa.objj_msgSend1(ret, "setLocale:", self.isa.objj_msgSend0(self, "locale")));
    (ret == null ? null : ret.isa.objj_msgSend1(ret, "setDateValue:", self.isa.objj_msgSend0(self, "dateValue")));
    (ret == null ? null : ret.isa.objj_msgSend1(ret, "setBackgroundColor:", self.isa.objj_msgSend0(self, "backgroundColor")));
    (ret == null ? null : ret.isa.objj_msgSend1(ret, "setDrawsBackground:", self.isa.objj_msgSend0(self, "drawsBackground")));
    (ret == null ? null : ret.isa.objj_msgSend1(ret, "setBordered:", self.isa.objj_msgSend0(self, "isBordered")));
    (ret == null ? null : ret.isa.objj_msgSend0(ret, "_init"));
    return ret;
    var ___r1, ___r2;
}
,["id"])]);
}