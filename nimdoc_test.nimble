# Package

version       = "0.1.0"
author        = "Anonymous"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
installExt    = @["nim"]
bin           = @["nimdoc_test"]


# Dependencies

requires "nim >= 2.2.4"

task docgen, "Generate project documentation":
  exec "nim doc --project --index:on -o:docs -d:docgen src/nimdoc_test"