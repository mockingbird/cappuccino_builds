@STATIC;1.0;i;9;Nib2Cib.jt;1005;objj_executeFile("Nib2Cib.j", YES);var OS = require("os"),
    stream = (require("narwhal/term")).stream;
main = function(args)
{
    checkUlimit();
    var nib2cib = ((___r1 = Nib2Cib.isa.objj_msgSend0(Nib2Cib, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithArgs:", args));
    (nib2cib == null ? null : nib2cib.isa.objj_msgSend0(nib2cib, "run"));
    var ___r1;
}
checkUlimit = function()
{
    var minUlimit = 1024,
        p = OS.popen(["ulimit", "-n"]);
    if (p.wait() === 0)
    {
        var limit = ((p.stdout.read()).split("\n"))[0];
        if (Number(limit) < minUlimit)
        {
            stream.print("\0red(\0bold(WARNING:\0)\0) nib2cib may need to open more files than this terminal session currently allows (" + limit + "). Add the following line to your login configuration file (.bash_profile, .bashrc, etc.), start a new terminal session, then try again:\n");
            stream.print("ulimit -n " + minUlimit);
            OS.exit(1);
        }
    }
}
