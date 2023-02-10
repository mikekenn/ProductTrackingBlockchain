# ProductTrackingBlockchain
Product tracking system created on the Ethereum blockchain

@leahpink is now an expert in the GIT process on Visual Studio Code. She can walk you through how to get your code from your local computer to our Master branch :).

## Installation Tutorial:

1. testRPC install
    - We use testrpc as the test chain for the project. First run the following command to install testrpc.

            npm install -g ethereumjs-testrpc

    - Start testrpc after the installation is complete, execute the following command.

            testrpc -m '[mnemonicPhrase]'

2. Contract deploy

    Enter the 'eth-traceabilityplatform' directory

        cd eth-traceabilityplatform


    Install dependence

        npm install

    Deploy contract

        truffle migrate

    After the contract is deployed, you can start calling the interface.

3. Run eth-traceabilityplatform Dapps

    First enter the `build/` directory

        cd ./build

    Open the `index.html` page in your browser and you're ready to experience eth-traceabilityplatform!