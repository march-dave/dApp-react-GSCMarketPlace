var GSCMarket = artifacts.require("./GSCMarket.sol");

module.exports = function(deployer) {
  deployer.deploy(GSCMarket);
};
