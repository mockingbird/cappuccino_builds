@STATIC;1.0;i;15;_CPWindowView.jt;4392;

objj_executeFile("_CPWindowView.j", YES);

var STANDARD_TITLEBAR_HEIGHT = 25.0;

{var the_class = objj_allocateClassPair(_CPWindowView, "_CPTitleableWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_titleField")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:styleMask:"), function $_CPTitleableWindowView__initWithFrame_styleMask_(self, _cmd, aFrame, aStyleMask)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTitleableWindowView").super_class }, "initWithFrame:styleMask:", aFrame, aStyleMask);

    if (self)
    {
        _titleField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());

        objj_msgSend(_titleField, "setHitTests:", NO);
        objj_msgSend(_titleField, "setStringValue:", "Untitled");
        objj_msgSend(_titleField, "sizeToFit");
        objj_msgSend(_titleField, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(_titleField, "setStringValue:", "");

        objj_msgSend(_titleField, "setFrame:", CGRectMake(20.0, 3.0, CGRectGetWidth(objj_msgSend(self, "bounds")) - 40.0, CGRectGetHeight(objj_msgSend(_titleField, "frame"))));

        objj_msgSend(self, "addSubview:", _titleField);

        objj_msgSend(self, "setNeedsLayout");
    }

    return self;
}
},["id","CPRect","unsigned"]), new objj_method(sel_getUid("setTitle:"), function $_CPTitleableWindowView__setTitle_(self, _cmd, aTitle)
{ with(self)
{
    objj_msgSend(_titleField, "setStringValue:", aTitle);
}
},["void","CPString"]), new objj_method(sel_getUid("tile"), function $_CPTitleableWindowView__tile(self, _cmd)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTitleableWindowView").super_class }, "tile");

    var theWindow = objj_msgSend(self, "window"),
        bounds = objj_msgSend(self, "bounds"),
        width = CGRectGetWidth(bounds);



    objj_msgSend(_titleField, "setFrame:", { origin: { x:20.0, y:0 }, size: { width:width - 40.0, height:objj_msgSend(objj_msgSend(self, "class"), "titleBarHeight") } });
}
},["void"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPTitleableWindowView__layoutSubviews(self, _cmd)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTitleableWindowView").super_class }, "layoutSubviews");

    objj_msgSend(_titleField, "setTextColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "title-text-color"));
    objj_msgSend(_titleField, "setFont:", objj_msgSend(self, "currentValueForThemeAttribute:", "title-font"));
    objj_msgSend(_titleField, "setAlignment:", objj_msgSend(self, "currentValueForThemeAttribute:", "title-alignment"));
    objj_msgSend(_titleField, "setVerticalAlignment:", objj_msgSend(self, "currentValueForThemeAttribute:", "title-vertical-alignment"));
    objj_msgSend(_titleField, "setLineBreakMode:", objj_msgSend(self, "currentValueForThemeAttribute:", "title-line-break-mode"));
    objj_msgSend(_titleField, "setTextShadowColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "title-text-shadow-color"));
    objj_msgSend(_titleField, "setTextShadowOffset:", objj_msgSend(self, "currentValueForThemeAttribute:", "title-text-shadow-offset"));
}
},["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("titleBarHeight"), function $_CPTitleableWindowView__titleBarHeight(self, _cmd)
{ with(self)
{
    return STANDARD_TITLEBAR_HEIGHT;
}
},["int"]), new objj_method(sel_getUid("contentRectForFrameRect:"), function $_CPTitleableWindowView__contentRectForFrameRect_(self, _cmd, aFrameRect)
{ with(self)
{
    var contentRect = CGRectMakeCopy(aFrameRect),
        titleBarHeight = objj_msgSend(objj_msgSend(self, "class"), "titleBarHeight");

    contentRect.origin.y += titleBarHeight;
    contentRect.size.height -= titleBarHeight;

    return contentRect;
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("frameRectForContentRect:"), function $_CPTitleableWindowView__frameRectForContentRect_(self, _cmd, aContentRect)
{ with(self)
{
    var frameRect = CGRectMakeCopy(aContentRect),
        titleBarHeight = objj_msgSend(objj_msgSend(self, "class"), "titleBarHeight");

    frameRect.origin.y -= titleBarHeight;
    frameRect.size.height += titleBarHeight;

    return frameRect;
}
},["CGRect","CGRect"])]);
}

