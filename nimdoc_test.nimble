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

task genDocs, "Generate API reference from Nim sources":
  exec "nim doc --project --index:on -o:docs -d:docgen src/nimdoc_test"

task serveDocs, "Start local docs site with Docker (foreground)":
  exec "docker-compose up"

task stopDocs, "Stop the local docs site (Docker)":
  exec "docker-compose down"

task openDocs, "Open docs site in default browser":
  when defined(windows):
    exec "start http://localhost:4000"
  elif defined(macosx):
    exec "open http://localhost:4000"
  else:
    exec "xdg-open http://localhost:4000"

task docs, "Start docs in background (Docker) and open browser":
  exec "docker-compose up -d"
  openDocsTask()
