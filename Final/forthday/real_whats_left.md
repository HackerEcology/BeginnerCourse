# Real What's Left

首先我们在第二天实现了一个本地版的What's Left! 但是它只能在本机上面运行，相信大家都或多或少的使用过网易云笔记等在线的记事本，可以将数据同步到云端，使用多个终端来访问，下面我们将教大家把What's Left 的数据部署到云端。



####1.新建一个项目

在上节课中，我们已经测试了可以将数据传送到parse后端。
进入Parse的Dashboard, 新建一个What's Left 的app， 然后进入settings查看自己的Application ID 和 Client Key！


####2.打开下载的SDK项目

在 AppDelegate.swift 中添加自己的ID 和Key
```
// Uncomment and fill in with your Parse credentials:
        Parse.setApplicationId("aYRgD7Paafak77TYyWTz5YZjYgkBwdgDyDNGSpGF", clientKey: "NVMsrA7t8BjEl3rB5HWB14rtjnENqFUUrkH6o4LI")
```
#### 3. 创建一个新的TableView
参照第二天的教程
新建一个Memo类

```
import Foundation

class Memo {
    var title: String!
    var description: String!

    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
}
```
####4.ViewController

新建一个memolist 和pollArray
```
var memoList: [Memo] = [Memo]()
var pollArray: NSArray!

```

在viewDidLoad 中添加查询数据代码

```
override func viewDidLoad() {

       super.viewDidLoad()
// Do any additional setup after loading the view, typically from a nib.

/*
var temp = PFObject(className:"todolist")
temp["title"] = "test1"
temp["description"] = "des_test1"
temp.saveInBackground()
*/
var query = PFQuery(className: "todolist")
var nsa = query.findObjects() as NSArray
pollArray = nsa
for i in pollArray {
    println(i["title"] as String)
    let memo = Memo(title: i["title"] as String, description: i["description"] as String)
    memoList.append(memo)
}

}

```


添加显示数据函数

```
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = memoList[indexPath.row].title
        return cell

    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return memoList.count
        //return memoList.count

    }

```
>>>>>>> a6bdb8de1ec1d01fb8f5bd15980c3c7f7d90dbb0

