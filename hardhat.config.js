require("@nomiclabs/hardhat-truffle5");

module.exports = {
    solidity: {
        version: "0.8.24",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200,
          },
          viaIR: true,
        },
      },
};