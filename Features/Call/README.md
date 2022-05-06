# Call

在 Solidity 裡面我們可以使用"call"來呼叫其他合約的 function，這樣的呼叫方式也稱作 low-level call，但 call 在大多數的情況下並不適合使用，因為它省略了 type 的檢查、function 的檢查以及參數打包等等，但使用 call 來呼叫 function 也能省下不少 gas，call 也常用來發送以太幣至智能合約。

現在就來看怎麼使用 call 從其他智能合約來呼叫 TestCall 裡面的 giveYouNumber function，該 function 會回傳一個布林值和一個數字。

![Image](https://i.imgur.com/XubFR1g.png)

要使用 call function 必須先定義要呼叫的智能合約地址，以下圖為例，\_test 將是我們要傳入的智能合約地址，該地址應為 TestCall 部署後的地址。

而有了合約地址以後，我們可以使用 abi.encodeWithSignature function，而我們要呼叫的是 TestCall 的 giveYouNumber，所以要在裡面傳入 giveYouNumber(uint256)，並在第二個參數傳入輸入值。

而成功執行後，call function 會有兩個回傳值，第一個為布林值，function 成功執行的話會回傳 true，失敗則回傳 false，而第二個回傳值為執行 function 後的結果，回傳的格式為 bytes。

![Image](https://i.imgur.com/yAV90df.png)

![Image](https://i.imgur.com/magr0dX.png)

而因為回傳的格式為 bytes，假使我們要讀取 giveYouNumber 的回傳值，則必須在進行解碼，解碼的程式碼如下圖：

我們將 bytes 進行解碼 decode，而 decode 後的回傳值會是 giveYouNumber function 的回傳值，應為 true 和 123。

![Image](https://i.imgur.com/VmcHhld.png)

![Image](https://i.imgur.com/pbIgoSZ.png)
