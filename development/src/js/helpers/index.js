export const percentageCalculation = (current, bought) => {
  return ((( current - bought) / bought) * 100).toFixed(2)
}

export const chooseMarket = (market, misc) => {
  let marketPrice = {
    price: 0,
    percChange: 0,
  }

  switch(market) {
    case 'ETH':
      marketPrice = response.ETHUSDTPrice
      break;
    case 'TUSD':
      marketPrice = response.TUSDUSDTPrice
      break;
    case 'PAX':
      marketPrice = response.PAXUSDTPrice
      break;
    case 'BNB':
      marketPrice = response.BNBUSDTPrice
      break;
    case 'XRP':
      marketPrice = response.XRPUSDTPrice
      break;
    case 'USDC':
      marketPrice = response.USDCUSDTPrice
      break;
    case 'HT':
      marketPrice = response.HTUSDTPrice
      break;
    case 'USDS':
      marketPrice = response.USDSUSDTPrice
      break;
    case 'NEO':
      marketPrice = response.NEOUSDTPrice
      break;
    case 'KCS':
      marketPrice = response.KCSUSDTPrice
      break;
    case 'XMR':
      marketPrice = response.XMRUSDTPrice
      break;
    case 'USDT':
      marketPrice = 1
      break;
    case 'USD':
      marketPrice = 1
      break;
    case 'HUSD':
      marketPrice = 1
      break;
    case 'DAI':
      marketPrice = 1
      break;
    default:
      marketPrice = response.BTCUSDTPrice
  }

  return marketPrice
}
