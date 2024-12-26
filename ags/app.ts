import { App } from "astal/gtk3"
import { exec } from "astal/process"

import Bar from "./widget/Bar"

function updateStyle() {
  App.reset_css()
  exec(`sass ./style.scss /tmp/style.css`)
  App.apply_css("/tmp/style.css")
}

App.start({
  requestHandler(request, res) {
    switch (request) {
      case "reload":
        updateStyle()
        res("style reloaded")
        break;
      default:
        res("unknown command")
        break;
    }
  },
  main() {
    updateStyle()
    App.get_monitors().map(Bar)
  },
})
