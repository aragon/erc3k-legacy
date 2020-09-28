const { expect } = require("chai");

describe("ERC3000", function() {
  let erc3k

  beforeEach(async () => {
    const ERC3000 = await ethers.getContractFactory("ERC3000")
    erc3k = await ERC3000.deploy()
  })

  it('deployed', async () => {
      expect(await erc3k.is3k()).to.equal(true)
  })
})
