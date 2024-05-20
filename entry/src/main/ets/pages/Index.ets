@Observed
class LabeledValue {
  public label: string = ''
  public done: boolean = false

  constructor(label: string, done: boolean) {
    this.label = label
    this.done = done
  }
}


@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State todoList: LabeledValue[] =
    [
      new LabeledValue('晨練', false), new LabeledValue('早飯', false), new LabeledValue('讀書', false),
      new LabeledValue('學習', false), new LabeledValue('刷劇', false), new LabeledValue('刷劇123', false),
      new LabeledValue('刷劇124', false), new LabeledValue('刷劇125', false), new LabeledValue('刷劇126', false),
      new LabeledValue('刷劇128', false), new LabeledValue('刷劇129', false), new LabeledValue('刷劇127', false),
    ];

  build() {


    Column({ space: 16 }) {
      Text('代辦').fontSize(28).fontWeight(FontWeight.Bold).padding(12)
      List({ space: 16 }) {
        ForEach(this.todoList, (item: LabeledValue) => {
          ListItem() {
            TodoItem({ item: item })
          }
        }, (item: LabeledValue) => item.label)
      }.layoutWeight(1)

    }.backgroundColor('#f1f2f4').height('100%').padding(20).alignItems(HorizontalAlign.Start)
  }
}

@Component
struct TodoItem {
  @ObjectLink item: LabeledValue;

  build() {
    Row() {
      Row() {
        Checkbox()
          .margin({ right: 16 })
          .size({ width: 28, height: 28 })
          .select(this.item.done)
          .onChange(val => this.item.done = val)

        Text(this.item.label)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .decoration({ type: this.item.done ? TextDecorationType.LineThrough : TextDecorationType.None })
      }.opacity(this.item.done ? 0.4 : 1)
    }
    .height(50)
    .backgroundColor('#fefefe')
    .width('100%')
    .borderRadius(16)
    .padding(12)
  }
}