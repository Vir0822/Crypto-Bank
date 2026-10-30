// Licence
// SPDX-License-Identifier: LGPL-3.0-only

// Solidity version 
pragma solidity 0.8.24;

// functions: 
 // 1. deposit ether 
 // 2.  withdraw ether 

// Rules: 
  // 1. Multiuser 
  // 2. Only can deposit Ether 
  // 3. User can only withdraw previously deposited ether 
  // 4. Max balance = 5 ETH 
  // 5. MaxBalance modifiable by owner 
  // User A -> Deposit (5 ETH)
  // User B -> Deposit (2 ETH)
  // Bank balance = 7 ETH 
  // User A -> Deposit (1 ETH) -> Deposit (5 ETH) -> wihdraw (2 ETH) -> Deposit (5 ETH)

contract CryptoBank {


  // Variables 
  uint256 public maxBalance;
  address public admin; 
  mapping(address => uint256) public userBalance; 

  // Events 
  event EtherDeposit(address user_, uint256 etheramount_);
  event EtherWithdraw(address user_, uint256 etheramount_);

  // Modifiers 
  modifier onlyAdmin() {
    require(msg.sender == admin, "Not allowed"); 
    _; 
  }

  constructor(uint256 maxBalance_, address admin_) {
    maxBalance = maxBalance_; 
    admin = admin_; 
  }
    
 // External Functions 

  // 1. Deposit 
function depositEther() external payable {
  require(userBalance [msg.sender] + msg.value <= maxBalance, "MaxBalance reached"); 
  userBalance[msg.sender] += msg.value;
  emit EtherDeposit(msg.sender, msg.value); 

  }

 // 2. withdraw 
 function withdrawEther(uint256 amount_) external {
   require(amount_ <= userBalance[msg.sender], "Not enough ether"); 

  // 1, Update state 
  userBalance [msg.sender] -= amount_; 

  // 2. Transfer ether 
  (bool success,) = msg.sender.call{value: amount_}("");
  require(success, "Transfer failed");

  emit EtherWithdraw (msg.sender, amount_);
 }
 // 3.  Modify maxBalance 
function modifyMaxBalance(uint256 newMaxBalance_) external onlyAdmin {
  maxBalance = newMaxBalance_;

} 

}