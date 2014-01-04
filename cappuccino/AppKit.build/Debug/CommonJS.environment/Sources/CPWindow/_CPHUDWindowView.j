@STATIC;1.0;i;13;CPTextField.ji;24;_CPTitleableWindowView.jt;9502;

objj_executeFile("CPTextField.j", YES);
objj_executeFile("_CPTitleableWindowView.j", YES);

var _CPHUDWindowViewBackgroundColor = nil,
    _CPHUDWindowViewThemeValues = nil,

    CPHUDCloseButtonImage = nil;

var HUD_TITLEBAR_HEIGHT = 26.0;

{var the_class = objj_allocateClassPair(_CPTitleableWindowView, "_CPHUDWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_toolbarView"), new objj_ivar("_closeButton")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("contentRectForFrameRect:"), function $_CPHUDWindowView__contentRectForFrameRect_(self, _cmd, aFrameRect)
{ with(self)
{
    var contentRect = objj_msgSend(objj_msgSend(self, "class"), "contentRectForFrameRect:", aFrameRect);

    if (objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "toolbar"), "isVisible"))
    {
        var toolbarHeight = CGRectGetHeight(objj_msgSend(objj_msgSend(self, "toolbarView"), "frame"));

        contentRect.origin.y += toolbarHeight;
        contentRect.size.height -= toolbarHeight;
    }

    return contentRect;
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("frameRectForContentRect:"), function $_CPHUDWindowView__frameRectForContentRect_(self, _cmd, aContentRect)
{ with(self)
{
    var frameRect = objj_msgSend(objj_msgSend(self, "class"), "frameRectForContentRect:", aContentRect);

    if (objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "toolbar"), "isVisible"))
    {
        var toolbarHeight = CGRectGetHeight(objj_msgSend(objj_msgSend(self, "toolbarView"), "frame"));

        frameRect.origin.y -= toolbarHeight;
        frameRect.size.height += toolbarHeight;
    }

    return frameRect;
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("initWithFrame:styleMask:"), function $_CPHUDWindowView__initWithFrame_styleMask_(self, _cmd, aFrame, aStyleMask)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPHUDWindowView").super_class }, "initWithFrame:styleMask:", aFrame, aStyleMask);

    if (self)
    {

        objj_msgSend(self, "registerThemeValues:", _CPHUDWindowViewThemeValues);

        var bounds = objj_msgSend(self, "bounds");

        objj_msgSend(self, "setBackgroundColor:", _CPHUDWindowViewBackgroundColor);

        if (_styleMask & CPClosableWindowMask)
        {
            var closeSize = objj_msgSend(_CPHUDWindowViewCloseImage, "size");

            _closeButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(8.0, 4.0, closeSize.width, closeSize.height));

            objj_msgSend(_closeButton, "setBordered:", NO);

            objj_msgSend(_closeButton, "setImage:", _CPHUDWindowViewCloseImage);
            objj_msgSend(_closeButton, "setAlternateImage:", _CPHUDWindowViewCloseActiveImage);

            objj_msgSend(self, "addSubview:", _closeButton);
        }

        objj_msgSend(self, "setResizeIndicatorOffset:", CGSizeMake(5.0, 5.0));

        objj_msgSend(self, "tile");
    }

    return self;
}
},["id","CPRect","unsigned"]), new objj_method(sel_getUid("viewDidMoveToWindow"), function $_CPHUDWindowView__viewDidMoveToWindow(self, _cmd)
{ with(self)
{
    objj_msgSend(_closeButton, "setTarget:", objj_msgSend(self, "window"));
    objj_msgSend(_closeButton, "setAction:", sel_getUid("performClose:"));
}
},["void"]), new objj_method(sel_getUid("toolbarView"), function $_CPHUDWindowView__toolbarView(self, _cmd)
{ with(self)
{
    return _toolbarView;
}
},["_CPToolbarView"]), new objj_method(sel_getUid("toolbarLabelColor"), function $_CPHUDWindowView__toolbarLabelColor(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPColor, "whiteColor");
}
},["CPColor"]), new objj_method(sel_getUid("toolbarLabelShadowColor"), function $_CPHUDWindowView__toolbarLabelShadowColor(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPColor, "blackColor");
}
},["CPColor"]), new objj_method(sel_getUid("toolbarOffset"), function $_CPHUDWindowView__toolbarOffset(self, _cmd)
{ with(self)
{
    return { width:0.0, height:objj_msgSend(objj_msgSend(self, "class"), "titleBarHeight") };
}
},["CGSize"]), new objj_method(sel_getUid("tile"), function $_CPHUDWindowView__tile(self, _cmd)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPHUDWindowView").super_class }, "tile");

    var theWindow = objj_msgSend(self, "window"),
        bounds = objj_msgSend(self, "bounds"),
        width = (bounds.size.width);

    objj_msgSend(_titleField, "setFrame:", { origin: { x:20.0, y:0 }, size: { width:width - 40.0, height:objj_msgSend(self, "toolbarOffset").height } });

    var maxY = objj_msgSend(self, "toolbarMaxY");
    if (objj_msgSend(_titleField, "isHidden"))
        maxY -= (objj_msgSend(self, "toolbarOffset")).height;

    var contentRect = { origin: { x:0.0, y:maxY }, size: { width:width, height:(bounds.size.height) - maxY } };

    objj_msgSend(objj_msgSend(theWindow, "contentView"), "setFrame:", contentRect);
}
},["void"]), new objj_method(sel_getUid("_enableSheet:"), function $_CPHUDWindowView___enableSheet_(self, _cmd, enable)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPHUDWindowView").super_class }, "_enableSheet:", enable);

    objj_msgSend(_closeButton, "setHidden:", enable);
    objj_msgSend(_titleField, "setHidden:", enable);


    var theWindow = objj_msgSend(self, "window"),
        frame = objj_msgSend(theWindow, "frame"),
        dy = (objj_msgSend(self, "toolbarOffset")).height;

    if (enable)
        dy = -dy;

    var newHeight = (frame.origin.y + frame.size.height) + dy,
        newWidth = (frame.origin.x + frame.size.width);

    frame.size.height += dy;

    objj_msgSend(self, "setFrameSize:", { width:newWidth, height:newHeight });
    objj_msgSend(self, "tile");
    objj_msgSend(theWindow, "setFrame:display:animate:", frame, NO, NO);
    objj_msgSend(theWindow, "setMovableByWindowBackground:", !enable);
}
},["void","BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $_CPHUDWindowView__initialize(self, _cmd)
{ with(self)
{
    if (self !== objj_msgSend(_CPHUDWindowView, "class"))
        return;

    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);

    _CPHUDWindowViewBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", 
        [
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/HUD/CPWindowHUDBackground0.png"), CPSizeMake(7.0, 37.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/HUD/CPWindowHUDBackground1.png"), CPSizeMake(1.0, 37.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/HUD/CPWindowHUDBackground2.png"), CPSizeMake(7.0, 37.0)),

            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/HUD/CPWindowHUDBackground3.png"), CPSizeMake(7.0, 1.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/HUD/CPWindowHUDBackground4.png"), CPSizeMake(2.0, 2.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/HUD/CPWindowHUDBackground5.png"), CPSizeMake(7.0, 1.0)),

            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/HUD/CPWindowHUDBackground6.png"), CPSizeMake(7.0, 3.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/HUD/CPWindowHUDBackground7.png"), CPSizeMake(1.0, 3.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/HUD/CPWindowHUDBackground8.png"), CPSizeMake(7.0, 3.0))
        ]));

    _CPHUDWindowViewCloseImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "HUDTheme/WindowClose.png"), CPSizeMake(18.0, 18.0));
    _CPHUDWindowViewCloseActiveImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "HUDTheme/WindowCloseActive.png"), CPSizeMake(18.0, 18.0));

    _CPHUDWindowViewThemeValues = [
        ["title-font", objj_msgSend(CPFont, "systemFontOfSize:", objj_msgSend(CPFont, "systemFontSize") - 1)],
        ["title-text-color", objj_msgSend(CPColor, "colorWithWhite:alpha:", 255.0 / 255.0, 0.75)],
        ["title-text-color", objj_msgSend(CPColor, "colorWithWhite:alpha:", 255.0 / 255.0, 1), CPThemeStateKeyWindow],
        ["title-text-shadow-color", objj_msgSend(CPColor, "blackColor")],
        ["title-text-shadow-offset", CGSizeMake(0.0, 1.0)],
        ["title-alignment", CPCenterTextAlignment],

        ["title-line-break-mode", CPLineBreakByTruncatingTail],
        ["title-vertical-alignment", CPCenterVerticalTextAlignment]
    ];
}
},["void"]), new objj_method(sel_getUid("titleBarHeight"), function $_CPHUDWindowView__titleBarHeight(self, _cmd)
{ with(self)
{
    return HUD_TITLEBAR_HEIGHT;
}
},["int"])]);
}

