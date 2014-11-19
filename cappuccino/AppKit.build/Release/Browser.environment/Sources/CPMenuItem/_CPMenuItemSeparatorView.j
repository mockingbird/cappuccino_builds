@STATIC;1.0;i;8;CPView.jt;1828;objj_executeFile("CPView.j", YES);{var the_class = objj_allocateClassPair(CPView, "_CPMenuItemSeparatorView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $_CPMenuItemSeparatorView__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPMenuItemSeparatorView").super_class }, "initWithFrame:", aFrame);
    if (self)
        (self == null ? null : self.isa.objj_msgSend1(self, "setAutoresizingMask:", CPViewWidthSizable));
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("drawRect:"), function $_CPMenuItemSeparatorView__drawRect_(self, _cmd, aRect)
{
    var context = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort")),
        bounds = self.isa.objj_msgSend0(self, "bounds");
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, CGRectGetMinX(bounds), FLOOR(CGRectGetMidY(bounds)) - 0.5);
    CGContextAddLineToPoint(context, CGRectGetMaxX(bounds), FLOOR(CGRectGetMidY(bounds)) - 0.5);
    CGContextSetStrokeColor(context, ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-item-separator-color", _CPMenuItemStandardView)));
    CGContextStrokePath(context);
    var ___r1;
}
,["void","CGRect"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("view"), function $_CPMenuItemSeparatorView__view(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0.0, 0.0, 0.0, 10.0)));
    var ___r1;
}
,["id"])]);
}