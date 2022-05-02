# Function Destructor

Solidity 也支援解構賦值之功能，只要將 function 回傳的型態定義好即可。

![Image](https://i.imgur.com/o3etgDE.png)

![Image](https://i.imgur.com/cOzh0SR.png)

而如果在解構的過程中，想要過濾掉部分參數也可以，以下圖舉例，我們可能在 powerful function 內不會用到 uint(100)和 bool(true)這兩個參數，所以我們可以改寫成以下：

![Image](https://i.imgur.com/UxNMpD7.png)

跟 Javascript 的解構賦值較不同，在 Solidity 中，當我們要略過解構的值需在括號內加上逗號 _,_ 來略過，以上圖來說因為 returnMany 預設的回傳順序是 uint, address, bool，所以如果要省略 uint 和 bool 只回傳 address 的話，必須寫成 (,address sender,)。

![Image](https://i.imgur.com/VeyUvFE.png)

Solidity 的解構也支援參數的傳入，假設有一 calculation function，是將傳入的兩個數字相加後回傳，而如果我們只想取得結果，不在意傳入的數字為何，則可以利用以下方式達成：

![Image](https://i.imgur.com/2xJgjQy.png)

![Image](https://i.imgur.com/JgeVp7u.png)
