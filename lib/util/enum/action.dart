enum ActionTypeEnum {
 hotkey('hotkey'),
 appOpen('appOpen'),
 typewrite('typewrite'),
 none('none');

 const ActionTypeEnum(this.displayName);

 final String displayName;
}