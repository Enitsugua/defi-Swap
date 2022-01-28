require("@nomiclabs/hardhat-waffle");

// hardhat.config.js
require('@nomiclabs/hardhat-ethers');
// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more
const { alchemyApiKey, mnemonic } = require('./secrets.json');
/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.3",
      networks: {
         rinkeby: {
           url: `https://eth-rinkeby.alchemyapi.io/v2/${alchemyApiKey}`,
           accounts: { mnemonic: mnemonic },
         },
       },
  
};




