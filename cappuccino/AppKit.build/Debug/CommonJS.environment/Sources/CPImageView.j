@STATIC;1.0;I;33;Foundation/CPNotificationCenter.ji;11;CPControl.ji;9;CPImage.ji;14;CPShadowView.jt;15772;objj_executeFile("Foundation/CPNotificationCenter.j", NO);objj_executeFile("CPControl.j", YES);objj_executeFile("CPImage.j", YES);objj_executeFile("CPShadowView.j", YES);CPImageAlignCenter = 0;
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
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_DOMImageElement"), new objj_ivar("_hasShadow"), new objj_ivar("_shadowView"), new objj_ivar("_isEditable"), new objj_ivar("_imageRect"), new objj_ivar("_imageAlignment")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPImageView__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPImageView").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("_createDOMImageElement"), function $CPImageView___createDOMImageElement(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("image"), function $CPImageView__image(self, _cmd)
{
    return objj_msgSend(self, "objectValue");
}
,["CPImage"]), new objj_method(sel_getUid("setImage:"), function $CPImageView__setImage_(self, _cmd, anImage)
{
    objj_msgSend(self, "setObjectValue:", anImage);
}
,["void","CPImage"]), new objj_method(sel_getUid("setObjectValue:"), function $CPImageView__setObjectValue_(self, _cmd, anImage)
{
    var oldImage = objj_msgSend(self, "objectValue");
    if (oldImage === anImage)
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPImageView").super_class }, "setObjectValue:", anImage);
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (oldImage)
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPImageDidLoadNotification, oldImage);
    var newImage = objj_msgSend(self, "objectValue");
    var size = objj_msgSend(newImage, "size");
    if (size && size.width === -1 && size.height === -1)
    {
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("imageDidLoad:"), CPImageDidLoadNotification, newImage);
        objj_msgSend(self._shadowView, "setHidden:", YES);
    }
    else
    {
        objj_msgSend(self, "hideOrDisplayContents");
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
}
,["void","CPImage"]), new objj_method(sel_getUid("imageDidLoad:"), function $CPImageView__imageDidLoad_(self, _cmd, aNotification)
{
    objj_msgSend(self, "hideOrDisplayContents");
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","CPNotification"]), new objj_method(sel_getUid("hasShadow"), function $CPImageView__hasShadow(self, _cmd)
{
    return self._hasShadow;
}
,["BOOL"]), new objj_method(sel_getUid("setHasShadow:"), function $CPImageView__setHasShadow_(self, _cmd, shouldHaveShadow)
{
    if (self._hasShadow == shouldHaveShadow)
        return;
    self._hasShadow = shouldHaveShadow;
    if (self._hasShadow)
    {
        self._shadowView = objj_msgSend(objj_msgSend(CPShadowView, "alloc"), "initWithFrame:", objj_msgSend(self, "bounds"));
        objj_msgSend(self, "addSubview:", self._shadowView);
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
    else
    {
        objj_msgSend(self._shadowView, "removeFromSuperview");
        self._shadowView = nil;
    }
    objj_msgSend(self, "hideOrDisplayContents");
}
,["void","BOOL"]), new objj_method(sel_getUid("setImageAlignment:"), function $CPImageView__setImageAlignment_(self, _cmd, anImageAlignment)
{
    if (self._imageAlignment == anImageAlignment)
        return;
    self._imageAlignment = anImageAlignment;
    if (!objj_msgSend(self, "image"))
        return;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","CPImageAlignment"]), new objj_method(sel_getUid("imageAlignment"), function $CPImageView__imageAlignment(self, _cmd)
{
    return self._imageAlignment;
}
,["unsigned"]), new objj_method(sel_getUid("setImageScaling:"), function $CPImageView__setImageScaling_(self, _cmd, anImageScaling)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPImageView").super_class }, "setImageScaling:", anImageScaling);
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","CPImageScaling"]), new objj_method(sel_getUid("imageScaling"), function $CPImageView__imageScaling(self, _cmd)
{
    return objj_msgSend(self, "currentValueForThemeAttribute:", "image-scaling");
}
,["unsigned"]), new objj_method(sel_getUid("hideOrDisplayContents"), function $CPImageView__hideOrDisplayContents(self, _cmd)
{
    if (!objj_msgSend(self, "image"))
    {
        objj_msgSend(self._shadowView, "setHidden:", YES);
    }
    else
    {
        objj_msgSend(self._shadowView, "setHidden:", NO);
    }
}
,["void"]), new objj_method(sel_getUid("imageRect"), function $CPImageView__imageRect(self, _cmd)
{
    return self._imageRect;
}
,["CGRect"]), new objj_method(sel_getUid("layoutSubviews"), function $CPImageView__layoutSubviews(self, _cmd)
{
    if (!objj_msgSend(self, "image"))
        return;
    var bounds = objj_msgSend(self, "bounds"),
        image = objj_msgSend(self, "image"),
        imageScaling = objj_msgSend(self, "currentValueForThemeAttribute:", "image-scaling"),
        x = 0.0,
        y = 0.0,
        insetWidth = self._hasShadow ? objj_msgSend(self._shadowView, "horizontalInset") : 0.0,
        insetHeight = self._hasShadow ? objj_msgSend(self._shadowView, "verticalInset") : 0.0,
        boundsWidth = CGRectGetWidth(bounds),
        boundsHeight = CGRectGetHeight(bounds),
        width = boundsWidth - insetWidth,
        height = boundsHeight - insetHeight;
    if (imageScaling === CPImageScaleAxesIndependently)
    {
    }
    else
    {
        var size = objj_msgSend(image, "size");
        if (size.width == -1 && size.height == -1)
            return;
        switch(imageScaling) {
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
        var x,
            y;
        switch(self._imageAlignment) {
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
        switch(self._imageAlignment) {
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
    }
    self._imageRect = CGRectMake(x, y, width, height);
    if (self._hasShadow)
        objj_msgSend(self._shadowView, "setFrame:", CGRectMake(x - objj_msgSend(self._shadowView, "leftInset"), y - objj_msgSend(self._shadowView, "topInset"), width + insetWidth, height + insetHeight));
}
,["void"]), new objj_method(sel_getUid("mouseDown:"), function $CPImageView__mouseDown_(self, _cmd, anEvent)
{
    objj_msgSend(objj_msgSend(self, "nextResponder"), "mouseDown:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("setEditable:"), function $CPImageView__setEditable_(self, _cmd, shouldBeEditable)
{
    if (self._isEditable === shouldBeEditable)
        return;
    self._isEditable = shouldBeEditable;
    if (self._isEditable)
        objj_msgSend(self, "registerForDraggedTypes:", [CPImagesPboardType]);
    else
    {
        var draggedTypes = objj_msgSend(self, "registeredDraggedTypes");
        objj_msgSend(self, "unregisterDraggedTypes");
        objj_msgSend(draggedTypes, "removeObjectIdenticalTo:", CPImagesPboardType);
        objj_msgSend(self, "registerForDraggedTypes:", draggedTypes);
    }
}
,["void","BOOL"]), new objj_method(sel_getUid("isEditable"), function $CPImageView__isEditable(self, _cmd)
{
    return self._isEditable;
}
,["BOOL"]), new objj_method(sel_getUid("performDragOperation:"), function $CPImageView__performDragOperation_(self, _cmd, aSender)
{
    var images = objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", objj_msgSend(objj_msgSend(aSender, "draggingPasteboard"), "dataForType:", CPImagesPboardType));
    if (objj_msgSend(images, "count"))
    {
        objj_msgSend(self, "setImage:", images[0]);
        objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
    }
    return YES;
}
,["BOOL","CPDraggingInfo"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPImageView__initialize(self, _cmd)
{
    if (self !== objj_msgSend(CPImageView, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPView, "class"));
    CPImageViewEmptyPlaceholderImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", objj_msgSend(bundle, "pathForResource:", "empty.png"));
}
,["void"]), new objj_method(sel_getUid("_binderClassForBinding:"), function $CPImageView___binderClassForBinding_(self, _cmd, aBinding)
{
    if (aBinding === CPValueBinding || aBinding === CPValueURLBinding || aBinding === CPValuePathBinding || aBinding === CPDataBinding)
        return objj_msgSend(CPImageViewValueBinder, "class");
    else if (objj_msgSend(aBinding, "hasPrefix:", CPEditableBinding))
        return objj_msgSend(CPMultipleValueAndBinding, "class");
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPImageView").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"])]);
}{var the_class = objj_allocateClassPair(CPBinder, "CPImageViewValueBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_updatePlaceholdersWithOptions:"), function $CPImageViewValueBinder___updatePlaceholdersWithOptions_(self, _cmd, options)
{
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", nil, CPMultipleValuesMarker, YES);
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", nil, CPNoSelectionMarker, YES);
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", nil, CPNotApplicableMarker, YES);
    objj_msgSend(self, "_setPlaceholder:forMarker:isDefault:", nil, CPNullMarker, YES);
}
,["void","CPDictionary"]), new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"), function $CPImageViewValueBinder__setPlaceholderValue_withMarker_forBinding_(self, _cmd, aValue, aMarker, aBinding)
{
    objj_msgSend(self._source, "setImage:", nil);
}
,["void","id","CPString","CPString"]), new objj_method(sel_getUid("setValue:forBinding:"), function $CPImageViewValueBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{
    var image;
    if (aValue == nil)
        image = nil;
    else if (aBinding === CPDataBinding)
        image = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithData:", aValue);
    else if (aBinding === CPValueURLBinding || aBinding === CPValuePathBinding)
        image = objj_msgSend(CPImage, "cachedImageWithContentsOfFile:", aValue);
    else if (aBinding === CPValueBinding)
        image = aValue;
    objj_msgSend(self._source, "setImage:", image);
}
,["void","id","CPString"]), new objj_method(sel_getUid("valueForBinding:"), function $CPImageViewValueBinder__valueForBinding_(self, _cmd, aBinding)
{
    var image = objj_msgSend(self._source, "image");
    if (aBinding === CPDataBinding)
        return objj_msgSend(image, "data");
    else if (aBinding === CPValueURLBinding || aBinding === CPValuePathBinding)
        return objj_msgSend(image, "filename");
    else if (aBinding === CPValueBinding)
        return image;
}
,["void","CPString"])]);
}var CPImageViewImageKey = "CPImageViewImageKey",
    CPImageViewImageScalingKey = "CPImageViewImageScalingKey",
    CPImageViewImageAlignmentKey = "CPImageViewImageAlignmentKey",
    CPImageViewHasShadowKey = "CPImageViewHasShadowKey",
    CPImageViewIsEditableKey = "CPImageViewIsEditableKey";
{
var the_class = objj_getClass("CPImageView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPImageView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPImageView__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPImageView").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        objj_msgSend(self, "setHasShadow:", objj_msgSend(aCoder, "decodeBoolForKey:", CPImageViewHasShadowKey));
        objj_msgSend(self, "setImageAlignment:", objj_msgSend(aCoder, "decodeIntForKey:", CPImageViewImageAlignmentKey));
        if (objj_msgSend(aCoder, "decodeBoolForKey:", CPImageViewIsEditableKey))
            objj_msgSend(self, "setEditable:", YES);
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPImageView__encodeWithCoder_(self, _cmd, aCoder)
{
    if (self._shadowView)
        objj_msgSend(self._shadowView, "removeFromSuperview");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPImageView").super_class }, "encodeWithCoder:", aCoder);
    if (self._shadowView)
        objj_msgSend(self, "addSubview:", self._shadowView);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._hasShadow, CPImageViewHasShadowKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._imageAlignment, CPImageViewImageAlignmentKey);
    if (self._isEditable)
        objj_msgSend(aCoder, "encodeBool:forKey:", self._isEditable, CPImageViewIsEditableKey);
}
,["void","CPCoder"])]);
}{
var the_class = objj_getClass("CPImage")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPImage\"");
var meta_class = the_class.isa;class_addMethods(meta_class, [new objj_method(sel_getUid("cachedImageWithContentsOfFile:"), function $CPImage__cachedImageWithContentsOfFile_(self, _cmd, aFile)
{
    var cached_name = objj_msgSend(CPString, "stringWithFormat:", "%@_%d", objj_msgSend(self, "class"), objj_msgSend(aFile, "hash")),
        image = objj_msgSend(CPImage, "imageNamed:", cached_name);
    if (!image)
    {
        image = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", aFile);
        objj_msgSend(image, "setName:", cached_name);
    }
    return image;
}
,["CPImage","CPString"])]);
}