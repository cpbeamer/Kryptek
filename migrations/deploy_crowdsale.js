const Krytek = artifacts.require("./Kryptek.sol");

module.exports = function(deployer) {
    const name = "Kryptek";
    const symbol = "KTEK";
    deployer.deploy(Krytek, name, symbol);
}

