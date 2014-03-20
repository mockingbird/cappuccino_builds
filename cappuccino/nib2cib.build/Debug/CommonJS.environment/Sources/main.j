@STATIC;1.0;i;9;Nib2Cib.jt;884;objj_executeFile("Nib2Cib.j", YES);var OS = require("os"),
    stream = (require("narwhal/term")).stream;
main = function(args)
{
    checkUlimit();
    var nib2cib = objj_msgSend(objj_msgSend(Nib2Cib, "alloc"), "initWithArgs:", args);
    objj_msgSend(nib2cib, "run");
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
