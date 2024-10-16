// @ts-ignore
const battery = await Service.import("battery")

const BatteryPercent = () => Widget.Label()
  .hook(battery, self => {
    self.label = `${battery.percent}%`
    self.visible = battery.available
  }, "changed")

const MyButton = () => Widget.Button()
  .on("clicked", self => {
    print(self, "is clicked")
  })

const MyDate = () => Widget.Label({
  css: "color:blue; padding: 1em;",
})
  .poll(1000, self => {
    self.label = Utils.exec("date +'%_H:%_M:%S'")
  })

const MyKeybind = () => Widget.Button()
  .keybind(["MOD1", "CONTROL"], "a", (_self, _event) => {
    print("alt+control+a was pressed")
  })

const Bar = () => Widget.Window({
  name: 'bar',
  anchor: ['top', 'left', 'right'],
  child: MyDate(),
})

const scss = `${App.configDir}/style.scss`
const css = "/tmp/my-style.css"
Utils.exec(`sassc ${scss} ${css}`)

App.config({
  style: css,
  windows: [Bar()],
})

