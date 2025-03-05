import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { bind, Variable } from "astal"
import { BoxProps, CenterBoxProps } from "astal/gtk3/widget"
import AstalBattery from "gi://AstalBattery"
import AstalNetwork from "gi://AstalNetwork"
import AstalBluetooth from "gi://AstalBluetooth"

const { TOP, LEFT, RIGHT, BOTTOM } = Astal.WindowAnchor
const { START, CENTER, END } = Gtk.Align

function VerticalCenterBox(props: CenterBoxProps) {
  return <centerbox
    {...props}
    vertical
    halign={CENTER}
  />
}

function VerticalBox(props: BoxProps) {
  return <box
    {...props}
    vertical
    halign={CENTER}
  />
}

function Clock() {
  const hours = Variable("").poll(360000, "date +%_H")
  const minutes = Variable("").poll(60000, "date +%_M")

  return <VerticalBox
    className="Clock"
    onDestroy={() => {
      hours.drop()
      minutes.drop()
    }}
  >
    {hours()}
    {minutes()}
  </VerticalBox>
}

function Battery() {
  const bat = AstalBattery.get_default()

  return <icon
    className="Battery"
    tooltipText={bind(bat, "percentage").as((v) => `${v * 100}%`)}
    icon={bind(bat, "iconName")}
  />
}

function Wifi() {
  const wifi = AstalNetwork.get_default().get_wifi()!

  return <icon
    className="Wifi"
    tooltipText={bind(wifi, "ssid").as(String)}
    icon={bind(wifi, "iconName")}
  />
}

function Bluetooth() {
  const bluetooth = AstalBluetooth.get_default()

  const isPowered = bind(bluetooth, "isPowered")

  return <label
    className="Bluetooth"
    label={isPowered.as(String)}
  />
}

export default function Bar(gdkmonitor: Gdk.Monitor) {
  return <window
    name="Bar"
    gdkmonitor={gdkmonitor}
    exclusivity={Astal.Exclusivity.EXCLUSIVE}
    anchor={TOP | LEFT | BOTTOM}
    application={App}>
    <VerticalCenterBox
      className="Bar"
    >
      <VerticalBox
        className="ModulesTop"
        valign={START}
      >
      </VerticalBox>
      <VerticalBox
        className="ModulesMiddle"
        valign={CENTER}
      >
        <Clock />
      </VerticalBox>
      <VerticalBox
        className="ModulesBottom"
        valign={END}
      >
        <Bluetooth />
        <Wifi />
        <Battery />
      </VerticalBox>
    </VerticalCenterBox>
  </window >
}
