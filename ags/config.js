import { applauncher } from "./modules/applauncher.js"
import { Bar } from "./modules/bar.js"

App.config({
  windows: [applauncher, Bar(0)],
})
