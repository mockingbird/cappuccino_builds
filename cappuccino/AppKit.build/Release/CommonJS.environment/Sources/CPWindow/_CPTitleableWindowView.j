@STATIC;1.0;i;13;CPTextField.ji;15;_CPWindowView.jt;5210;objj_executeFile("CPTextField.j", YES);objj_executeFile("_CPWindowView.j", YES);{var the_class = objj_allocateClassPair(_CPWindowView, "_CPTitleableWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_titleField")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:styleMask:"), function $_CPTitleableWindowView__initWithFrame_styleMask_(self, _cmd, aFrame, aStyleMask)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTitleableWindowView").super_class }, "initWithFrame:styleMask:", aFrame, aStyleMask);
    if (self)
    {
        self._titleField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(self._titleField, "setHitTests:", NO);
        objj_msgSend(self._titleField, "setStringValue:", "Untitled");
        objj_msgSend(self._titleField, "sizeToFit");
        objj_msgSend(self._titleField, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(self._titleField, "setStringValue:", "");
        objj_msgSend(self._titleField, "setFrame:", CGRectMake(20.0, 3.0, CGRectGetWidth(objj_msgSend(self, "bounds")) - 40.0, CGRectGetHeight(objj_msgSend(self._titleField, "frame"))));
        objj_msgSend(self, "addSubview:", self._titleField);
        objj_msgSend(self, "setNeedsLayout");
    }
    return self;
}
,["id","CGRect","unsigned"]), new objj_method(sel_getUid("setTitle:"), function $_CPTitleableWindowView__setTitle_(self, _cmd, aTitle)
{
    objj_msgSend(self._titleField, "setStringValue:", aTitle);
}
,["void","CPString"]), new objj_method(sel_getUid("tile"), function $_CPTitleableWindowView__tile(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTitleableWindowView").super_class }, "tile");
    var theWindow = objj_msgSend(self, "window"),
        bounds = objj_msgSend(self, "bounds"),
        width = CGRectGetWidth(bounds);
    objj_msgSend(self._titleField, "setFrame:", CGRectMake(20.0, 0, width - 40.0, objj_msgSend(objj_msgSend(self, "class"), "titleBarHeight")));
}
,["void"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPTitleableWindowView__layoutSubviews(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTitleableWindowView").super_class }, "layoutSubviews");
    objj_msgSend(self, "setBackgroundColor:", objj_msgSend(self, "valueForThemeAttribute:", "bezel-color"));
    objj_msgSend(self._titleField, "setTextColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "title-text-color"));
    objj_msgSend(self._titleField, "setFont:", objj_msgSend(self, "currentValueForThemeAttribute:", "title-font"));
    objj_msgSend(self._titleField, "setAlignment:", objj_msgSend(self, "currentValueForThemeAttribute:", "title-alignment"));
    objj_msgSend(self._titleField, "setVerticalAlignment:", objj_msgSend(self, "currentValueForThemeAttribute:", "title-vertical-alignment"));
    objj_msgSend(self._titleField, "setLineBreakMode:", objj_msgSend(self, "currentValueForThemeAttribute:", "title-line-break-mode"));
    objj_msgSend(self._titleField, "setTextShadowColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "title-text-shadow-color"));
    objj_msgSend(self._titleField, "setTextShadowOffset:", objj_msgSend(self, "currentValueForThemeAttribute:", "title-text-shadow-offset"));
}
,["void"]), new objj_method(sel_getUid("_minimumResizeSize"), function $_CPTitleableWindowView___minimumResizeSize(self, _cmd)
{
    var size = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTitleableWindowView").super_class }, "_minimumResizeSize");
    size.height += objj_msgSend(objj_msgSend(self, "class"), "titleBarHeight");
    return size;
}
,["CGSize"]), new objj_method(sel_getUid("bodyOffset"), function $_CPTitleableWindowView__bodyOffset(self, _cmd)
{
    return objj_msgSend(self, "contentRectForFrameRect:", objj_msgSend(self, "frame")).origin.y;
}
,["int"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("titleBarHeight"), function $_CPTitleableWindowView__titleBarHeight(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "title-bar-height", objj_msgSend(self, "class"));
}
,["int"]), new objj_method(sel_getUid("contentRectForFrameRect:"), function $_CPTitleableWindowView__contentRectForFrameRect_(self, _cmd, aFrameRect)
{
    var contentRect = objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("_CPTitleableWindowView").super_class }, "contentRectForFrameRect:", aFrameRect),
        titleBarHeight = objj_msgSend(self, "titleBarHeight");
    contentRect.origin.y += titleBarHeight;
    contentRect.size.height -= titleBarHeight;
    return contentRect;
}
,["CGRect","CGRect"]), new objj_method(sel_getUid("frameRectForContentRect:"), function $_CPTitleableWindowView__frameRectForContentRect_(self, _cmd, aContentRect)
{
    var frameRect = CGRectMakeCopy(aContentRect),
        titleBarHeight = objj_msgSend(self, "titleBarHeight");
    frameRect.origin.y -= titleBarHeight;
    frameRect.size.height += titleBarHeight;
    return frameRect;
}
,["CGRect","CGRect"])]);
}