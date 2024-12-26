import { App, Astal, Gtk, Gdk, Widget } from "astal/gtk3"
import { Variable } from "astal"
import { BoxProps, CenterBoxProps } from "astal/gtk3/widget"

const { TOP, LEFT, RIGHT, BOTTOM } = Astal.WindowAnchor
const { START, CENTER, END } = Gtk.Align

const time = Variable("").poll(1000, "date")

function VerticalCenterBox(props: CenterBoxProps) {
  return <centerbox
    {...props}
    vertical
  />
}

function VerticalBox(props: BoxProps) {
  return <box
    {...props}
    vertical
  />
}

export default function Bar(gdkmonitor: Gdk.Monitor) {
  return <window
    name="Bar"
    className="Bar"
    gdkmonitor={gdkmonitor}
    exclusivity={Astal.Exclusivity.EXCLUSIVE}
    anchor={TOP | LEFT | BOTTOM}
    application={App}>
    <VerticalCenterBox>
      <button
        onClicked="echo hello"
        halign={CENTER}
        valign={START}
      >
        Welcome to AGS!
      </button>
      <VerticalBox>
        <label>CIAO</label>
        <label>CIAO</label>
      </VerticalBox>
      <button
        onClicked={() => print("hello")}
        halign={CENTER}
        valign={END}
      >
        <label label={time()} />
      </button>
    </VerticalCenterBox>
  </window>
}
