# Task

1.现在的WhatsLEFT只能显示已经存在的数据，这显然不够炫酷，你需要为它增加一个添加备忘录的功能,你需要完成下面几件事情

    -在UINavigationBar上添加一个BarButtonItem，identifier为add，这样它就会是一个加号
    -新建一个用来添加备忘录的页面，你可以叫它AddViewController,页面会有三个要填的对象，title，description,time
    -建立BarButtonItem到AddViewController的segue，设置为modal
    -添加UnWindSegue
    -在AddViewController中保存数据
    -在prepareForSegue中传递数据
    -在ViewController中reloadData
2.了解SpriteKit
    掌握SKNodeSKSpriteNode
#Challange


####单元格向左滑动删除数据
###你需要调用tableView:commitEditingStyle:forRowAtIndexPath这个方法

####现在的备忘录只要退出程序，保存的条目就会消失，你需要使用CoreData做数据缓存，让备忘录在程序退出重新加载的时候找到历史备忘录
