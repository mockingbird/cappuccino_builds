@STATIC;1.0;t;5996;






{var the_class = objj_allocateClassPair(CPView, "_CPRuleEditorViewSlice"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_ruleEditor"), new objj_ivar("_indentation"), new objj_ivar("_rowIndex"), new objj_ivar("_animationTargetRect"), new objj_ivar("_selected"), new objj_ivar("_lastSelected"), new objj_ivar("_backgroundColor")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("indentation"), function $_CPRuleEditorViewSlice__indentation(self, _cmd)
{ with(self)
{
return _indentation;
}
},["id"]),
new objj_method(sel_getUid("setIndentation:"), function $_CPRuleEditorViewSlice__setIndentation_(self, _cmd, newValue)
{ with(self)
{
_indentation = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("rowIndex"), function $_CPRuleEditorViewSlice__rowIndex(self, _cmd)
{ with(self)
{
return _rowIndex;
}
},["id"]),
new objj_method(sel_getUid("setRowIndex:"), function $_CPRuleEditorViewSlice__setRowIndex_(self, _cmd, newValue)
{ with(self)
{
_rowIndex = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("_animationTargetRect"), function $_CPRuleEditorViewSlice___animationTargetRect(self, _cmd)
{ with(self)
{
return _animationTargetRect;
}
},["id"]),
new objj_method(sel_getUid("_setAnimationTargetRect:"), function $_CPRuleEditorViewSlice___setAnimationTargetRect_(self, _cmd, newValue)
{ with(self)
{
_animationTargetRect = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("_isSelected"), function $_CPRuleEditorViewSlice___isSelected(self, _cmd)
{ with(self)
{
return _selected;
}
},["id"]),
new objj_method(sel_getUid("_setSelected:"), function $_CPRuleEditorViewSlice___setSelected_(self, _cmd, newValue)
{ with(self)
{
_selected = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("_isLastSelected"), function $_CPRuleEditorViewSlice___isLastSelected(self, _cmd)
{ with(self)
{
return _lastSelected;
}
},["id"]),
new objj_method(sel_getUid("_setLastSelected:"), function $_CPRuleEditorViewSlice___setLastSelected_(self, _cmd, newValue)
{ with(self)
{
_lastSelected = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("backgroundColor"), function $_CPRuleEditorViewSlice__backgroundColor(self, _cmd)
{ with(self)
{
return _backgroundColor;
}
},["id"]),
new objj_method(sel_getUid("setBackgroundColor:"), function $_CPRuleEditorViewSlice__setBackgroundColor_(self, _cmd, newValue)
{ with(self)
{
_backgroundColor = newValue;
}
},["void","id"]), new objj_method(sel_getUid("removeFromSuperview"), function $_CPRuleEditorViewSlice__removeFromSuperview(self, _cmd)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorViewSlice").super_class }, "removeFromSuperview");
}
},["void"]), new objj_method(sel_getUid("initWithFrame:ruleEditorView:"), function $_CPRuleEditorViewSlice__initWithFrame_ruleEditorView_(self, _cmd, frame, editor)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorViewSlice").super_class }, "initWithFrame:", frame))
    {
        _ruleEditor = editor;
        _selected = NO;
        _lastSelected = NO;
    }

    return self;
}
},["id","CGRect","id"]), new objj_method(sel_getUid("_setSelected:"), function $_CPRuleEditorViewSlice___setSelected_(self, _cmd, select)
{ with(self)
{
    if (select == _selected)
        return;

    var selector = select ? "setThemeState:" : "unsetThemeState:";
    objj_msgSend(objj_msgSend(self, "subviews"), "makeObjectsPerformSelector:withObject:", CPSelectorFromString(selector), CPThemeStateSelectedDataView);
    _selected = select;
}
},["void","BOOL"]), new objj_method(sel_getUid("drawRect:"), function $_CPRuleEditorViewSlice__drawRect_(self, _cmd, rect)
{ with(self)
{
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"),
        bounds = objj_msgSend(self, "bounds"),
        maxX = CGRectGetWidth(bounds) - 2,
        maxY = CGRectGetHeight(bounds);


    if (objj_msgSend(self, "_isSelected"))
        _backgroundColor = objj_msgSend(_ruleEditor, "_selectedRowColor");
    else
    {
        var colors = objj_msgSend(_ruleEditor, "_backgroundColors"),
            count = objj_msgSend(colors, "count");
        _backgroundColor = objj_msgSend(colors, "objectAtIndex:", (_rowIndex % count));
    }

    CGContextSetFillColor(context, _backgroundColor);
    CGContextFillRect(context, rect);


    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 1, 0);
    CGContextAddLineToPoint(context, maxX, 0);
    CGContextClosePath(context);
    CGContextSetStrokeColor(context, objj_msgSend(_ruleEditor, "_sliceTopBorderColor"));
    CGContextStrokePath(context);


    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 1, maxY - 0.5);
    CGContextAddLineToPoint(context, maxX, maxY - 0.5);
    CGContextClosePath(context);
    var bottomColor = (_rowIndex == objj_msgSend(_ruleEditor, "_lastRow")) ? objj_msgSend(_ruleEditor, "_sliceLastBottomBorderColor") : objj_msgSend(_ruleEditor, "_sliceBottomBorderColor");
    CGContextSetStrokeColor(context, bottomColor);
    CGContextStrokePath(context);
}
},["void","CPRect"]), new objj_method(sel_getUid("mouseDown:"), function $_CPRuleEditorViewSlice__mouseDown_(self, _cmd, theEvent)
{ with(self)
{
    if (editable)
        objj_msgSend(_ruleEditor, "_mouseDownOnSlice:withEvent:", self, theEvent);
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseUp:"), function $_CPRuleEditorViewSlice__mouseUp_(self, _cmd, theEvent)
{ with(self)
{
    if (editable)
        objj_msgSend(_ruleEditor, "_mouseUpOnSlice:withEvent:", self, theEvent);
}
},["void","CPEvent"]), new objj_method(sel_getUid("description"), function $_CPRuleEditorViewSlice__description(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPString, "stringWithFormat:", "<%@ %p index:%d indentation:%d>",objj_msgSend(self, "className"),self,objj_msgSend(self, "rowIndex"),objj_msgSend(self, "indentation"));
}
},["CPString"])]);
}

