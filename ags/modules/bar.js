const hyprland = await Service.import("hyprland")
const audio = await Service.import("audio")
const battery = await Service.import("battery")
const network = await Service.import("network")

const hour = Variable("", {
  poll: [60000, 'date "+%H:%M"']
})

function IconLabel(icon, label) {
  return [
    Widget.Icon({ icon }),
    Widget.Label({ label }),
  ]
}

function Workspaces() {
  const active = hyprland.active.workspace.bind("id")
  const workspaces = hyprland.bind("workspaces")
    .as(ws => ws.map(({ id }) => Widget.Button({
      on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
      child: Widget.Label(`${id}`),
      class_name: active.as(i => `${i === id ? "focused" : ""}`)
    })))
  return Widget.Box({
    class_name: "workspaces",
    children: workspaces,
  })
}

//function SysTray() {
//
//}

function Clock() {
  return Widget.Label({
    class_name: "clock",
    label: hour.bind(),
  })
}

function Network() {
  const label = network.wifi.bind("strength").as(s => ` ${s}`)
  return Widget.Box({
    class_name: "network",
    children: [
      Widget.Label({ label })
    ]
  })
}

function Volume() {
  const icons = {
    101: "overamplified",
    67: "high",
    34: "medium",
    1: "low",
    0: "muted",
  }
  function getIcon() {
    const icon = audio.speaker.is_muted ? 0 : [101, 67, 34, 1, 0].find(
      threshold => threshold <= audio.speaker.volume * 100)

    return `audio-volume-${icons[icon]}-symbolic`
  }

  const icon = Utils.watch(getIcon(), audio.speaker, getIcon)
  const label = audio.speaker.bind("volume").as(v => ` ${Math.floor(v * 100 + 0.01)}%`)

  return Widget.Box({
    class_name: "volume",
    children: IconLabel(icon, label)
  })
}

function Battery() {
  const label = battery.bind("percent").as(p => ` ${p}%`)
  const icon = battery.bind("percent").as(p =>
    `battery-level-${Math.floor(p / 10) * 10}-symbolic`
  )

  return Widget.Box({
    class_name: "battery",
    children: IconLabel(icon, label)
  })
}

function Left() {
  return Widget.Box({
    spacing: 10,
    children: [
      Workspaces(),
      //SysTray(),
    ]
  })
}
function Center() {
  return Widget.Box({
    spacing: 10,
    children: [
      Clock(),
    ]
  })
}
function Right() {
  return Widget.Box({
    hpack: "end",
    spacing: 10,
    children: [
      Network(),
      Volume(),
      Battery(),
    ]
  })
}

export function Bar(monitor = 0) {
  return Widget.Window({
    name: `bar-${monitor}`,
    class_name: "bar",
    monitor,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      start_widget: Left(),
      center_widget: Center(),
      end_widget: Right(),
    }),
  })
}

