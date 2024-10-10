const { speaker } = await Service.import("audio")

const child = Widget.Slider({
  value: speaker.bind("volume"),
  onChange: ({ value }) => speaker.volume = value,
})

const Bar = () => Widget.Window({
  name: 'bar',
  anchor: ['top', 'left', 'right'],
  child: child,
})

App.config({ windows: [Bar()] })
