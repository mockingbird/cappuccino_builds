@STATIC;1.0;I;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.jt;8565;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPRunLoop.j", NO);{var the_protocol = objj_allocateProtocol("CPSoundDelegate");
var aProtocol = objj_getProtocol("CPObject");
if (!aProtocol) throw new SyntaxError("*** Could not find definition for protocol \"CPSoundDelegate\"");
protocol_addProtocol(the_protocol, aProtocol);
objj_registerProtocol(the_protocol);
}var CPSoundDelegate_sound_didFinishPlaying_ = 1 << 1;
CPSoundLoadStateEmpty = 0;
CPSoundLoadStateLoading = 1;
CPSoundLoadStateCanBePlayed = 2;
CPSoundLoadStateError = 3;
CPSoundPlayBackStatePlay = 0;
CPSoundPlayBackStateStop = 1;
CPSoundPlayBackStatePause = 2;
{var the_class = objj_allocateClassPair(CPObject, "CPSound"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_name"), new objj_ivar("_delegate"), new objj_ivar("_playRequestBeforeLoad"), new objj_ivar("_audioTag"), new objj_ivar("_loadStatus"), new objj_ivar("_playBackStatus"), new objj_ivar("_implementedDelegateMethods")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("name"), function $CPSound__name(self, _cmd)
{
    return self._name;
}
,["CPString"]), new objj_method(sel_getUid("setName:"), function $CPSound__setName_(self, _cmd, newValue)
{
    self._name = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("delegate"), function $CPSound__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("setDelegate:"), function $CPSound__setDelegate_(self, _cmd, newValue)
{
    self._delegate = newValue;
}
,["void","id"]), new objj_method(sel_getUid("init"), function $CPSound__init(self, _cmd)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSound").super_class }, "init"))
    {
        self._loadStatus = CPSoundLoadStateEmpty;
        self._audioTag = document.createElement("audio");
        self._audioTag.preload = YES;
        self._playRequestBeforeLoad = NO;
        self._audioTag.addEventListener("canplay", function()
        {
            ((___r1 = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "currentRunLoop")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "limitDateForMode:", CPDefaultRunLoopMode));
            (self == null ? null : self.isa.objj_msgSend0(self, "_soundDidload"));
            var ___r1;
        }, true);
        self._audioTag.addEventListener("ended", function()
        {
            ((___r1 = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "currentRunLoop")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "limitDateForMode:", CPDefaultRunLoopMode));
            (self == null ? null : self.isa.objj_msgSend0(self, "_soundDidEnd"));
            var ___r1;
        }, true);
        self._audioTag.addEventListener("error", function()
        {
            ((___r1 = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "currentRunLoop")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "limitDateForMode:", CPDefaultRunLoopMode));
            (self == null ? null : self.isa.objj_msgSend0(self, "_soundError"));
            var ___r1;
        }, true);
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("initWithContentsOfFile:byReference:"), function $CPSound__initWithContentsOfFile_byReference_(self, _cmd, aFile, byRef)
{
    if (self = (self == null ? null : self.isa.objj_msgSend0(self, "init")))
    {
        self._loadStatus = CPSoundLoadStateLoading;
        self._audioTag.src = aFile;
    }
    return self;
}
,["id","CPString","BOOL"]), new objj_method(sel_getUid("initWithContentsOfURL:byReference:"), function $CPSound__initWithContentsOfURL_byReference_(self, _cmd, aURL, byRef)
{
    return self.isa.objj_msgSend2(self, "initWithContentsOfFile:byReference:", (aURL == null ? null : aURL.isa.objj_msgSend0(aURL, "absoluteString")), NO);
}
,["id","CPURL","BOOL"]), new objj_method(sel_getUid("initWithData:"), function $CPSound__initWithData_(self, _cmd, someData)
{
    if (self = (self == null ? null : self.isa.objj_msgSend0(self, "init")))
    {
        self._loadStatus = CPSoundLoadStateLoading;
        self._audioTag.src = (someData == null ? null : someData.isa.objj_msgSend0(someData, "rawString"));
    }
    return self;
}
,["id","CPData"]), new objj_method(sel_getUid("setDelegate:"), function $CPSound__setDelegate_(self, _cmd, aDelegate)
{
    if (self._delegate === aDelegate)
        return;
    self._delegate = aDelegate;
    self._implementedDelegateMethods = 0;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("sound:didFinishPlaying:"))))
        self._implementedDelegateMethods |= CPSoundDelegate_sound_didFinishPlaying_;
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("_soundDidload"), function $CPSound___soundDidload(self, _cmd)
{
    self._loadStatus = CPSoundLoadStateCanBePlayed;
    if (self._playRequestBeforeLoad)
    {
        self._playRequestBeforeLoad = NO;
        self.isa.objj_msgSend0(self, "play");
    }
}
,["void"]), new objj_method(sel_getUid("_soundDidEnd"), function $CPSound___soundDidEnd(self, _cmd)
{
    if (!self.isa.objj_msgSend0(self, "loops"))
        self.isa.objj_msgSend0(self, "stop");
}
,["void"]), new objj_method(sel_getUid("_soundError"), function $CPSound___soundError(self, _cmd)
{
    self._loadStatus = CPSoundLoadStateError;
    CPLog.error("Cannot load sound. Maybe the format of your sound is not compatible with your browser.");
}
,["void"]), new objj_method(sel_getUid("play"), function $CPSound__play(self, _cmd)
{
    if (self._loadStatus === CPSoundLoadStateLoading)
    {
        self._playRequestBeforeLoad = YES;
        return YES;
    }
    if (self._loadStatus !== CPSoundLoadStateCanBePlayed || self._playBackStatus === CPSoundPlayBackStatePlay)
        return NO;
    self._audioTag.play();
    self._playBackStatus = CPSoundPlayBackStatePlay;
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("stop"), function $CPSound__stop(self, _cmd)
{
    if (self._loadStatus !== CPSoundLoadStateCanBePlayed || self._playBackStatus === CPSoundPlayBackStateStop)
        return NO;
    self._audioTag.pause();
    self._audioTag.currentTime = 0.0;
    self._playBackStatus = CPSoundPlayBackStateStop;
    self.isa.objj_msgSend1(self, "_sendDelegateSoundDidFinishPlaying:", YES);
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("pause"), function $CPSound__pause(self, _cmd)
{
    if (self._loadStatus !== CPSoundLoadStateCanBePlayed || self._playBackStatus === CPSoundPlayBackStatePause)
        return NO;
    self._audioTag.pause();
    self._playBackStatus = CPSoundPlayBackStatePause;
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("resume"), function $CPSound__resume(self, _cmd)
{
    if (self._loadStatus !== CPSoundLoadStateCanBePlayed || self._playBackStatus !== CPSoundPlayBackStatePause)
        return NO;
    self._audioTag.play();
    self._playBackStatus = CPSoundPlayBackStatePlay;
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("loops"), function $CPSound__loops(self, _cmd)
{
    return self._audioTag.loop;
}
,["BOOL"]), new objj_method(sel_getUid("setLoops:"), function $CPSound__setLoops_(self, _cmd, shouldLoop)
{
    self._audioTag.loop = shouldLoop;
}
,["void","BOOL"]), new objj_method(sel_getUid("volume"), function $CPSound__volume(self, _cmd)
{
    return self._audioTag.volume;
}
,["double"]), new objj_method(sel_getUid("setVolume:"), function $CPSound__setVolume_(self, _cmd, aVolume)
{
    if (aVolume > 1.0)
        aVolume = 1.0;
    else if (aVolume < 0.0)
        aVolume = 0.0;
    self._audioTag.volume = aVolume;
}
,["void","double"]), new objj_method(sel_getUid("duration"), function $CPSound__duration(self, _cmd)
{
    return self._audioTag.duration;
}
,["double"]), new objj_method(sel_getUid("isPlaying"), function $CPSound__isPlaying(self, _cmd)
{
    return self._playBackStatus === CPSoundPlayBackStatePlay;
}
,["BOOL"])]);
}{
var the_class = objj_getClass("CPSound")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPSound\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_sendDelegateSoundDidFinishPlaying:"), function $CPSound___sendDelegateSoundDidFinishPlaying_(self, _cmd, finishedPlaying)
{
    if (!(self._implementedDelegateMethods & CPSoundDelegate_sound_didFinishPlaying_))
        return;
    ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "sound:didFinishPlaying:", self, finishedPlaying));
    var ___r1;
}
,["void","BOOL"])]);
}