# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
    s.name = %q{Narwhal}
    s.version = "0.0.1"
    s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
    s.authors = ["Tom Robinson", "Kris Kowal", "George Moschovitis", "Kevin Dangoor", "Hannes Wallnöfer"]
    s.date = %q{2009-05-30}
    s.description = %q{An implementation of the ServerJS standard library}
    s.email = %q{jack-js@googlegroups.com}
    s.homepage = %q{http://narwhaljs.org}
    s.executables = ["narwhal"]
    s.files = [
        "bin",
        "bin/js",
        "bin/narwhal",
        "bin/sea",
        "bin/tusk",
        "lib",
        "lib/args.js",
        "lib/codec",
        "lib/codec/base64.js",
        "lib/file.js",
        "lib/hash.js",
        "lib/hashp.js",
        "lib/http.js",
        "lib/io.js",
        "lib/json.js",
        "lib/logger.js",
        "lib/mime.js",
        "lib/narwhal",
        "lib/narwhal/repl.js",
        "lib/narwhal/tusk-init.js",
        "lib/narwhal/tusk.js",
        "lib/narwhal.js",
        "lib/packages.js",
        "lib/ref_send.js",
        "lib/regexp.js",
        "lib/sandbox.js",
        "lib/string.js",
        "lib/test",
        "lib/test/assert.js",
        "lib/test/equiv.js",
        "lib/test/jsdump.js",
        "lib/test/runner.js",
        "lib/unload.js",
        "lib/uri.js",
        "lib/util.js",
        "lib/xregexp.js",
        "engines",
        "engines/browser",
        "engines/browser/lib",
        "engines/browser/lib/reactor.js",
        "engines/default",
        "engines/default/lib",
        "engines/default/lib/array.js",
        "engines/default/lib/file-engine.js",
        "engines/default/lib/function.js",
        "engines/default/lib/global.js",
        "engines/default/lib/io-engine.js",
        "engines/default/lib/object.js",
        "engines/default/lib/reactor.js",
        "engines/default/lib/system.js",
        "engines/k7",
        "engines/k7/bin",
        "engines/k7/bin/narwhal-k7",
        "engines/k7/bootstrap.js",
        "engines/k7/lib",
        "engines/k7/lib/file-engine.js",
        "engines/k7/lib/system.js",
        "engines/rhino",
        "engines/rhino/bin",
        "engines/rhino/bin/narwhal-rhino",
        "engines/rhino/bootstrap.js",
        "engines/rhino/jars",
        "engines/rhino/jars/jline.jar",
        "engines/rhino/jars/js.jar",
        "engines/rhino/lib",
        "engines/rhino/lib/binary.js",
        "engines/rhino/lib/file-engine.js",
        "engines/rhino/lib/http-engine.js",
        "engines/rhino/lib/io-engine.js",
        "engines/rhino/lib/os.js",
        "engines/rhino/lib/packages-engine.js",
        "engines/rhino/lib/process.js",
        "engines/rhino/lib/sandbox-engine.js",
        "engines/rhino/lib/system.js",
        "engines/rhino/lib/zip.js",
        "engines/secure",
        "engines/secure/lib",
        "engines/secure/lib/file.js",
        "engines/secure/lib/system.js",
        "engines/template",
        "engines/template/bin",
        "engines/template/bin/narwhal-engine-name",
        "engines/template/bootstrap.js",
        "engines/template/lib",
        "engines/template/lib/file-engine.js",
        "engines/template/lib/system.js",
        "engines/v8cgi",
        "engines/v8cgi/bootstrap.js"
    ]
    s.require_paths = ["lib"]
    s.rubygems_version = %q{1.3.3}
    s.summary = %q{Implementation of the ServerJS standard library}
end
