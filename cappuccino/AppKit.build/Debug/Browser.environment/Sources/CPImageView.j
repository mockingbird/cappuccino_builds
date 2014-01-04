@STATIC;1.0;I;33;Foundation/CPNotificationCenter.ji;11;CPControl.ji;9;CPImage.ji;14;CPShadowView.jt;17399;


objj_executeFile("Foundation/CPNotificationCenter.j", NO);

objj_executeFile("CPControl.j", YES);
objj_executeFile("CPImage.j", YES);
objj_executeFile("CPShadowView.j", YES);

CPImageAlignCenter = 0;
CPImageAlignTop = 1;
CPImageAlignTopLeft = 2;
CPImageAlignTopRight = 3;
CPImageAlignLeft = 4;
CPImageAlignBottom = 5;
CPImageAlignBottomLeft = 6;
CPImageAlignBottomRight = 7;
CPImageAlignRight = 8;

var CPImageViewEmptyPlaceholderImage = nil;







{var the_class = objj_allocateClassPair(CPControl, "CPImageView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_DOMImageElement"), new objj_ivar("_hasShadow"), new objj_ivar("_shadowView"), new objj_ivar("_isEditable"), new objj_ivar("_imageRect"), new objj_ivar("_imageAlignment")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPImageView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPImageView").super_class }, "initWithFrame:", aFrame);

    if (self)
    {

        _DOMImageElement = document.createElement("img");
        _DOMImageElement.style.position = "absolute";
        _DOMImageElement.style.left = "0px";
        _DOMImageElement.style.top = "0px";

        if (objj_msgSend(CPPlatform, "supportsDragAndDrop"))
        {
            _DOMImageElement.setAttribute("draggable", "true");
            _DOMImageElement.style["-khtml-user-drag"] = "element";
        }

        _DOMElement.appendChild(_DOMImageElement);

        _DOMImageElement.style.visibility = "hidden";

    }

    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("image"), function $CPImageView__image(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "objectValue");
}
},["CPImage"]), new objj_method(sel_getUid("setImage:"), function $CPImageView__setImage_(self, _cmd, anImage)
{ with(self)
{
    objj_msgSend(self, "setObjectValue:", anImage);
}
},["void","CPImage"]), new objj_method(sel_getUid("setObjectValue:"), function $CPImageView__setObjectValue_(self, _cmd, anImage)
{ with(self)
{
    var oldImage = objj_msgSend(self, "objectValue");

    if (oldImage === anImage)
        return;

    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPImageView").super_class }, "setObjectValue:", anImage);

    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");

    if (oldImage)
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPImageDidLoadNotification, oldImage);

    var newImage = objj_msgSend(self, "objectValue");


    _DOMImageElement.src = newImage ? objj_msgSend(newImage, "filename") : objj_msgSend(CPImageViewEmptyPlaceholderImage, "filename");


    var size = objj_msgSend(newImage, "size");

    if (size && size.width === -1 && size.height === -1)
    {
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("imageDidLoad:"), CPImageDidLoadNotification, newImage);


        _DOMImageElement.width = 0;
        _DOMImageElement.height = 0;


        objj_msgSend(_shadowView, "setHidden:", YES);
    }
    else
    {
        objj_msgSend(self, "hideOrDisplayContents");
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
}
},["void","CPImage"]), new objj_method(sel_getUid("imageDidLoad:"), function $CPImageView__imageDidLoad_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "hideOrDisplayContents");

    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPNotification"]), new objj_method(sel_getUid("hasShadow"), function $CPImageView__hasShadow(self, _cmd)
{ with(self)
{
    return _hasShadow;
}
},["BOOL"]), new objj_method(sel_getUid("setHasShadow:"), function $CPImageView__setHasShadow_(self, _cmd, shouldHaveShadow)
{ with(self)
{
    if (_hasShadow == shouldHaveShadow)
        return;

    _hasShadow = shouldHaveShadow;

    if (_hasShadow)
    {
        _shadowView = objj_msgSend(objj_msgSend(CPShadowView, "alloc"), "initWithFrame:", objj_msgSend(self, "bounds"));

        objj_msgSend(self, "addSubview:", _shadowView);

        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
    else
    {
        objj_msgSend(_shadowView, "removeFromSuperview");

        _shadowView = nil;
    }

    objj_msgSend(self, "hideOrDisplayContents");
}
},["void","BOOL"]), new objj_method(sel_getUid("setImageAlignment:"), function $CPImageView__setImageAlignment_(self, _cmd, anImageAlignment)
{ with(self)
{
    if (_imageAlignment == anImageAlignment)
        return;

    _imageAlignment = anImageAlignment;

    if (!objj_msgSend(self, "image"))
        return;

    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPImageAlignment"]), new objj_method(sel_getUid("imageAlignment"), function $CPImageView__imageAlignment(self, _cmd)
{ with(self)
{
    return _imageAlignment;
}
},["unsigned"]), new objj_method(sel_getUid("setImageScaling:"), function $CPImageView__setImageScaling_(self, _cmd, anImageScaling)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPImageView").super_class }, "setImageScaling:", anImageScaling);


    if (objj_msgSend(self, "currentValueForThemeAttribute:", "image-scaling") === CPImageScaleAxesIndependently)
    {
        if (NULL) var ____p = { x:CGPointMake(0.0, 0.0).x * NULL.a + CGPointMake(0.0, 0.0).y * NULL.c + NULL.tx, y:CGPointMake(0.0, 0.0).x * NULL.b + CGPointMake(0.0, 0.0).y * NULL.d + NULL.ty }; else var ____p = { x:0.0, y:0.0 }; _DOMImageElement.style.left = ROUND(____p.x) + "px";_DOMImageElement.style.top = ROUND(____p.y) + "px";;
    }


    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPImageScaling"]), new objj_method(sel_getUid("imageScaling"), function $CPImageView__imageScaling(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "currentValueForThemeAttribute:", "image-scaling");
}
},["unsigned"]), new objj_method(sel_getUid("hideOrDisplayContents"), function $CPImageView__hideOrDisplayContents(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(self, "image"))
    {

        _DOMImageElement.style.visibility = "hidden";

        objj_msgSend(_shadowView, "setHidden:", YES);
    }
    else
    {

        _DOMImageElement.style.visibility = "visible";

        objj_msgSend(_shadowView, "setHidden:", NO);
    }
}
},["void"]), new objj_method(sel_getUid("imageRect"), function $CPImageView__imageRect(self, _cmd)
{ with(self)
{
    return _imageRect;
}
},["CGRect"]), new objj_method(sel_getUid("layoutSubviews"), function $CPImageView__layoutSubviews(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(self, "image"))
        return;

    var bounds = objj_msgSend(self, "bounds"),
        image = objj_msgSend(self, "image"),
        imageScaling = objj_msgSend(self, "currentValueForThemeAttribute:", "image-scaling"),
        x = 0.0,
        y = 0.0,
        insetWidth = (_hasShadow ? objj_msgSend(_shadowView, "horizontalInset") : 0.0),
        insetHeight = (_hasShadow ? objj_msgSend(_shadowView, "verticalInset") : 0.0),
        boundsWidth = (bounds.size.width),
        boundsHeight = (bounds.size.height),
        width = boundsWidth - insetWidth,
        height = boundsHeight - insetHeight;

    if (imageScaling === CPImageScaleAxesIndependently)
    {

            _DOMImageElement.width = ROUND(width);
            _DOMImageElement.height = ROUND(height);

    }
    else
    {
        var size = objj_msgSend(image, "size");

        if (size.width == -1 && size.height == -1)
            return;

        switch (imageScaling)
        {
            case CPImageScaleProportionallyDown:
                if (width >= size.width && height >= size.height)
                {
                    width = size.width;
                    height = size.height;
                    break;
                }



            case CPImageScaleProportionallyUpOrDown:
                var imageRatio = size.width / size.height,
                    viewRatio = width / height;

                if (viewRatio > imageRatio)
                    width = height * imageRatio;
                else
                    height = width / imageRatio;
                break;

            case CPImageScaleAxesIndependently:
            case CPImageScaleNone:
                width = size.width;
                height = size.height;
                break;
        }


            _DOMImageElement.width = ROUND(width);
            _DOMImageElement.height = ROUND(height);


        var x,
            y;

        switch (_imageAlignment)
        {
            case CPImageAlignLeft:
            case CPImageAlignTopLeft:
            case CPImageAlignBottomLeft:
                x = 0.0;
                break;

            case CPImageAlignRight:
            case CPImageAlignTopRight:
            case CPImageAlignBottomRight:
                x = boundsWidth - width;
                break;

            default:
                x = (boundsWidth - width) / 2.0;
                break;
        }

        switch (_imageAlignment)
        {
            case CPImageAlignTop:
            case CPImageAlignTopLeft:
            case CPImageAlignTopRight:
                y = 0.0;
                break;

            case CPImageAlignBottom:
            case CPImageAlignBottomLeft:
            case CPImageAlignBottomRight:
                y = boundsHeight - height;
                break;

            default:
                y = (boundsHeight - height) / 2.0;
                break;
        }


        if (NULL) var ____p = { x:CGPointMake(x, y).x * NULL.a + CGPointMake(x, y).y * NULL.c + NULL.tx, y:CGPointMake(x, y).x * NULL.b + CGPointMake(x, y).y * NULL.d + NULL.ty }; else var ____p = { x:x, y:y }; _DOMImageElement.style.left = ROUND(____p.x) + "px";_DOMImageElement.style.top = ROUND(____p.y) + "px";;

    }

    _imageRect = { origin: { x:x, y:y }, size: { width:width, height:height } };

    if (_hasShadow)
        objj_msgSend(_shadowView, "setFrame:", { origin: { x:x - objj_msgSend(_shadowView, "leftInset"), y:y - objj_msgSend(_shadowView, "topInset") }, size: { width:width + insetWidth, height:height + insetHeight } });
}
},["void"]), new objj_method(sel_getUid("mouseDown:"), function $CPImageView__mouseDown_(self, _cmd, anEvent)
{ with(self)
{

    objj_msgSend(objj_msgSend(self, "nextResponder"), "mouseDown:", anEvent);
}
},["void","CPEvent"]), new objj_method(sel_getUid("setEditable:"), function $CPImageView__setEditable_(self, _cmd, shouldBeEditable)
{ with(self)
{
    if (_isEditable === shouldBeEditable)
        return;

    _isEditable = shouldBeEditable;

    if (_isEditable)
        objj_msgSend(self, "registerForDraggedTypes:", [CPImagesPboardType]);

    else
    {
        var draggedTypes = objj_msgSend(self, "registeredDraggedTypes");

        objj_msgSend(self, "unregisterDraggedTypes");

        objj_msgSend(draggedTypes, "removeObjectIdenticalTo:", CPImagesPboardType);

        objj_msgSend(self, "registerForDraggedTypes:", draggedTypes);
    }
}
},["void","BOOL"]), new objj_method(sel_getUid("isEditable"), function $CPImageView__isEditable(self, _cmd)
{ with(self)
{
    return _isEditable;
}
},["BOOL"]), new objj_method(sel_getUid("performDragOperation:"), function $CPImageView__performDragOperation_(self, _cmd, aSender)
{ with(self)
{
    var images = objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", objj_msgSend(objj_msgSend(aSender, "draggingPasteboard"), "dataForType:", CPImagesPboardType));

    if (objj_msgSend(images, "count"))
    {
        objj_msgSend(self, "setImage:", images[0]);
        objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
    }

    return YES;
}
},["BOOL","CPDraggingInfo"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPImageView__initialize(self, _cmd)
{ with(self)
{
    if (self !== objj_msgSend(CPImageView, "class"))
        return;

    var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPView, "class"));

    CPImageViewEmptyPlaceholderImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", objj_msgSend(bundle, "pathForResource:", "empty.png"));
}
},["void"]), new objj_method(sel_getUid("_binderClassForBinding:"), function $CPImageView___binderClassForBinding_(self, _cmd, theBinding)
{ with(self)
{
    if (theBinding === CPValueBinding || theBinding === CPValueURLBinding || theBinding === CPValuePathBinding || theBinding === CPDataBinding)
        return objj_msgSend(CPImageViewValueBinder, "class");

    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPImageView").super_class }, "_binderClassForBinding:", theBinding);
}
},["Class","CPString"])]);
}

{var the_class = objj_allocateClassPair(CPBinder, "CPImageViewValueBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_updatePlaceholdersWithOptions:"), function $CPImageViewValueBinder___updatePlaceholdersWithOptions_(self, _cmd, options)
{ with(self)
{
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", nil, CPMultipleValuesMarker, YES);
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", nil, CPNoSelectionMarker, YES);
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", nil, CPNotApplicableMarker, YES);
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", nil, CPNullMarker, YES);
}
},["void","CPDictionary"]), new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"), function $CPImageViewValueBinder__setPlaceholderValue_withMarker_forBinding_(self, _cmd, aValue, aMarker, aBinding)
{ with(self)
{
    objj_msgSend(_source, "setImage:", nil);
}
},["void","id","CPString","CPString"]), new objj_method(sel_getUid("setValue:forBinding:"), function $CPImageViewValueBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{ with(self)
{
    var image;

    if (aBinding === CPDataBinding)
        image = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithData:", aValue);
    else if (aBinding === CPValueURLBinding || aBinding === CPValuePathBinding)
        image = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", aValue);
    else if (aBinding === CPValueBinding)
        image = aValue;

    objj_msgSend(_source, "setImage:", image);
}
},["void","id","CPString"])]);
}

var CPImageViewImageKey = "CPImageViewImageKey",
    CPImageViewImageScalingKey = "CPImageViewImageScalingKey",
    CPImageViewImageAlignmentKey = "CPImageViewImageAlignmentKey",
    CPImageViewHasShadowKey = "CPImageViewHasShadowKey",
    CPImageViewIsEditableKey = "CPImageViewIsEditableKey";

{
var the_class = objj_getClass("CPImageView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPImageView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPImageView__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{

    _DOMImageElement = document.createElement("img");
    _DOMImageElement.style.position = "absolute";
    _DOMImageElement.style.left = "0px";
    _DOMImageElement.style.top = "0px";
    _DOMImageElement.style.visibility = "hidden";
    if (objj_msgSend(CPPlatform, "supportsDragAndDrop"))
    {
        _DOMImageElement.setAttribute("draggable", "true");
        _DOMImageElement.style["-khtml-user-drag"] = "element";
    }

    if (typeof(appkit_tag_dom_elements) !== "undefined" && !!appkit_tag_dom_elements)
        _DOMImageElement.setAttribute("data-cappuccino-view", objj_msgSend(self, "className"));


    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPImageView").super_class }, "initWithCoder:", aCoder);

    if (self)
    {

        _DOMElement.appendChild(_DOMImageElement);


        objj_msgSend(self, "setHasShadow:", objj_msgSend(aCoder, "decodeBoolForKey:", CPImageViewHasShadowKey));
        objj_msgSend(self, "setImageAlignment:", objj_msgSend(aCoder, "decodeIntForKey:", CPImageViewImageAlignmentKey));

        if (objj_msgSend(aCoder, "decodeBoolForKey:", CPImageViewIsEditableKey))
            objj_msgSend(self, "setEditable:", YES);

        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }

    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPImageView__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{


    if (_shadowView)
    {
        var actualSubviews = _subviews;

        _subviews = objj_msgSend(_subviews, "copy");
        objj_msgSend(_subviews, "removeObjectIdenticalTo:", _shadowView);
    }

    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPImageView").super_class }, "encodeWithCoder:", aCoder);

    if (_shadowView)
        _subviews = actualSubviews;

    objj_msgSend(aCoder, "encodeBool:forKey:", _hasShadow, CPImageViewHasShadowKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _imageAlignment, CPImageViewImageAlignmentKey);

    if (_isEditable)
        objj_msgSend(aCoder, "encodeBool:forKey:", _isEditable, CPImageViewIsEditableKey);
}
},["void","CPCoder"])]);
}

