@STATIC;1.0;I;21;Foundation/CPBundle.jI;33;Foundation/CPNotificationCenter.jI;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.jI;21;Foundation/CPString.jI;19;Foundation/CPData.ji;12;CGGeometry.ji;17;CPCompatibility.jt;17658;objj_executeFile("Foundation/CPBundle.j", NO);objj_executeFile("Foundation/CPNotificationCenter.j", NO);objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPRunLoop.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("Foundation/CPData.j", NO);objj_executeFile("CGGeometry.j", YES);objj_executeFile("CPCompatibility.j", YES);{var the_protocol = objj_allocateProtocol("CPImageDelegate");
var aProtocol = objj_getProtocol("CPObject");
if (!aProtocol) throw new SyntaxError("*** Could not find definition for protocol \"CPImageDelegate\"");
protocol_addProtocol(the_protocol, aProtocol);
objj_registerProtocol(the_protocol);
}var CPImageDelegate_imageDidLoad_ = 1 << 1,
    CPImageDelegate_imageDidError_ = 1 << 2,
    CPImageDelegate_imageDidAbort_ = 1 << 3;
CPImageLoadStatusInitialized = 0;
CPImageLoadStatusLoading = 1;
CPImageLoadStatusCompleted = 2;
CPImageLoadStatusCancelled = 3;
CPImageLoadStatusInvalidData = 4;
CPImageLoadStatusUnexpectedEOF = 5;
CPImageLoadStatusReadError = 6;
CPImageDidLoadNotification = "CPImageDidLoadNotification";
CPImageNameColorPanel = "CPImageNameColorPanel";
CPImageNameColorPanelHighlighted = "CPImageNameColorPanelHighlighted";
var imagesForNames = {},
    AppKitImageForNames = {},
    ImageDescriptionFormat = "%s {\n   filename: \"%s\",\n   size: { width:%f, height:%f }\n}";
AppKitImageForNames[CPImageNameColorPanel] = CGSizeMake(26.0, 29.0);
AppKitImageForNames[CPImageNameColorPanelHighlighted] = CGSizeMake(26.0, 29.0);
CPImageInBundle = function()
{
    var filename = arguments[0],
        size = nil,
        bundle = nil;
    if (typeof arguments[1] === "number")
    {
        if (arguments[1] !== nil && arguments[1] !== undefined)
            size = CGSizeMake(arguments[1], arguments[2]);
        bundle = arguments[3];
    }
    else if (typeof arguments[1] === "object")
    {
        size = arguments[1];
        bundle = arguments[2];
    }
    if (!bundle)
        bundle = objj_msgSend(CPBundle, "mainBundle");
    if (size)
        return objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", filename), size);
    return objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", objj_msgSend(bundle, "pathForResource:", filename));
}
CPAppKitImage = function(aFilename, aSize)
{
    return CPImageInBundle(aFilename, aSize, objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPView, "class")));
}
{var the_class = objj_allocateClassPair(CPObject, "CPImage"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_size"), new objj_ivar("_filename"), new objj_ivar("_name"), new objj_ivar("_delegate"), new objj_ivar("_loadStatus"), new objj_ivar("_implementedDelegateMethods"), new objj_ivar("_image")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPImage__init(self, _cmd)
{
    return objj_msgSend(self, "initByReferencingFile:size:", "", CGSizeMake(-1, -1));
}
,["id"]), new objj_method(sel_getUid("initByReferencingFile:size:"), function $CPImage__initByReferencingFile_size_(self, _cmd, aFilename, aSize)
{
    if (aFilename === undefined || aFilename === nil)
        return nil;
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPImage").super_class }, "init");
    if (self)
    {
        self._size = CGSizeMakeCopy(aSize);
        self._filename = aFilename;
        self._loadStatus = CPImageLoadStatusInitialized;
    }
    return self;
}
,["id","CPString","CGSize"]), new objj_method(sel_getUid("initWithContentsOfFile:size:"), function $CPImage__initWithContentsOfFile_size_(self, _cmd, aFilename, aSize)
{
    self = objj_msgSend(self, "initByReferencingFile:size:", aFilename, aSize);
    if (self)
        objj_msgSend(self, "load");
    return self;
}
,["id","CPString","CGSize"]), new objj_method(sel_getUid("initWithContentsOfFile:"), function $CPImage__initWithContentsOfFile_(self, _cmd, aFilename)
{
    self = objj_msgSend(self, "initByReferencingFile:size:", aFilename, CGSizeMake(-1, -1));
    if (self)
        objj_msgSend(self, "load");
    return self;
}
,["id","CPString"]), new objj_method(sel_getUid("initWithData:"), function $CPImage__initWithData_(self, _cmd, someData)
{
    var base64 = objj_msgSend(someData, "base64"),
        type = objj_msgSend(base64, "hasPrefix:", "/9j/4AAQSkZJRgABAQEASABIAAD/") ? "jpg" : "png",
        dataURL = "data:image/" + type + ";base64," + base64;
    return objj_msgSend(self, "initWithContentsOfFile:", dataURL);
}
,["id","CPData"]), new objj_method(sel_getUid("filename"), function $CPImage__filename(self, _cmd)
{
    return self._filename;
}
,["CPString"]), new objj_method(sel_getUid("data"), function $CPImage__data(self, _cmd)
{
    var dataURL;
    if (objj_msgSend(self._filename, "hasPrefix:", "data:image"))
        dataURL = self._filename;
    else if (CPFeatureIsCompatible(CPHTMLCanvasFeature))
    {
        var canvas = document.createElement("canvas"),
            ctx = canvas.getContext("2d");
        (canvas.width = self._image.width, canvas.height = self._image.height);
        ctx.drawImage(self._image, 0, 0);
        dataURL = canvas.toDataURL("image/png");
    }
    else
        return nil;
    var base64 = dataURL.replace(/^data:image\/png;base64,/, "");
    return objj_msgSend(CPData, "dataWithBase64:", base64);
}
,["CPData"]), new objj_method(sel_getUid("setSize:"), function $CPImage__setSize_(self, _cmd, aSize)
{
    self._size = CGSizeMakeCopy(aSize);
}
,["void","CGSize"]), new objj_method(sel_getUid("size"), function $CPImage__size(self, _cmd)
{
    return self._size;
}
,["CGSize"]), new objj_method(sel_getUid("setName:"), function $CPImage__setName_(self, _cmd, aName)
{
    if (self._name === aName)
        return YES;
    if (imagesForNames[aName])
        return NO;
    self._name = aName;
    imagesForNames[aName] = self;
    return YES;
}
,["BOOL","CPString"]), new objj_method(sel_getUid("name"), function $CPImage__name(self, _cmd)
{
    return self._name;
}
,["CPString"]), new objj_method(sel_getUid("image"), function $CPImage__image(self, _cmd)
{
    return self._image;
}
,["Image"]), new objj_method(sel_getUid("setDelegate:"), function $CPImage__setDelegate_(self, _cmd, aDelegate)
{
    if (self._delegate === aDelegate)
        return;
    self._delegate = aDelegate;
    self._implementedDelegateMethods = 0;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("imageDidLoad:")))
        self._implementedDelegateMethods |= CPImageDelegate_imageDidLoad_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("imageDidError:")))
        self._implementedDelegateMethods |= CPImageDelegate_imageDidError_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("imageDidAbort:")))
        self._implementedDelegateMethods |= CPImageDelegate_imageDidAbort_;
}
,["void","id"]), new objj_method(sel_getUid("delegate"), function $CPImage__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("loadStatus"), function $CPImage__loadStatus(self, _cmd)
{
    return self._loadStatus;
}
,["unsigned"]), new objj_method(sel_getUid("load"), function $CPImage__load(self, _cmd)
{
    if (self._loadStatus == CPImageLoadStatusLoading || self._loadStatus == CPImageLoadStatusCompleted)
        return;
    self._loadStatus = CPImageLoadStatusLoading;
    self._image = new Image();
    var isSynchronous = YES;
    self._image.onload = function()
    {
        if (isSynchronous)
            window.setTimeout(function()
            {
                objj_msgSend(self, "_imageDidLoad");
            }, 0);
        else
        {
            objj_msgSend(self, "_imageDidLoad");
            objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
        }
        objj_msgSend(self, "_derefFromImage");
    };
    self._image.onerror = function()
    {
        if (isSynchronous)
            window.setTimeout(function()
            {
                objj_msgSend(self, "_imageDidError");
            }, 0);
        else
        {
            objj_msgSend(self, "_imageDidError");
            objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
        }
        objj_msgSend(self, "_derefFromImage");
    };
    self._image.onabort = function()
    {
        if (isSynchronous)
            window.setTimeout(function()
            {
                objj_msgSend(self, "_imageDidAbort");
            }, 0);
        else
        {
            objj_msgSend(self, "_imageDidAbort");
            objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
        }
        objj_msgSend(self, "_derefFromImage");
    };
    self._image.src = self._filename;
    window.setTimeout(function()
    {
        isSynchronous = NO;
    }, 0);
}
,["void"]), new objj_method(sel_getUid("isSingleImage"), function $CPImage__isSingleImage(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("isThreePartImage"), function $CPImage__isThreePartImage(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("isNinePartImage"), function $CPImage__isNinePartImage(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("description"), function $CPImage__description(self, _cmd)
{
    var filename = objj_msgSend(self, "filename"),
        size = objj_msgSend(self, "size");
    if (filename.indexOf("data:") === 0)
    {
        var index = filename.indexOf(",");
        if (index > 0)
            filename = objj_msgSend(CPString, "stringWithFormat:", "%s,%s...%s", filename.substr(0, index), filename.substr(index + 1, 10), filename.substr(filename.length - 10));
        else
            filename = "data:<unknown type>";
    }
    return objj_msgSend(CPString, "stringWithFormat:", ImageDescriptionFormat, objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPImage").super_class }, "description"), filename, size.width, size.height);
}
,["CPString"]), new objj_method(sel_getUid("_derefFromImage"), function $CPImage___derefFromImage(self, _cmd)
{
    self._image.onload = null;
    self._image.onerror = null;
    self._image.onabort = null;
}
,["void"]), new objj_method(sel_getUid("_imageDidLoad"), function $CPImage___imageDidLoad(self, _cmd)
{
    self._loadStatus = CPImageLoadStatusCompleted;
    if (!self._size || self._size.width == -1 && self._size.height == -1)
        self._size = CGSizeMake(self._image.width, self._image.height);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPImageDidLoadNotification, self);
    if (self._implementedDelegateMethods & CPImageDelegate_imageDidLoad_)
        objj_msgSend(self._delegate, "imageDidLoad:", self);
}
,["void"]), new objj_method(sel_getUid("_imageDidError"), function $CPImage___imageDidError(self, _cmd)
{
    self._loadStatus = CPImageLoadStatusReadError;
    if (self._implementedDelegateMethods & CPImageDelegate_imageDidError_)
        objj_msgSend(self._delegate, "imageDidError:", self);
}
,["void"]), new objj_method(sel_getUid("_imageDidAbort"), function $CPImage___imageDidAbort(self, _cmd)
{
    self._loadStatus = CPImageLoadStatusCancelled;
    if (self._implementedDelegateMethods & CPImageDelegate_imageDidAbort_)
        objj_msgSend(self._delegate, "imageDidAbort:", self);
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("imageNamed:"), function $CPImage__imageNamed_(self, _cmd, aName)
{
    var image = imagesForNames[aName];
    if (image)
        return image;
    var imageOrSize = AppKitImageForNames[aName];
    if (!imageOrSize)
        return nil;
    if (!imageOrSize.isa)
    {
        imageOrSize = CPAppKitImage("CPImage/" + aName + ".png", imageOrSize);
        objj_msgSend(imageOrSize, "setName:", aName);
        AppKitImageForNames[aName] = imageOrSize;
    }
    return imageOrSize;
}
,["id","CPString"])]);
}{
var the_class = objj_getClass("CPImage")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPImage\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPImage__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "initWithContentsOfFile:size:", objj_msgSend(aCoder, "decodeObjectForKey:", "CPFilename"), objj_msgSend(aCoder, "decodeSizeForKey:", "CPSize"));
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPImage__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", self._filename, "CPFilename");
    objj_msgSend(aCoder, "encodeSize:forKey:", self._size, "CPSize");
}
,["void","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPObject, "CPThreePartImage"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_imageSlices"), new objj_ivar("_isVertical")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithImageSlices:isVertical:"), function $CPThreePartImage__initWithImageSlices_isVertical_(self, _cmd, imageSlices, isVertical)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPThreePartImage").super_class }, "init");
    if (self)
    {
        self._imageSlices = imageSlices;
        self._isVertical = isVertical;
    }
    return self;
}
,["id","CPArray","BOOL"]), new objj_method(sel_getUid("filename"), function $CPThreePartImage__filename(self, _cmd)
{
    return "";
}
,["CPString"]), new objj_method(sel_getUid("imageSlices"), function $CPThreePartImage__imageSlices(self, _cmd)
{
    return self._imageSlices;
}
,["CPArray"]), new objj_method(sel_getUid("isVertical"), function $CPThreePartImage__isVertical(self, _cmd)
{
    return self._isVertical;
}
,["BOOL"]), new objj_method(sel_getUid("isSingleImage"), function $CPThreePartImage__isSingleImage(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("isThreePartImage"), function $CPThreePartImage__isThreePartImage(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("isNinePartImage"), function $CPThreePartImage__isNinePartImage(self, _cmd)
{
    return NO;
}
,["BOOL"])]);
}var CPThreePartImageImageSlicesKey = "CPThreePartImageImageSlicesKey",
    CPThreePartImageIsVerticalKey = "CPThreePartImageIsVerticalKey";
{
var the_class = objj_getClass("CPThreePartImage")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPThreePartImage\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPThreePartImage__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPThreePartImage").super_class }, "init");
    if (self)
    {
        self._imageSlices = objj_msgSend(aCoder, "decodeObjectForKey:", CPThreePartImageImageSlicesKey);
        self._isVertical = objj_msgSend(aCoder, "decodeBoolForKey:", CPThreePartImageIsVerticalKey);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPThreePartImage__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", self._imageSlices, CPThreePartImageImageSlicesKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._isVertical, CPThreePartImageIsVerticalKey);
}
,["void","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPObject, "CPNinePartImage"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_imageSlices")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithImageSlices:"), function $CPNinePartImage__initWithImageSlices_(self, _cmd, imageSlices)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPNinePartImage").super_class }, "init");
    if (self)
        self._imageSlices = imageSlices;
    return self;
}
,["id","CPArray"]), new objj_method(sel_getUid("filename"), function $CPNinePartImage__filename(self, _cmd)
{
    return "";
}
,["CPString"]), new objj_method(sel_getUid("imageSlices"), function $CPNinePartImage__imageSlices(self, _cmd)
{
    return self._imageSlices;
}
,["CPArray"]), new objj_method(sel_getUid("isSingleImage"), function $CPNinePartImage__isSingleImage(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("isThreePartImage"), function $CPNinePartImage__isThreePartImage(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("isNinePartImage"), function $CPNinePartImage__isNinePartImage(self, _cmd)
{
    return YES;
}
,["BOOL"])]);
}var CPNinePartImageImageSlicesKey = "CPNinePartImageImageSlicesKey";
{
var the_class = objj_getClass("CPNinePartImage")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPNinePartImage\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPNinePartImage__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPNinePartImage").super_class }, "init");
    if (self)
        self._imageSlices = objj_msgSend(aCoder, "decodeObjectForKey:", CPNinePartImageImageSlicesKey);
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPNinePartImage__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", self._imageSlices, CPNinePartImageImageSlicesKey);
}
,["void","CPCoder"])]);
}