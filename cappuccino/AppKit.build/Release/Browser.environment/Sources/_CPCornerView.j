@STATIC;1.0;i;8;CPView.jt;2751;objj_executeFile("CPView.j", YES);{var the_class = objj_allocateClassPair(CPView, "_CPCornerView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("drawRect:"), function $_CPCornerView__drawRect_(self, _cmd, aRect)
{
    var context = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort")),
        color = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "divider-color");
    CGContextSetLineWidth(context, 1);
    CGContextSetStrokeColor(context, self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "divider-color"));
    CGContextMoveToPoint(context, CGRectGetMinX(aRect) + 0.5, ROUND(CGRectGetMinY(aRect)));
    CGContextAddLineToPoint(context, CGRectGetMinX(aRect) + 0.5, ROUND(CGRectGetMaxY(aRect)) - 1.0);
    CGContextClosePath(context);
    CGContextStrokePath(context);
    var ___r1;
}
,["void","CGRect"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPCornerView__layoutSubviews(self, _cmd)
{
    self.isa.objj_msgSend1(self, "setBackgroundColor:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "background-color"));
}
,["void"]), new objj_method(sel_getUid("_init"), function $_CPCornerView___init(self, _cmd)
{
    self.isa.objj_msgSend1(self, "setBackgroundColor:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "background-color"));
}
,["void"]), new objj_method(sel_getUid("initWithFrame:"), function $_CPCornerView__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPCornerView").super_class }, "initWithFrame:", aFrame);
    if (self)
        (self == null ? null : self.isa.objj_msgSend0(self, "_init"));
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("initWithCoder:"), function $_CPCornerView__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPCornerView").super_class }, "initWithCoder:", aCoder);
    if (self)
        (self == null ? null : self.isa.objj_msgSend0(self, "_init"));
    return self;
}
,["id","CPCoder"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $_CPCornerView__defaultThemeClass(self, _cmd)
{
    return "cornerview";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $_CPCornerView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPNull.isa.objj_msgSend0(CPNull, "null"), "background-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "divider-color");
}
,["CPDictionary"])]);
}