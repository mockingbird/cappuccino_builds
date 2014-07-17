@STATIC;1.0;i;8;CPView.jt;7004;objj_executeFile("CPView.j", YES);{var the_class = objj_allocateClassPair(CPView, "_CPRuleEditorViewSlice"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_ruleEditor"), new objj_ivar("_indentation"), new objj_ivar("_rowIndex"), new objj_ivar("_animationTargetRect"), new objj_ivar("_selected"), new objj_ivar("_lastSelected"), new objj_ivar("_backgroundColor"), new objj_ivar("_editable")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("indentation"), function $_CPRuleEditorViewSlice__indentation(self, _cmd)
{
    return self._indentation;
}
,["int"]), new objj_method(sel_getUid("setIndentation:"), function $_CPRuleEditorViewSlice__setIndentation_(self, _cmd, newValue)
{
    self._indentation = newValue;
}
,["void","int"]), new objj_method(sel_getUid("rowIndex"), function $_CPRuleEditorViewSlice__rowIndex(self, _cmd)
{
    return self._rowIndex;
}
,["int"]), new objj_method(sel_getUid("setRowIndex:"), function $_CPRuleEditorViewSlice__setRowIndex_(self, _cmd, newValue)
{
    self._rowIndex = newValue;
}
,["void","int"]), new objj_method(sel_getUid("_animationTargetRect"), function $_CPRuleEditorViewSlice___animationTargetRect(self, _cmd)
{
    return self._animationTargetRect;
}
,["CGRect"]), new objj_method(sel_getUid("_setAnimationTargetRect:"), function $_CPRuleEditorViewSlice___setAnimationTargetRect_(self, _cmd, newValue)
{
    self._animationTargetRect = newValue;
}
,["void","CGRect"]), new objj_method(sel_getUid("_isSelected"), function $_CPRuleEditorViewSlice___isSelected(self, _cmd)
{
    return self._selected;
}
,["BOOL"]), new objj_method(sel_getUid("_setSelected:"), function $_CPRuleEditorViewSlice___setSelected_(self, _cmd, newValue)
{
    self._selected = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("_isLastSelected"), function $_CPRuleEditorViewSlice___isLastSelected(self, _cmd)
{
    return self._lastSelected;
}
,["BOOL"]), new objj_method(sel_getUid("_setLastSelected:"), function $_CPRuleEditorViewSlice___setLastSelected_(self, _cmd, newValue)
{
    self._lastSelected = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("backgroundColor"), function $_CPRuleEditorViewSlice__backgroundColor(self, _cmd)
{
    return self._backgroundColor;
}
,["CPColor"]), new objj_method(sel_getUid("setBackgroundColor:"), function $_CPRuleEditorViewSlice__setBackgroundColor_(self, _cmd, newValue)
{
    self._backgroundColor = newValue;
}
,["void","CPColor"]), new objj_method(sel_getUid("isEditable"), function $_CPRuleEditorViewSlice__isEditable(self, _cmd)
{
    return self._editable;
}
,["BOOL"]), new objj_method(sel_getUid("setEditable:"), function $_CPRuleEditorViewSlice__setEditable_(self, _cmd, newValue)
{
    self._editable = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("removeFromSuperview"), function $_CPRuleEditorViewSlice__removeFromSuperview(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorViewSlice").super_class }, "removeFromSuperview");
}
,["void"]), new objj_method(sel_getUid("initWithFrame:ruleEditorView:"), function $_CPRuleEditorViewSlice__initWithFrame_ruleEditorView_(self, _cmd, frame, editor)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPRuleEditorViewSlice").super_class }, "initWithFrame:", frame))
    {
        self._ruleEditor = editor;
        self._selected = NO;
        self._lastSelected = NO;
    }
    return self;
}
,["id","CGRect","id"]), new objj_method(sel_getUid("_setSelected:"), function $_CPRuleEditorViewSlice___setSelected_(self, _cmd, select)
{
    if (select == self._selected)
        return;
    var selector = select ? sel_getUid("setThemeState:") : sel_getUid("unsetThemeState:");
    ((___r1 = self.isa.objj_msgSend0(self, "subviews")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", selector, CPThemeStateSelectedDataView));
    self._selected = select;
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("drawRect:"), function $_CPRuleEditorViewSlice__drawRect_(self, _cmd, rect)
{
    var context = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort")),
        bounds = self.isa.objj_msgSend0(self, "bounds"),
        maxX = CGRectGetWidth(bounds),
        maxY = CGRectGetHeight(bounds);
    if (self.isa.objj_msgSend0(self, "_isSelected"))
        self._backgroundColor = ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_selectedRowColor"));
    else
    {
        var colors = ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_backgroundColors")),
            count = (colors == null ? null : colors.isa.objj_msgSend0(colors, "count"));
        self._backgroundColor = (colors == null ? null : colors.isa.objj_msgSend1(colors, "objectAtIndex:", self._rowIndex % count));
    }
    CGContextSetFillColor(context, self._backgroundColor);
    CGContextFillRect(context, rect);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, maxX, 0);
    CGContextSetStrokeColor(context, ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_sliceTopBorderColor")));
    CGContextStrokePath(context);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0, maxY);
    CGContextAddLineToPoint(context, maxX, maxY);
    var bottomColor = self._rowIndex == ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_lastRow")) ? ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_sliceLastBottomBorderColor")) : ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_sliceBottomBorderColor"));
    CGContextSetStrokeColor(context, bottomColor);
    CGContextStrokePath(context);
    var ___r1;
}
,["void","CGRect"]), new objj_method(sel_getUid("mouseDown:"), function $_CPRuleEditorViewSlice__mouseDown_(self, _cmd, theEvent)
{
    if (self._editable)
        ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "_mouseDownOnSlice:withEvent:", self, theEvent));
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseUp:"), function $_CPRuleEditorViewSlice__mouseUp_(self, _cmd, theEvent)
{
    if (self._editable)
        ((___r1 = self._ruleEditor), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "_mouseUpOnSlice:withEvent:", self, theEvent));
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("description"), function $_CPRuleEditorViewSlice__description(self, _cmd)
{
    return CPString.isa.objj_msgSend(CPString, "stringWithFormat:", "<%@ %p index:%d indentation:%d>", self.isa.objj_msgSend0(self, "className"), self, self.isa.objj_msgSend0(self, "rowIndex"), self.isa.objj_msgSend0(self, "indentation"));
}
,["CPString"])]);
}