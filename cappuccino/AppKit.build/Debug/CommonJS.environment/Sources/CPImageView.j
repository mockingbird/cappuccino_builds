@STATIC;1.0;I;33;Foundation/CPNotificationCenter.ji;11;CPControl.ji;9;CPImage.ji;14;CPShadowView.jt;18872;objj_executeFile("Foundation/CPNotificationCenter.j", NO);objj_executeFile("CPControl.j", YES);objj_executeFile("CPImage.j", YES);objj_executeFile("CPShadowView.j", YES);CPImageAlignCenter = 0;
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
    return self.isa.objj_msgSend0(self, "objectValue");
}
,["CPImage"]), new objj_method(sel_getUid("setImage:"), function $CPImageView__setImage_(self, _cmd, anImage)
{
    self.isa.objj_msgSend1(self, "setObjectValue:", anImage);
}
,["void","CPImage"]), new objj_method(sel_getUid("setObjectValue:"), function $CPImageView__setObjectValue_(self, _cmd, anImage)
{
    var oldImage = self.isa.objj_msgSend0(self, "objectValue");
    if (oldImage === anImage)
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPImageView").super_class }, "setObjectValue:", anImage);
    var defaultCenter = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter");
    if (oldImage)
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self, CPImageDidLoadNotification, oldImage));
    var newImage = self.isa.objj_msgSend0(self, "objectValue");
    var size = (newImage == null ? null : newImage.isa.objj_msgSend0(newImage, "size"));
    if (size && size.width === -1 && size.height === -1)
    {
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("imageDidLoad:"), CPImageDidLoadNotification, newImage));
        ((___r1 = self._shadowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
    }
    else
    {
        self.isa.objj_msgSend0(self, "hideOrDisplayContents");
        self.isa.objj_msgSend0(self, "setNeedsLayout");
        self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    }
    var ___r1;
}
,["void","CPImage"]), new objj_method(sel_getUid("imageDidLoad:"), function $CPImageView__imageDidLoad_(self, _cmd, aNotification)
{
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "removeObserver:name:object:", self, CPImageDidLoadNotification, self.isa.objj_msgSend0(self, "objectValue")));
    self.isa.objj_msgSend0(self, "hideOrDisplayContents");
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    var ___r1;
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
        self._shadowView = ((___r1 = CPShadowView.isa.objj_msgSend0(CPShadowView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", self.isa.objj_msgSend0(self, "bounds")));
        self.isa.objj_msgSend1(self, "addSubview:", self._shadowView);
        self.isa.objj_msgSend0(self, "setNeedsLayout");
        self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    }
    else
    {
        ((___r1 = self._shadowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
        self._shadowView = nil;
    }
    self.isa.objj_msgSend0(self, "hideOrDisplayContents");
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("setImageAlignment:"), function $CPImageView__setImageAlignment_(self, _cmd, anImageAlignment)
{
    if (self._imageAlignment == anImageAlignment)
        return;
    self._imageAlignment = anImageAlignment;
    if (!self.isa.objj_msgSend0(self, "image"))
        return;
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void","CPImageAlignment"]), new objj_method(sel_getUid("imageAlignment"), function $CPImageView__imageAlignment(self, _cmd)
{
    return self._imageAlignment;
}
,["unsigned"]), new objj_method(sel_getUid("setImageScaling:"), function $CPImageView__setImageScaling_(self, _cmd, anImageScaling)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPImageView").super_class }, "setImageScaling:", anImageScaling);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void","CPImageScaling"]), new objj_method(sel_getUid("imageScaling"), function $CPImageView__imageScaling(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "image-scaling");
}
,["CPUInteger"]), new objj_method(sel_getUid("hideOrDisplayContents"), function $CPImageView__hideOrDisplayContents(self, _cmd)
{
    if (!self.isa.objj_msgSend0(self, "image"))
    {
        ((___r1 = self._shadowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
    }
    else
    {
        ((___r1 = self._shadowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("imageRect"), function $CPImageView__imageRect(self, _cmd)
{
    return self._imageRect;
}
,["CGRect"]), new objj_method(sel_getUid("layoutSubviews"), function $CPImageView__layoutSubviews(self, _cmd)
{
    if (!self.isa.objj_msgSend0(self, "image"))
        return;
    var bounds = self.isa.objj_msgSend0(self, "bounds"),
        image = self.isa.objj_msgSend0(self, "image"),
        imageScaling = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "image-scaling"),
        x = 0.0,
        y = 0.0,
        insetWidth = self._hasShadow ? ((___r1 = self._shadowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "horizontalInset")) : 0.0,
        insetHeight = self._hasShadow ? ((___r1 = self._shadowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "verticalInset")) : 0.0,
        boundsWidth = CGRectGetWidth(bounds),
        boundsHeight = CGRectGetHeight(bounds),
        width = boundsWidth - insetWidth,
        height = boundsHeight - insetHeight;
    if (imageScaling === CPImageScaleAxesIndependently)
    {
    }
    else
    {
        var size = (image == null ? null : image.isa.objj_msgSend0(image, "size"));
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
        ((___r1 = self._shadowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(x - ((___r2 = self._shadowView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "leftInset")), y - ((___r2 = self._shadowView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "topInset")), width + insetWidth, height + insetHeight)));
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("mouseDown:"), function $CPImageView__mouseDown_(self, _cmd, anEvent)
{
    ((___r1 = self.isa.objj_msgSend0(self, "nextResponder")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "mouseDown:", anEvent));
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("setEditable:"), function $CPImageView__setEditable_(self, _cmd, shouldBeEditable)
{
    if (self._isEditable === shouldBeEditable)
        return;
    self._isEditable = shouldBeEditable;
    if (self._isEditable)
        self.isa.objj_msgSend1(self, "registerForDraggedTypes:", [CPImagesPboardType]);
    else
    {
        var draggedTypes = self.isa.objj_msgSend0(self, "registeredDraggedTypes");
        self.isa.objj_msgSend0(self, "unregisterDraggedTypes");
        (draggedTypes == null ? null : draggedTypes.isa.objj_msgSend1(draggedTypes, "removeObjectIdenticalTo:", CPImagesPboardType));
        self.isa.objj_msgSend1(self, "registerForDraggedTypes:", draggedTypes);
    }
}
,["void","BOOL"]), new objj_method(sel_getUid("isEditable"), function $CPImageView__isEditable(self, _cmd)
{
    return self._isEditable;
}
,["BOOL"]), new objj_method(sel_getUid("performDragOperation:"), function $CPImageView__performDragOperation_(self, _cmd, aSender)
{
    var images = CPKeyedUnarchiver.isa.objj_msgSend1(CPKeyedUnarchiver, "unarchiveObjectWithData:", ((___r1 = (aSender == null ? null : aSender.isa.objj_msgSend0(aSender, "draggingPasteboard"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "dataForType:", CPImagesPboardType)));
    if ((images == null ? null : images.isa.objj_msgSend0(images, "count")))
    {
        self.isa.objj_msgSend1(self, "setImage:", images[0]);
        self.isa.objj_msgSend2(self, "sendAction:to:", self.isa.objj_msgSend0(self, "action"), self.isa.objj_msgSend0(self, "target"));
    }
    return YES;
    var ___r1;
}
,["BOOL","CPDraggingInfo"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPImageView__initialize(self, _cmd)
{
    if (self !== CPImageView.isa.objj_msgSend0(CPImageView, "class"))
        return;
    var bundle = CPBundle.isa.objj_msgSend1(CPBundle, "bundleForClass:", CPView.isa.objj_msgSend0(CPView, "class"));
    CPImageViewEmptyPlaceholderImage = ((___r1 = CPImage.isa.objj_msgSend0(CPImage, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithContentsOfFile:", (bundle == null ? null : bundle.isa.objj_msgSend1(bundle, "pathForResource:", "empty.png"))));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_binderClassForBinding:"), function $CPImageView___binderClassForBinding_(self, _cmd, aBinding)
{
    if (aBinding === CPValueBinding || aBinding === CPValueURLBinding || aBinding === CPValuePathBinding || aBinding === CPDataBinding)
        return (CPImageViewValueBinder == null ? null : CPImageViewValueBinder.isa.objj_msgSend0(CPImageViewValueBinder, "class"));
    else if ((aBinding == null ? null : aBinding.isa.objj_msgSend1(aBinding, "hasPrefix:", CPEditableBinding)))
        return CPMultipleValueAndBinding.isa.objj_msgSend0(CPMultipleValueAndBinding, "class");
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPImageView").super_class }, "_binderClassForBinding:", aBinding);
}
,["Class","CPString"])]);
}{var the_class = objj_allocateClassPair(CPBinder, "CPImageViewValueBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_updatePlaceholdersWithOptions:"), function $CPImageViewValueBinder___updatePlaceholdersWithOptions_(self, _cmd, options)
{
    self.isa.objj_msgSend3(self, "_setPlaceholder:forMarker:isDefault:", nil, CPMultipleValuesMarker, YES);
    self.isa.objj_msgSend3(self, "_setPlaceholder:forMarker:isDefault:", nil, CPNoSelectionMarker, YES);
    self.isa.objj_msgSend3(self, "_setPlaceholder:forMarker:isDefault:", nil, CPNotApplicableMarker, YES);
    self.isa.objj_msgSend3(self, "_setPlaceholder:forMarker:isDefault:", nil, CPNullMarker, YES);
}
,["void","CPDictionary"]), new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"), function $CPImageViewValueBinder__setPlaceholderValue_withMarker_forBinding_(self, _cmd, aValue, aMarker, aBinding)
{
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", nil));
    var ___r1;
}
,["void","id","CPString","CPString"]), new objj_method(sel_getUid("setValue:forBinding:"), function $CPImageViewValueBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{
    var image;
    if (aValue == nil)
        image = nil;
    else if (aBinding === CPDataBinding)
        image = ((___r1 = CPImage.isa.objj_msgSend0(CPImage, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithData:", aValue));
    else if (aBinding === CPValueURLBinding || aBinding === CPValuePathBinding)
        image = CPImage.isa.objj_msgSend1(CPImage, "cachedImageWithContentsOfFile:", aValue);
    else if (aBinding === CPValueBinding)
        image = aValue;
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", image));
    var ___r1;
}
,["void","id","CPString"]), new objj_method(sel_getUid("valueForBinding:"), function $CPImageViewValueBinder__valueForBinding_(self, _cmd, aBinding)
{
    var image = ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "image"));
    if (aBinding === CPDataBinding)
        return (image == null ? null : image.isa.objj_msgSend0(image, "data"));
    else if (aBinding === CPValueURLBinding || aBinding === CPValuePathBinding)
        return (image == null ? null : image.isa.objj_msgSend0(image, "filename"));
    else if (aBinding === CPValueBinding)
        return image;
    var ___r1;
}
,["id","CPString"])]);
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
        (self == null ? null : self.isa.objj_msgSend1(self, "setHasShadow:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPImageViewHasShadowKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setImageAlignment:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPImageViewImageAlignmentKey))));
        if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPImageViewIsEditableKey)))
            (self == null ? null : self.isa.objj_msgSend1(self, "setEditable:", YES));
        (self == null ? null : self.isa.objj_msgSend0(self, "setNeedsLayout"));
        (self == null ? null : self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPImageView__encodeWithCoder_(self, _cmd, aCoder)
{
    if (self._shadowView)
        ((___r1 = self._shadowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPImageView").super_class }, "encodeWithCoder:", aCoder);
    if (self._shadowView)
        self.isa.objj_msgSend1(self, "addSubview:", self._shadowView);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._hasShadow, CPImageViewHasShadowKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._imageAlignment, CPImageViewImageAlignmentKey));
    if (self._isEditable)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._isEditable, CPImageViewIsEditableKey));
    var ___r1;
}
,["void","CPCoder"])]);
}{
var the_class = objj_getClass("CPImage")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPImage\"");
var meta_class = the_class.isa;class_addMethods(meta_class, [new objj_method(sel_getUid("cachedImageWithContentsOfFile:"), function $CPImage__cachedImageWithContentsOfFile_(self, _cmd, aFile)
{
    var cached_name = CPString.isa.objj_msgSend3(CPString, "stringWithFormat:", "%@_%d", self.isa.objj_msgSend0(self, "class"), (aFile == null ? null : aFile.isa.objj_msgSend0(aFile, "hash"))),
        image = CPImage.isa.objj_msgSend1(CPImage, "imageNamed:", cached_name);
    if (!image)
    {
        image = ((___r1 = CPImage.isa.objj_msgSend0(CPImage, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithContentsOfFile:", aFile));
        (image == null ? null : image.isa.objj_msgSend1(image, "setName:", cached_name));
    }
    return image;
    var ___r1;
}
,["CPImage","CPString"])]);
}