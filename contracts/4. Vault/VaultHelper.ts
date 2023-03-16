import { expect } from "chai";
import { ethers, waffle } from "hardhat";

const helper = async (victim: any) => {
    await victim.unlock(await ethers.provider.getStorageAt(victim.address, 1));
};

export default helper;
