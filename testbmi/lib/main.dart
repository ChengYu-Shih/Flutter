import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home :bmicalculator(),
    );
  }
}
class bmicalculator extends StatefulWidget{    //新增bmicalculator類別,讓他繼承StatelessWidget
  bmicalculator({Key? key}): super(key: key);
  @override
  _bmicalculatorState createState() => _bmicalculatorState();
}
class _bmicalculatorState extends State<bmicalculator> {
  final ValueNotifier<String>_msg = ValueNotifier('');
  int currentindex = 0;
  String result= "";
  double height=0;    //浮點數型態
  double weight=0;

  TextEditingController heightController=TextEditingController();
  TextEditingController weightController=TextEditingController();
  @override
  Widget build(BuildContext context) {         //build()方法的context參數就是我們需要的Context
    final drawer =Drawer(
      child: ListView(                        //把ListView設定給Drawer的child參數
        children: <Widget> [
          const DrawerHeader(
              child: Text('BMI 計算機', style: TextStyle(fontSize: 20),),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          ListTile(
            title:const Text('帳號設定', style: TextStyle(fontSize: 20),),
            onTap: (){
              _msg.value='帳號設定';
              Navigator.pop(context);     //呼叫Navigator.pop()關閉Drawer
            },
          ),

          ListTile(
            title:const Text('最新消息', style: TextStyle(fontSize: 20),),
            onTap: (){
              _msg.value='最新消息';
              Navigator.pop(context);
            },
          ),
          ListTile(
            title:const Text('裝置', style: TextStyle(fontSize: 20),),
            onTap: (){
              _msg.value='裝置';
              Navigator.pop(context);
            },
          ),
          ListTile(
            title:const Text('同步', style: TextStyle(fontSize: 20),),
            onTap: (){
              _msg.value='同步';
              Navigator.pop(context);
            },
          ),
          ListTile(
            title:const Text('外觀設定', style: TextStyle(fontSize: 20),),
            onTap: (){
              _msg.value='外觀設定';
              Navigator.pop(context);
            },
          ),
          ListTile(
            title:const Text('通知', style: TextStyle(fontSize: 20),),
            onTap: (){
              _msg.value='通知';
              Navigator.pop(context);
            },
          ),
          ListTile(
            title:const Text('輔助功能', style: TextStyle(fontSize: 20),),
            onTap: (){
              _msg.value='輔助功能';
              Navigator.pop(context);
            },
          ),
          ListTile(
            title:const Text('進階', style: TextStyle(fontSize: 20),),
            onTap: (){
              _msg.value='進階';
              Navigator.pop(context);
            },
          ),
          ListTile(
            title:const Text('語言', style: TextStyle(fontSize: 20),),
            onTap: (){
              _msg.value='語言';
              Navigator.pop(context);
            },
          ),
          ListTile(
            title:const Text('訂閱&追隨', style: TextStyle(fontSize: 20),),
            onTap: (){
              _msg.value='訂閱&追隨';
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );

    return Container(
      child: Scaffold(
        backgroundColor: Colors.lightGreen,   //頁面背景色
        appBar: AppBar(
          title: Text("BMI 計算機", style: TextStyle(color: Colors.black,fontSize: 30),
          ),
          centerTitle: true,   //標題致中
          elevation: 2.0,      //標題寬度
          backgroundColor: Color(0xff64A600),  //標題背景色

          actions: [
            IconButton(                      //右上齒輪按鈕
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.white,       //按鈕顏色(白)
              ),
            ),
          ],
        ),



        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,  //(水平)靠左對齊
              crossAxisAlignment: CrossAxisAlignment.start,//(垂直)縱向起點

              children: [
                SizedBox(
                  height:1.0,
                ),
                Text("身高 : ",
                  style: TextStyle(
                    fontWeight:FontWeight.bold, //字體 粗
                    fontSize: 20.0,             //字體大小
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller:  heightController,
                  textAlign: TextAlign.center,

                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(5),
                    hintText: "身高 : ",
                    filled: true,
                    fillColor: Colors.lightGreenAccent,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text("體重 : ",
                  style: TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller:  weightController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(5),
                    hintText: "體重 : ",
                    filled: true,
                    fillColor: Colors.lightGreenAccent,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),//圓角
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 15.0,),                //Container之間的高度
                Container(
                  width:double.infinity,
                  height:40.0,
                  child: ElevatedButton(                //突起的按鈕
                    onPressed:(){
                      setState((){
                        height= double.parse(heightController.value.text);
                        weight= double.parse(weightController.value.text);
                      });
                      calculatebmi(height, weight);
                    },
                    child:Text("開始計算",style: TextStyle(color: Colors.white,
                    )),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      //設定ElevatedButton的顏色,突起的高度和文字到邊緣的距離
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                SizedBox(height: 15.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text("你的BMI為:", textAlign: TextAlign.center,
                    style:TextStyle(
                      fontSize: 30.0,
                      fontWeight:FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 2.0,),
                Container(
                  width: double.infinity,
                  child: Text(
                    "$result",          //字串裡頭用$符號 把物件內容轉成字串
                    textAlign: TextAlign.center,
                    style:TextStyle(
                      fontSize: 60.0,
                      fontWeight:FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 50.0,),
                Container(
                  width: double.infinity,  //寬無限大
                  child: Image.asset("assets/images/bmi6.png"),
                  //用Image類別的assets()方法讀取影像資源檔
                ),
              ],
            ),
          ),
        ),
        drawer: drawer,         //把drawer物件設定給Scafford物件的drawer參數
      ),
    );
  }
  void calculatebmi(double height,double weight) {                     //計算BMI
    double finalresult = weight / ((height / 100) * (height / 100));
    String bmi = finalresult.toStringAsFixed(1);
    setState(() {
      result = bmi;
    });
  }
  Widget_showMsg(BuildContext context,String msg, Widget? child) {
    final widget = Text (msg,
        style: const TextStyle(fontSize:20));
    return widget;
  }
}