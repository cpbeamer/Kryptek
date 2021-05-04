const { assert } = require("node:console");
const { isContractAddressInBloom, isTopic } = require("web3-utils");
const BigNumber = web3.BigNumber;

require('chai')
    .use(require('chai-bignumber'))
    .should();

const Kryptek = artifacts.require('Kryptek');


contract('Kryptek', accounts => {
    const _name = 'Kryptek';
    const _symbol = 'KTEK';

    beforeEach(async function () {
        this.token = await Kryptek.new(_name, _symbol);
    })

    describe('token attributes', function() {
        it('has the right name', async function() {
            const name = await this.token.name();
            name.should.equal(_name);
        });

        it('has the right symbol', async function() {
            const symbol = await this.token.symbol();
            symbol.should.equal(_symbol);
        });


    });

});