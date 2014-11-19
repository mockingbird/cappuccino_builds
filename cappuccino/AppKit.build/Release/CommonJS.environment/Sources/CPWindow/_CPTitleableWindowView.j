@STATIC;1.0;i;13;CPTextField.ji;15;_CPWindowView.jt;6686;objj_executeFile("CPTextField.j", YES);objj_executeFile("_CPWindowView.j", YES);{var the_class = objj_allocateClassPair(_CPWindowView, "_CPTitleableWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_titleField")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:styleMask:"), function $_CPTitleableWindowView__initWithFrame_styleMask_(self, _cmd, aFrame, aStyleMask)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTitleableWindowView").super_class }, "initWithFrame:styleMask:", aFrame, aStyleMask);
    if (self)
    {
        self._titleField = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
        ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHitTests:", NO));
        ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", "Untitled"));
        ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "sizeToFit"));
        ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable));
        ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", ""));
        ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(20.0, 3.0, CGRectGetWidth((self == null ? null : self.isa.objj_msgSend0(self, "bounds"))) - 40.0, CGRectGetHeight(((___r2 = self._titleField), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame"))))));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._titleField));
        (self == null ? null : self.isa.objj_msgSend0(self, "setNeedsLayout"));
    }
    return self;
    var ___r1, ___r2;
}
,["id","CGRect","unsigned"]), new objj_method(sel_getUid("setTitle:"), function $_CPTitleableWindowView__setTitle_(self, _cmd, aTitle)
{
    ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", aTitle));
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("tile"), function $_CPTitleableWindowView__tile(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTitleableWindowView").super_class }, "tile");
    var theWindow = self.isa.objj_msgSend0(self, "window"),
        bounds = self.isa.objj_msgSend0(self, "bounds"),
        width = CGRectGetWidth(bounds);
    ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(20.0, 0, width - 40.0, ((___r2 = self.isa.objj_msgSend0(self, "class")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "titleBarHeight")))));
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPTitleableWindowView__layoutSubviews(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTitleableWindowView").super_class }, "layoutSubviews");
    self.isa.objj_msgSend1(self, "setBackgroundColor:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "bezel-color"));
    ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "title-text-color")));
    ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFont:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "title-font")));
    ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAlignment:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "title-alignment")));
    ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setVerticalAlignment:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "title-vertical-alignment")));
    ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setLineBreakMode:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "title-line-break-mode")));
    ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowColor:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "title-text-shadow-color")));
    ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowOffset:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "title-text-shadow-offset")));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_minimumResizeSize"), function $_CPTitleableWindowView___minimumResizeSize(self, _cmd)
{
    var size = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTitleableWindowView").super_class }, "_minimumResizeSize");
    size.height += ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "titleBarHeight"));
    return size;
    var ___r1;
}
,["CGSize"]), new objj_method(sel_getUid("bodyOffset"), function $_CPTitleableWindowView__bodyOffset(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "contentRectForFrameRect:", self.isa.objj_msgSend0(self, "frame")).origin.y;
}
,["int"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("titleBarHeight"), function $_CPTitleableWindowView__titleBarHeight(self, _cmd)
{
    return ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "title-bar-height", self.isa.objj_msgSend0(self, "class")));
    var ___r1;
}
,["int"]), new objj_method(sel_getUid("contentRectForFrameRect:"), function $_CPTitleableWindowView__contentRectForFrameRect_(self, _cmd, aFrameRect)
{
    var contentRect = objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("_CPTitleableWindowView").super_class }, "contentRectForFrameRect:", aFrameRect),
        titleBarHeight = self.isa.objj_msgSend0(self, "titleBarHeight");
    contentRect.origin.y += titleBarHeight;
    contentRect.size.height -= titleBarHeight;
    return contentRect;
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("frameRectForContentRect:"), function $_CPTitleableWindowView__frameRectForContentRect_(self, _cmd, aContentRect)
{
    var frameRect = CGRectMakeCopy(aContentRect),
        titleBarHeight = self.isa.objj_msgSend0(self, "titleBarHeight");
    frameRect.origin.y -= titleBarHeight;
    frameRect.size.height += titleBarHeight;
    return frameRect;
}
,["CGRect","CGRect"])]);
}