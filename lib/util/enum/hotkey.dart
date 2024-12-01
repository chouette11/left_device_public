
enum WindowsHotkeyEnum {
  esc('esc', 'esc'),
  tab('tab', 'tab'),
  win('win', 'win'),
  backSpace('back space', 'back'),
  capsLock('capsLock', 'capslock'),
  shift('shift', 'shift'),
  function('fn', 'fn'),
  enter('Enter', 'return'),
  ctrl('ctrl', 'ctrl'),
  alt('alt', 'alt'),
  space('space', 'space'),
  decide('決定', '');


  const WindowsHotkeyEnum(this.displayName, this.value);

  final String displayName;
  final String value;
}

enum MacHotKeyEnum {
  esc('esc', 'esc'),
  tab('tab', 'tab'),
  eisuu('英数', 'eisu'),
  kana('かな', 'kana'),
  control('control', 'ctrl'),
  shift('shift', 'shift'),
  function('fn', 'fn'),
  enter('Enter', 'return'),
  option('option', 'option'),
  command('command', 'command'),
  space('space', 'space'),
  decide('決定', '');

  const MacHotKeyEnum(this.displayName, this.value);
  
  final String displayName;
  final String value;
}