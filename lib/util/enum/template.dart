enum TemplateEnum {
  numericLeftTop('テンキー 広告左上', 'numeric', 2, 2, 2, 2, 1),
  numericLeftBottom('テンキー 広告左下', 'numeric', 2, 2, 2, 2, 2),
  numericRightTop('テンキー 広告右上', 'numeric', 2, 2, 2, 2, 3),
  numericRightBottom('テンキー 広告右下', 'numeric', 2, 2, 2, 2, 4),
  normalLeftTop('ノーマル 広告左上', 'normal', 2, 3, 3, 3, 1),
  normalLeftBottom('ノーマル 広告左下', 'normal', 2, 3, 3, 3, 2),
  normalCenterTop('ノーマル 広告中央上', 'normal', 2, 3, 3, 3, 3),
  normalCenterBottom('ノーマル 広告中央下', 'normal', 2, 3, 3, 3, 4),
  normalRightTop('ノーマル 広告右上', 'normal', 2, 3, 3, 3, 5),
  normalRightBottom('ノーマル 広告右下', 'normal', 2, 3, 3, 3, 6),
  numeric_4('テンキー', 'numeric', 2, 2, 2, 2, null),
  normal_6('ノーマル', 'normal', 2, 3, 3, 3, null);

  const TemplateEnum(this.name, this.type, this.column, this.row, this.leftButtonNum,
      this.rightButtonNum, this.adPosition);

  final String name;
  final String type;
  final int column;
  final int row;
  final int leftButtonNum;
  final int rightButtonNum;
  final int? adPosition;
}
