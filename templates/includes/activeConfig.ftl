<!-- Config -->
    <div id="tmplActiveConfig" class="hide">
      <div id="config-form">
        <div class="col-12" id="mainform">
          <div class="configuration-heading-container">

            <nav class="navbar navbar-expand-sm justify-content-center">
              <ul class="navbar-nav align-items-center">
                <li class="nav-item config-switcher-container">
                  <span class="active-config current">${activeConfig}</span>
                </li>
                <li class="nav-item">
                  <select class="mb-1 ml-1 mb-md-1 mbl-10 mtl-10 mll-0 keepEnabled header-select2 custom-select config-select" id="pairsmenu" data-setting-type="" name="">
                    <option value="" disabled selected hidden data-i18n="configOptions.default"></option>
                    <option value="default" data-i18n="configOptions.default"></option>
                  </select>
                </li>
                <li class="nav-item ">
                  <i class="fa fa-trash ml-3 removeConfig" aria-hidden="true" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]constantMsgs.delete"></i>
                  <i id="basic-hotconfig" class="fa fa-fire ml-3" aria-hidden="true" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]constantMsgs.hotConfig"></i>
                  <i id="saveButton" class="fa fa-floppy-o save-config-form  new-config-el ml-3" aria-hidden="true" data-toggle="tooltip" data-placement="bottom"
                    data-i18n="[title]constantMsgs.save"></i>
                  <i class="fa fa-share-alt share-config ml-3" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]constantMsgs.publishButton"></i>

                  <i class="fa fa-download backup-config ml-3" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]constantMsgs.backupButton"></i>
                  <i class="fa fa-spinner fa-spin ml-3" id="config-save-loader" style="visibility: hidden;"></i>
                </li>
                <li class="nav-item saveli">
                  <span class="show-save-message text-danger ml-3" data-i18n="configOptions.notSaved"></span>
                </li>
              </ul>
            </nav>
          </div>
          <div class="config-tab" id="configTabContainer">
            <ul class="nav nav-tabs tabs-bordered nav-justified gui-configuration-nav">
              <li class="nav-item">
                <a href="#pairs" class="nav-link active pairstab formstabs" data-setting-type="PAIRS" data-toggle="tab" aria-expanded="false" data-i18n="configOptions.pairs"></a>
              </li>
              <li class="nav-item">
                <a href="#dca" class="nav-link dcatab formstabs" data-setting-type="DCA" data-toggle="tab" aria-expanded="true" data-i18n="configOptions.dca"></a>
              </li>
              <li class="nav-item">
                <a href="#indicators" class="nav-link formstabs" data-setting-type="INDICATORS" data-toggle="tab" aria-expanded="true" data-i18n="configOptions.indicators"></a>
              </li>
            </ul>
            <div class="tab-content gui-config-content">
              <!--*****************************************************-->
              <!--  PAIRS tab -->
                <div class="tab-pane fade" id="pairs">

                  <div class="row justify-content-center">
                    <div class="d-flex balancecol card-box col-md-5">
                      <div class="row justify-content-center">
                        <div class="col-md-2">
                          <label class="control-label small  m-0 text-nowrap small full-text" for="market" data-i18n="configSection.market"></label>
                          <label class="control-label small  m-0 text-nowrap small short-text font-10" for="market" data-i18n="configSection.market"></label>
                          <select class="custom-select config-input form-control keepEnabled  mr-md-2  " data-setting-type="PAIRS" name="market" id="market">
                            <option value="" selected data-i18n="configSection.choose"></option>
                            <#list availableMarkets as market>
                              <option value="${market}">${market}</option>
                            </#list>
                          </select>
                        </div>
                        <div class="col-md-2">
                          <label class="control-label small  m-0 text-nowrap full-text" for="start_balance" data-i18n="configSection.startBalance"></label>
                          <label class="control-label small  m-0 text-nowrap short-text font-10" for="start_balance" data-i18n="configSection.startBalance"></label>
                          <input name="start_balance" id="start_balance" data-setting-type="PAIRS" class="form-control keepEnabled config-input" type="text">
                        </div>
                        <div class="col-md-2">
                          <label class="control-label small  m-0 text-nowrap full-text" for="keep_balance" data-i18n="configSection.keepBalance"></label>
                          <label class="control-label small  m-0 text-nowrap short-text font-10" for="keep_balance" data-i18n="configSection.keepBalance"></label>
                          <input name="keep_balance" id="keep_balance" data-setting-type="PAIRS" class="form-control keepEnabled config-input" type="text">
                        </div>
                        <div class="col-md-2">
                          <label class="control-label small  m-0 text-nowrap full-text" for="keep_balance_percentage" data-i18n="configSection.keepBalancePer"></label>
                          <label class="control-label small  m-0 text-nowrap short-text font-10" for="keep_balance_percentage" data-i18n="configSection.keepBalancePer"></label>
                          <input name="keep_balance_percentage" id="keep_balance_percentage" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                            type="text">
                        </div>
                        <div class="col-md-2">
                          <label class="control-label small  m-0 text-nowrap small full-text" for="default_initial_cost" data-i18n="configSection.initialCost"></label>
                          <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_initial_cost" data-i18n="configSection.initialCost"></label>
                          <input name="default_initial_cost" id="default_initial_cost" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                            type="text">
                        </div>
                        <div class="col-md-2">
                          <label class="control-label small  m-0 text-nowrap small full-text" for="default_initial_cost_percentage" data-i18n="configSection.initialCostPerc"></label>
                          <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_initial_cost_percentage" data-i18n="configSection.initialCostPerc"></label>
                          <input name="default_initial_cost_percentage" id="default_initial_cost_percentage" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                            type="text">
                        </div>
                      </div>
                    </div>
                    <div class="d-flex somcol card-box col-md-7">
                      <div class="row justify-content-center">
                        <div class="col-md">
                          <label class="control-label small  m-0 text-nowrap small full-text" for="price_trigger_market" data-i18n="configSection.priceTriggerMarket"></label>
                          <label class="control-label small  m-0 text-nowrap small short-text font-10" for="price_trigger_market" data-i18n="configSection.priceMarket"></label>
                          <select class="custom-select config-input form-control keepEnabled  mr-md-2  " data-setting-type="PAIRS" name="price_trigger_market"
                            id="price_trigger_market">
                            <option value="" selected data-i18n="configSection.choose"></option>
                            <#list triggerMarkets as market>
                              <option value="${market}">${market}</option>
                            </#list>
                          </select>
                        </div>
                        <div class="col-md">
                          <label class="control-label small  m-0 text-nowrap  small full-text" for="price_rise_trigger" data-i18n="[append]configSection.priceRise">{{market}}</label>
                          <label class="control-label small  m-0 text-nowrap  small short-text font-10" for="price_rise_trigger" data-i18n="[append]configSection.priceRise">{{market}}</label>
                          <input name="price_rise_trigger" id="price_rise_trigger" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                            type="text">
                        </div>
                        <div class="col-md">
                          <label class="control-label small  m-0 text-nowrap small full-text" for="price_rise_recover_trigger" data-i18n="[append]configSection.riseRecover">{{market}}</label>
                          <label class="control-label small  m-0 text-nowrap small short-text font-10" for="price_rise_recover_trigger" data-i18n="[append]configSection.recover">{{market}}</label>
                          <input name="price_rise_recover_trigger" id="price_rise_recover_trigger" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                            type="text">
                        </div>
                        <div class="col-md">
                          <label class="control-label small  m-0 text-nowrap small full-text" for="price_drop_trigger" data-i18n="[append]configSection.priceDrop">{{market}}</label>
                          <label class="control-label small  m-0 text-nowrap small short-text font-10" for="price_drop_trigger" data-i18n="[append]configSection.priceDrop">{{market}}</label>
                          <input name="price_drop_trigger" id="price_drop_trigger" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                            type="text">
                        </div>
                        <div class="col-md">
                          <label class="control-label small  m-0 text-nowrap small full-text" for="price_drop_recover_trigger" data-i18n="[append]configSection.dropRecover">{{market}}</label>
                          <label class="control-label small  m-0 text-nowrap small short-text font-10" for="price_drop_recover_trigger" data-i18n="[append]configSection.hypenRecover">{{market}}</label>
                          <input name="price_drop_recover_trigger" id="price_drop_recover_trigger" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                            type="text">
                        </div>
                        <div class="col-md">
                          <label class="control-label small  m-0 text-nowrap small full-text" for="consecutive_buy_trigger" data-i18n="configSection.consecutiveBuy"></label>
                          <label class="control-label small  m-0 text-nowrap small short-text font-10" for="consecutive_buy_trigger" data-i18n="configSection.consecutiveBuy"></label>
                          <input name="consecutive_buy_trigger" id="consecutive_buy_trigger" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                            type="text">
                        </div>
                        <div class="col-md">
                          <label class="control-label small  m-0 text-nowrap small full-text" for="consecutive_sell_trigger" data-i18n="configSection.consecutiveSell"></label>
                          <label class="control-label small  m-0 text-nowrap small short-text font-10" for="consecutive_sell_trigger" data-i18n="configSection.consecutiveSell"></label>
                          <input name="consecutive_sell_trigger" id="consecutive_sell_trigger" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                            type="text">
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row text-center">
                    <div class="card-box col-md buycol bc">
                      <div class="col buyrowAB">
                        <div class="row">
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap  full-text buy-label" for="default_a_buy_strategy" data-i18n="configSection.buyStrategyA"></label>
                            <label class="control-label small  m-0 text-nowrap  short-text font-10 buy-label" for="default_a_buy_strategy" data-i18n="configSection.buyA"></label>

                            <div class="pull-left m-0 p-0">
                              <input data-setting-type="PAIRS" class="tgl tgl-skewed config-input newback" type="checkbox" data-val="true" value="true"
                                name="default_a_buy_on_first_signal" id="default_a_buy_on_first_signal">
                              <label title="Buy on 1st signal" class="tgl-btn tgl-btn2 small font-10" data-tg-off="1st" data-tg-on="1st" for="default_a_buy_on_first_signal"></label>
                            </div>
                            <select class="custom-select config-input  form-control mr-md-2 keepEnabled" data-setting-type="PAIRS" name="default_a_buy_strategy"
                              id="default_a_buy_strategy">
                              <option value="" selected  data-i18n="configSection.choose"></option>
                              <#list buyStrategies as strategy>
                                <option value="${strategy}">${strategy}</option>
                              </#list>
                            </select>

                          </div>
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text " for="default_a_buy_value" data-i18n="configSection.buyValueA"></label>
                            <label class="control-label small  m-0 text-nowrap  short-text font-10" for="default_a_buy_value" data-i18n="configSection.buyValA"></label>
                            <input name="default_a_buy_value" id="default_a_buy_value" data-setting-type="PAIRS" class="form-control config-input keepEnabled"
                              type="text">
                          </div>
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text " for="default_a_buy_value_limit" data-i18n="configSection.buyLimitA"></label>
                            <label class="control-label small  m-0 text-nowrap  short-text font-10" for="default_a_buy_value_limit" data-i18n="configSection.buyLimA"></label>
                            <input name="default_a_buy_value_limit" id="default_a_buy_value_limit" data-setting-type="PAIRS" class="form-control config-input keepEnabled"
                              type="text">
                          </div>
                          <div class="col-md-2">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_a_buy_strategy_direction"  data-i18n="configSection.strategyDirectionA"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_a_buy_strategy_direction"  data-i18n="configSection.strategyDirectionA"></label>
                            <input name="default_a_buy_strategy_direction" id="default_a_buy_strategy_direction" data-setting-type="PAIRS" class="form-control config-input keepEnabled"
                              type="text">
                          </div>
                          <div class="col-1 pl-3 pt-1">
                            <span class="plusminus hide"></span>
                          </div>
                        </div>
                      </div>
                      <div class="col buyrow">
                        <div class="row">
                          <div class="col-md-3">
                            <label class="control-label small m-0 text-nowrap full-text buy-label" for="default_b_buy_strategy" data-i18n="configSection.buyStrategyB"></label>
                            <label class="control-label small m-0 text-nowrap short-text font-10 buy-label" for="default_b_buy_strategy" data-i18n="configSection.buyB"></label>
                            <div class="pull-left m-0 p-0">
                              <input data-setting-type="PAIRS" class="tgl tgl-skewed config-input newback" type="checkbox" data-val="true" value="true"
                                name="default_b_buy_on_first_signal" id="default_b_buy_on_first_signal">
                              <label title="Buy on 1st signal" class="tgl-btn tgl-btn2 small font-10" data-tg-off="1st" data-tg-on="1st" for="default_b_buy_on_first_signal"></label>
                            </div>
                            <select class="custom-select config-input form-control " data-setting-type="PAIRS" name="default_b_buy_strategy" id="default_b_buy_strategy"
                              disabled>
                              <option value="" selected data-i18n="configSection.choose"></option>
                              <#list buyStrategies as strategy>
                                <option value="${strategy}">${strategy}</option>
                              </#list>
                            </select>
                          </div>
                          <div class="col-md-3">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_b_buy_value" data-i18n="configSection.buyValueB"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_b_buy_value" data-i18n="configSection.buyValB"></label>
                            <input name="default_b_buy_value" id="default_b_buy_value" data-setting-type="PAIRS" class="form-control config-input" type="text"
                              disabled>
                          </div>
                          <div class="col-md-3">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_b_buy_value_limit" data-i18n="configSection.buyLimitB"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_b_buy_value_limit" data-i18n="configSection.buyLimB"></label>
                            <input name="default_b_buy_value_limit" id="default_b_buy_value_limit" data-setting-type="PAIRS" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-md-2">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_b_buy_strategy_direction"  data-i18n="configSection.strategyDirectionB"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_b_buy_strategy_direction"  data-i18n="configSection.strategyDirectionB"></label>
                            <input name="default_b_buy_strategy_direction" id="default_b_buy_strategy_direction" data-setting-type="PAIRS" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-1 pl-3 pt-1">
                            <span class="badge badge-success pull-left plusminus">

                            </span>
                          </div>
                        </div>
                      </div>
                      <div class="col buyrow">
                        <div class="row">
                          <div class="col-md-3">
                            <label class="control-label small m-0 text-nowrap full-text buy-label" for="default_c_buy_strategy" data-i18n="configSection.buyStrategyC"></label>
                            <label class="control-label small m-0 text-nowrap short-text font-10 buy-label" for="default_c_buy_strategy" data-i18n="configSection.buyC"></label>
                            <div class="pull-left m-0 p-0">
                              <input data-setting-type="PAIRS" class="tgl tgl-skewed config-input newback" type="checkbox" data-val="true" value="true"
                                name="default_c_buy_on_first_signal" id="default_c_buy_on_first_signal">
                              <label title="Buy on 1st signal" class="tgl-btn tgl-btn2 small font-10" data-tg-off="1st" data-tg-on="1st" for="default_c_buy_on_first_signal"></label>
                            </div>
                            <select class="custom-select config-input form-control " data-setting-type="PAIRS" name="default_c_buy_strategy" id="default_c_buy_strategy"
                              disabled>
                              <option value="" selected data-i18n="configSection.choose"></option>
                              <#list buyStrategies as strategy>
                                <option value="${strategy}">${strategy}</option>
                              </#list>
                            </select>
                          </div>
                          <div class="col-md-3">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_c_buy_value" data-i18n="configSection.buyValueC"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_c_buy_value" data-i18n="configSection.buyValC"></label>
                            <input name="default_c_buy_value" id="default_c_buy_value" data-setting-type="PAIRS" class="form-control config-input" type="text"
                              disabled>
                          </div>
                          <div class="col-md-3">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_c_buy_value_limit" data-i18n="configSection.buyLimitC"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_c_buy_value_limit" data-i18n="configSection.buyLimC"></label>
                            <input name="default_c_buy_value_limit" id="default_c_buy_value_limit" data-setting-type="PAIRS" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-md-2">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_c_buy_strategy_direction"  data-i18n="configSection.strategyDirectionC"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_c_buy_strategy_direction"  data-i18n="configSection.strategyDirectionC"></label>
                            <input name="default_c_buy_strategy_direction" id="default_c_buy_strategy_direction" data-setting-type="PAIRS" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-1 pl-3 pt-1">
                            <span class="badge badge-success pull-left plusminus">
                              <span class="fa fa-plus plusminusi"></span>
                            </span>
                          </div>
                        </div>
                      </div>
                      <div class="col buyrow">
                        <div class="row">
                          <div class="col-md">
                            <label class="control-label small m-0 text-nowrap full-text buy-label" for="default_d_buy_strategy" data-i18n="configSection.buyStrategyD"></label>
                            <label class="control-label small m-0 text-nowrap short-text font-10 buy-label" for="default_d_buy_strategy" data-i18n="configSection.buyD"></label>
                            <div class="pull-left m-0 p-0">
                              <input data-setting-type="PAIRS" class="tgl tgl-skewed config-input newback" type="checkbox" data-val="true" value="true"
                                name="default_d_buy_on_first_signal" id="default_d_buy_on_first_signal">
                              <label title="Buy on 1st signal" class="tgl-btn tgl-btn2 small font-10" data-tg-off="1st" data-tg-on="1st" for="default_d_buy_on_first_signal"></label>
                            </div>
                            <select class="custom-select config-input form-control " data-setting-type="PAIRS" name="default_d_buy_strategy" id="default_d_buy_strategy"
                              disabled>
                              <option value="" selected data-i18n="configSection.choose"></option>
                              <#list buyStrategies as strategy>
                                <option value="${strategy}">${strategy}</option>
                              </#list>
                            </select>
                          </div>
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_d_buy_value" data-i18n="configSection.buyValueD"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_d_buy_value" data-i18n="configSection.buyValD"></label>
                            <input name="default_d_buy_value" id="default_d_buy_value" data-setting-type="PAIRS" class="form-control config-input" type="text"
                              disabled>
                          </div>
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_d_buy_value_limit" data-i18n="configSection.buyLimitD"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_d_buy_value_limit" data-i18n="configSection.buyLimD"></label>
                            <input name="default_d_buy_value_limit" id="default_d_buy_value_limit" data-setting-type="PAIRS" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-md-2">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_d_buy_strategy_direction"  data-i18n="configSection.strategyDirectionD"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_d_buy_strategy_direction"  data-i18n="configSection.strategyDirectionD"></label>
                            <input name="default_d_buy_strategy_direction" id="default_d_buy_strategy_direction" data-setting-type="PAIRS" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-1 pl-3 pt-1">
                            <span class="badge badge-success pull-left plusminus">
                              <span class="fa fa-plus plusminusi"></span>
                            </span>
                          </div>
                        </div>
                      </div>
                      <div class="col buyrow">
                        <div class="row">
                          <div class="col-md-3">
                            <label class="control-label small m-0 text-nowrap full-text buy-label" for="default_e_buy_strategy" data-i18n="configSection.buyStrategyE"></label>
                            <label class="control-label small m-0 text-nowrap short-text font-10 buy-label" for="DEFAdefault_e_buy_strategyult_d_buy_value_limit" data-i18n="configSection.buyE"></label>
                            <div class="pull-left m-0 p-0">
                              <input data-setting-type="PAIRS" class="tgl tgl-skewed config-input newback" type="checkbox" data-val="true" value="true"
                                name="default_e_buy_on_first_signal" id="default_e_buy_on_first_signal">
                              <label title="Buy on 1st signal" class="tgl-btn tgl-btn2 small font-10" data-tg-off="1st" data-tg-on="1st" for="default_e_buy_on_first_signal"></label>
                            </div>
                            <select class="custom-select config-input form-control " data-setting-type="PAIRS" name="default_e_buy_strategy" id="default_e_buy_strategy"
                              disabled>
                              <option value="" selected data-i18n="configSection.choose"></option>
                              <#list buyStrategies as strategy>
                                <option value="${strategy}">${strategy}</option>
                              </#list>
                            </select>
                          </div>
                          <div class="col-md-3">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_e_buy_value" data-i18n="configSection.buyValueE"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_e_buy_value" data-i18n="configSection.buyValE"></label>
                            <input name="default_e_buy_value" id="default_e_buy_value" data-setting-type="PAIRS" class="form-control config-input" type="text"
                              disabled>
                          </div>
                          <div class="col-md-3">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_e_buy_value_limit" data-i18n="configSection.buyLimitE"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_e_buy_value_limit" data-i18n="configSection.buyLimE"></label>
                            <input name="default_e_buy_value_limit" id="default_e_buy_value_limit" data-setting-type="PAIRS" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-md-2">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_e_buy_strategy_direction"  data-i18n="configSection.strategyDirectionE"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_e_buy_strategy_direction"  data-i18n="configSection.strategyDirectionE"></label>
                            <input name="default_e_buy_strategy_direction" id="default_e_buy_strategy_direction" data-setting-type="PAIRS" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-1 pl-3 pt-1">
                            <span class="badge badge-success pull-left plusminus">
                              <span class="fa fa-plus plusminusi"></span>
                            </span>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="card-box col-md-2 bc">
                      <div class="col">
                        <div class="row">

                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_trailing_buy" data-i18n="configSection.trailingBuy"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_trailing_buy" data-i18n="configSection.trailBuy"></label>
                            <input name="default_trailing_buy" id="default_trailing_buy" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap full-text" for="max_trading_pairs" data-i18n="configSection.maxPairs"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="max_trading_pairs" data-i18n="configSection.maxPairs"></label>
                            <input name="max_trading_pairs" id="max_trading_pairs" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_min_buy_volume" data-i18n="configSection.minBuyVolume"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_min_buy_volume" data-i18n="configSection.minVol"></label>
                            <input name="default_min_buy_volume" id="default_min_buy_volume" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_min_buy_price" data-i18n="configSection.minBuyPrice"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_min_buy_price" data-i18n="configSection.minPrice"></label>
                            <input name="default_min_buy_price" id="default_min_buy_price" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_max_buy_spread" data-i18n="configSection.maxBuySpread"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_max_buy_spread" data-i18n="configSection.maxSpread"></label>
                            <input name="default_max_buy_spread" id="default_max_buy_spread" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_min_orderbook_volume_percentage" data-i18n="configSection.minOrderbookPerc"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="max_trading_pairs" data-i18n="configSection.minOrderbookPerc"></label>
                            <input name="default_min_orderbook_volume_percentage" id="default_min_orderbook_volume_percentage" data-setting-type="PAIRS"
                              class="form-control keepEnabled config-input" type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="default_buy_min_change_percentage" data-i18n="configSection.buyMinChgPerc"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_buy_min_change_percentage" data-i18n="configSection.buyMinChgPerc"></label>
                            <input name="default_buy_min_change_percentage" id="default_buy_min_change_percentage" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="default_buy_max_change_percentage" data-i18n="configSection.buyMaxChgPerc"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_buy_max_change_percentage" data-i18n="configSection.buyMaxChgPerc"></label>
                            <input name="default_buy_max_change_percentage" id="default_buy_max_change_percentage" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="pair_min_listed_days" data-i18n="configSection.minCoinAge"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="pair_min_listed_days" data-i18n="configSection.minCoinAge"></label>
                            <input name="pair_min_listed_days" id="pair_min_listed_days" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="default_rebuy_timeout" data-i18n="configSection.rebuyTimeout"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_rebuy_timeout" data-i18n="configSection.rebuyTimeout"></label>
                            <input name="default_rebuy_timeout" id="default_rebuy_timeout" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_buy_leverage"  data-i18n="configSection.buyLeverage"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_buy_leverage"  data-i18n="configSection.buyLeverage"></label>
                            <input name="default_buy_leverage" id="default_buy_leverage" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="card-box col-md buycol sc">
                      <div class="col sellrowAB">
                        <div class="row">
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_a_sell_strategy" data-i18n="configSection.sellStrategyA"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_a_sell_strategy" data-i18n="configSection.sellA"></label>
                            <select class="custom-select config-input form-control " data-setting-type="PAIRS" name="default_a_sell_strategy" id="default_a_sell_strategy">
                              <option value="" selected data-i18n="configSection.choose"></option>
                              <#list sellStrategies as strategy>
                                <option value="${strategy}">${strategy}</option>
                              </#list>
                            </select>
                          </div>
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_a_sell_value" data-i18n="configSection.sellValueA"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_a_sell_value" data-i18n="configSection.sellValA"></label>
                            <input name="default_a_sell_value" id="default_a_sell_value" data-setting-type="PAIRS" class="form-control config-input"
                              type="text">
                          </div>
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_a_sell_value" data-i18n="configSection.sellValueALimit"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_a_sell_value_limit" data-i18n="configSection.sellValALim"></label>
                            <input name="default_a_sell_value_limit" id="default_a_sell_value_limit" data-setting-type="PAIRS" class="form-control config-input keepEnabled"
                              type="text">
                          </div>
                          <div class="col-1">
                          </div>
                        </div>
                      </div>
                      <div class="col sellrowA " id="sell1">
                        <div class="row">
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_b_sell_strategy" data-i18n="configSection.sellStrategyB"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_b_sell_strategy" data-i18n="configSection.sellB"></label>
                            <select class="custom-select config-input form-control " data-setting-type="PAIRS" name="default_b_sell_strategy" id="default_b_sell_strategy"
                              disabled>
                              <option value="" selected data-i18n="configSection.choose"></option>
                              <#list sellStrategies as strategy>
                                <option value="${strategy}">${strategy}</option>
                              </#list>
                            </select>
                          </div>
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_b_sell_value" data-i18n="configSection.sellValueB"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_b_sell_value" data-i18n="configSection.sellValB"></label>
                            <input name="default_b_sell_value" id="default_b_sell_value" data-setting-type="PAIRS" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_b_sell_value_limit" data-i18n="configSection.sellValueALimit"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_b_sell_value_limit" data-i18n="configSection.sellValALim"></label>
                            <input name="default_b_sell_value_limit" id="default_b_sell_value_limit" data-setting-type="PAIRS" class="form-control config-input"
                              type="text">
                          </div>
                          <div class="col-1 pl-3 pt-1">
                            <span class="badge badge-success pull-left plusminus">
                              <i class="fa fa-plus plusminusi"></i>
                            </span>
                          </div>
                        </div>
                      </div>
                      <div class="col sellrowA " id="sell2">
                        <div class="row">
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_c_sell_strategy" data-i18n="configSection.sellStrategyC"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_c_sell_strategy" data-i18n="configSection.sellC"></label>
                            <select class="custom-select config-input form-control " data-setting-type="PAIRS" name="default_c_sell_strategy" id="default_c_sell_strategy"
                              disabled>
                              <option value="" selected data-i18n="configSection.choose"></option>
                              <#list sellStrategies as strategy>
                                <option value="${strategy}">${strategy}</option>
                              </#list>
                            </select>
                          </div>
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_c_sell_value" data-i18n="configSection.sellValueC"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_c_sell_value" data-i18n="configSection.sellValC"></label>
                            <input name="default_c_sell_value" id="default_c_sell_value" data-setting-type="PAIRS" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_c_sell_value_limit" data-i18n="configSection.sellValueALimit"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_c_sell_value_limit" data-i18n="configSection.sellValALim"></label>
                            <input name="default_c_sell_value_limit" id="default_c_sell_value_limit" data-setting-type="PAIRS" class="form-control config-input"
                              type="text">
                          </div>
                          <div class="col-1 pl-3 pt-1">
                            <span class="badge badge-success pull-left plusminus">
                              <i class="fa fa-plus plusminusi"></i>
                            </span>
                          </div>
                        </div>
                      </div>
                      <div class="col sellrowA " id="sell3">
                        <div class="row">
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_d_sell_strategy" data-i18n="configSection.sellStrategyD"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_d_sell_strategy" data-i18n="configSection.sellD"></label>
                            <select class="custom-select config-input form-control " data-setting-type="PAIRS" name="default_d_sell_strategy" id="default_d_sell_strategy"
                              disabled>
                              <option value="" selected data-i18n="configSection.choose"></option>
                              <#list sellStrategies as strategy>
                                <option value="${strategy}">${strategy}</option>
                              </#list>
                            </select>
                          </div>
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_d_sell_value" data-i18n="configSection.sellValueD"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_d_sell_value" data-i18n="configSection.sellValD"></label>
                            <input name="default_d_sell_value" id="default_d_sell_value" data-setting-type="PAIRS" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_d_sell_value_limit" data-i18n="configSection.sellValueALimit"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_d_sell_value_limit" data-i18n="configSection.sellValALim"></label>
                            <input name="default_d_sell_value_limit" id="default_d_sell_value_limit" data-setting-type="PAIRS" class="form-control config-input"
                              type="text">
                          </div>
                          <div class="col-1 pl-3 pt-1">
                            <span class="badge badge-success pull-left plusminus">
                              <i class="fa fa-plus plusminusi"></i>
                            </span>
                          </div>
                        </div>
                      </div>
                      <div class="col sellrowA " id="sell4">
                        <div class="row">
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_e_sell_strategy" data-i18n="configSection.sellStrategyE"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_e_sell_strategy" data-i18n="configSection.sellE"></label>
                            <select class="custom-select config-input form-control " data-setting-type="PAIRS" name="default_e_sell_strategy" id="default_e_sell_strategy"
                              disabled>
                              <option value="" selected data-i18n="configSection.choose"></option>
                              <#list sellStrategies as strategy>
                                <option value="${strategy}">${strategy}</option>
                              </#list>
                            </select>
                          </div>
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_e_sell_value" data-i18n="configSection.sellValueE"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_e_sell_value" data-i18n="configSection.sellValE"></label>
                            <input name="default_e_sell_value" id="default_e_sell_value" data-setting-type="PAIRS" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_e_sell_value_limit" data-i18n="configSection.sellValueALimit"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_e_sell_value_limit" data-i18n="configSection.sellValALim"></label>
                            <input name="default_e_sell_value_limit" id="default_e_sell_value_limit" data-setting-type="PAIRS" class="form-control config-input"
                              type="text">
                          </div>
                          <div class="col-1 pl-3 pt-1">
                            <span class="badge badge-success pull-left plusminus">
                              <i class="fa fa-plus plusminusi"></i>
                            </span>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="card-box col-md-2 sc">
                      <div class="col">
                        <div class="row">

                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap short-text font-10 " for="default_trailing_profit" data-i18n="configSection.trailingProfit"></label>
                            <label class="control-label small  m-0 text-nowrap full-text " for="default_dca_trailing_profit" data-i18n="configSection.trailingProfit"></label>
                            <input name="default_trailing_profit" id="default_trailing_profit" data-setting-type="PAIRS" class="form-control config-input keepEnabled"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_trailing_profit_type" data-i18n="configSection.smartTrailingType"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_trailing_profit_type" data-i18n="configSection.smartTrailing"></label>
                            <select class="custom-select config-input form-control keepEnabled" data-setting-type="PAIRS" name="default_trailing_profit_type"
                              id="default_trailing_profit_type">
                              <option value="" selected data-i18n="configSection.choose"></option>
                              <option value="DEFAULT" data-i18n="configOptions.default"></option>
                              <option value="GROW" data-i18n="configSection.grow"></option>
                              <option value="SHRINK" data-i18n="configSection.shrink"></option>
                            </select>
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="default_max_profit" data-i18n="configSection.maxProfit"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_max_profit" data-i18n="configSection.maxProfit"></label>
                            <input name="default_max_profit" id="default_max_profit" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="default_take_profit_percentage" data-i18n="configSection.takeProfitPerc"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_take_profit_percentage" data-i18n="configSection.takeProfitPerc"></label>
                            <input name="default_take_profit_percentage" id="default_take_profit_percentage" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="default_take_profit_wait_time" data-i18n="configSection.takeProfitWait"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_take_profit_wait_time" data-i18n="configSection.takeProfitWait"></label>
                            <input name="default_take_profit_wait_time" id="default_take_profit_wait_time" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="default_take_profit_reset_percentage_move" data-i18n="configSection.TakeProfitMovePerc"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_take_profit_reset_percentage_move" data-i18n="configSection.TakeProfitMovePerc"></label>
                            <input name="default_take_profit_reset_percentage_move" id="default_take_profit_reset_percentage_move" data-setting-type="PAIRS"
                              class="form-control keepEnabled config-input" type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="default_take_profit_safety_arm"  data-i18n="configSection.TakeProfitSafetyArm"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_take_profit_safety_arm"  data-i18n="configSection.TakeProfitSafetyArm"></label>
                            <input name="default_take_profit_safety_arm" id="default_take_profit_safety_arm" data-setting-type="PAIRS"
                              class="form-control keepEnabled config-input" type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="default_take_profit_safety_fire"  data-i18n="configSection.TakeProfitSafetyFire"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_take_profit_safety_fire"  data-i18n="configSection.TakeProfitSafetyFire"></label>
                            <input name="default_take_profit_safety_fire" id="default_take_profit_safety_fire" data-setting-type="PAIRS"
                              class="form-control keepEnabled config-input" type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="default_pending_order_wait_time" data-i18n="configSection.pendingOrderWait"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_pending_order_wait_time" data-i18n="configSection.pendingWait"></label>
                            <input name="default_pending_order_wait_time" id="default_pending_order_wait_time" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="default_pending_gain_percentage"  data-i18n="configSection.pendingGainPercentage"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_pending_order_wait_time"  data-i18n="configSection.pendingGainPercentage"></label>
                            <input name="default_pending_gain_percentage" id="default_pending_gain_percentage" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="default_cancel_pending_trigger"  data-i18n="configSection.cancelPendingTrigger"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_cancel_pending_trigger"  data-i18n="configSection.cancelPendingTrigger"></label>
                            <input name="default_cancel_pending_trigger" id="default_cancel_pending_trigger" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="default_combined_cancel_pending_trigger" data-i18n="configSection.cancelPendingperc"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_combined_cancel_pending_trigger" data-i18n="configSection.cancelPendingperc"></label>
                            <input name="default_combined_cancel_pending_trigger" id="default_combined_cancel_pending_trigger" data-setting-type="PAIRS"
                              class="form-control keepEnabled config-input" type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap short-text font-10 " for="default_stop_loss_trigger" data-i18n="configSection.stopLossTrigger"></label>
                            <label class="control-label small  m-0 text-nowrap full-text " for="default_stop_loss_trigger" data-i18n="configSection.stopLossTrigger"></label>
                            <input name="default_stop_loss_trigger" id="default_stop_loss_trigger" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap short-text font-10 " for="default_stop_loss_timeout" data-i18n="configSection.stopLossTimeout"></label>
                            <label class="control-label small  m-0 text-nowrap full-text " for="default_stop_loss_timeout" data-i18n="configSection.stopLossTimeout"></label>
                            <input name="default_stop_loss_timeout" id="default_stop_loss_timeout" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap short-text font-10 " for="default_trailing_stop_loss_trigger"  data-i18n="configSection.trailingStopLossTrigger"></label>
                            <label class="control-label small  m-0 text-nowrap full-text " for="default_trailing_stop_loss_trigger"  data-i18n="configSection.trailingStopLossTrigger"></label>
                            <input name="default_trailing_stop_loss_trigger" id="default_trailing_stop_loss_trigger" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap short-text font-10 " for="default_trailing_stop_loss_trigger_arm" data-i18n="configSection.trailingStopLossTriggerArm"></label>
                            <label class="control-label small  m-0 text-nowrap full-text " for="default_trailing_stop_loss_trigger_arm" data-i18n="configSection.trailingStopLossTriggerArm"></label>
                            <input name="default_trailing_stop_loss_trigger_arm" id="default_trailing_stop_loss_trigger_arm" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                              type="text">
                          </div>

                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row text-center">
                    <div class="col-md-12">

                      <div class="row justify-content-center align-items-center">
                        <div class="col-md-1" align="center">
                          <input data-setting-type="PAIRS" class="tgl tgl-skewed config-input" type="checkbox" data-val="true" value="" name="default_trading_enabled"
                            id="default_trading_enabled" />
                          <label class="tgl-btn mainswitch small" data-tg-off="Trading OFF" data-tg-on="Trading ON" for="default_trading_enabled"></label>
                        </div>
                        <div class="col-md-1" align="center">
                          <input data-setting-type="PAIRS" class="tgl tgl-skewed config-input" type="checkbox" data-val="true" value="" name="default_sell_only_mode_enabled"
                            id="default_sell_only_mode_enabled" />
                          <label class="tgl-btn mainswitch small " data-tg-off="SOM OFF" data-tg-on="SOM ON" for="default_sell_only_mode_enabled"></label>
                        </div>
                        <div class="col-md-1" align="center">
                          <input data-setting-type="PAIRS" class="tgl tgl-skewed panic-input config-input" type="checkbox" data-val="true" value=""
                            name="default_panic_sell_enabled" id="default_panic_sell_enabled" />
                          <label class="tgl-btn mainswitch small panic" data-tg-off="PANIC OFF" data-tg-on="PANIC ON" for="default_panic_sell_enabled"></label>
                        </div>
                        <div class="col-md-1" align="center">
                          <input data-setting-type="PAIRS" class="tgl tgl-skewed config-input" type="checkbox" data-val="true" value="" name="orderbook_profit_calculation"
                            id="orderbook_profit_calculation" />
                          <label class="tgl-btn mainswitch small" data-tg-off="Orderbook Calc OFF" data-tg-on="Orderbook Calc ON" for="orderbook_profit_calculation"></label>
                        </div>
                        <div class="col-md-1" align="center">
                          <input data-setting-type="PAIRS" class="tgl tgl-skewed config-input pairscombined" type="checkbox" data-val="true" value="" name="default_combine_pending_orders"
                            id="default_combine_pending_orders" />
                          <label class="tgl-btn mainswitch small" data-tg-off="COMB PENDING" data-tg-on="COMB PENDING" for="default_combine_pending_orders"></label>
                        </div>
                        <div class="col-md-1" align="center">
                          <button id="blackListButton" class="btn btn-sm btn-dark" data-toggle="tooltip" data-placement="top" data-i18n="[title]constantMsgs.manageBlackList;configSection.blacklist"
                            title=""></button>
                        </div>
                      </div>
                    </div>

                  </div>
                </div>
                <!--  PAIRS tab end-->

                <!--*****************************************************-->

                <!--  DCA tab -->
                <div class="tab-pane fade" id="dca">

                  <div class="row justify-content-center">
                    <div class="d-flex balancecol card-box col-md-5">
                      <div class="row justify-content-center">

                        <div class="col-md">
                          <label class="control-label small  m-0 text-nowrap full-text" for="dca_keep_balance"  data-i18n="configSection.keepBalance"></label>
                          <label class="control-label small  m-0 text-nowrap short-text font-10" for="dca_keep_balance"  data-i18n="configSection.keepBalance"></label>
                          <input name="dca_keep_balance" id="dca_keep_balance" data-setting-type="DCA" class="form-control keepEnabled config-input"
                            type="text">
                        </div>
                        <div class="col-md">
                          <label class="control-label small  m-0 text-nowrap full-text" for="dca_keep_balance_percentage"  data-i18n="configSection.keepBalancePer"></label>
                          <label class="control-label small  m-0 text-nowrap short-text font-10" for="dca_keep_balance_percentage"  data-i18n="configSection.keepBalancePer"></label>
                          <input name="dca_keep_balance_percentage" id="dca_keep_balance_percentage" data-setting-type="DCA" class="form-control keepEnabled config-input"
                            type="text">
                        </div>
                      <div class="col-md-2">
                        <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_enabled" data-i18n="configSection.dcaEnabled"></label>
                        <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_enabled" data-i18n="configSection.dcaEnabled"></label>
                        <input name="default_dca_enabled" id="default_dca_enabled" data-setting-type="PAIRS" class="form-control keepEnabled config-input"
                          type="text" list="boolean">
                      </div>
                      <datalist id="boolean">
                        <option value="true">
                        <option value="false">
                      </datalist>
                        <div class="col-md">
                          <label class="control-label small  m-0 text-nowrap small full-text" for="default_dca_max_cost"  data-i18n="configSection.maxCost"></label>
                          <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_dca_max_cost"  data-i18n="configSection.maxCost"></label>
                          <input name="default_dca_max_cost" id="default_dca_max_cost" data-setting-type="DCA" class="form-control keepEnabled config-input"
                            type="text">
                        </div>
                        <div class="col-md">
                          <label class="control-label small  m-0 text-nowrap small full-text" for="default_dca_max_buy_times"  data-i18n="configSection.maxBuyTimes"></label>
                          <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_dca_max_buy_times"  data-i18n="configSection.maxBuyTimes"></label>
                          <input name="default_dca_max_buy_times" id="default_dca_max_buy_times" data-setting-type="DCA" class="form-control keepEnabled config-input"
                            type="text">
                        </div>
                      </div>
                    </div>

                  </div>
                  <div class="row text-center">
                    <div class="card-box col-md buycol bc">
                      <div class="col buyrowAB">
                        <div class="row">
                          <div class="col-md-3">
                            <label class="control-label small  m-0 text-nowrap  full-text buy-label" for="default_dca_a_buy_strategy"  data-i18n="configSection.buyStrategyA"></label>
                            <label class="control-label small  m-0 text-nowrap  short-text font-10 buy-label" for="default_dca_a_buy_strategy"  data-i18n="configSection.buyA"></label>

                            <div class="pull-left m-0 p-0">
                              <input data-setting-type="DCA" class="tgl tgl-skewed config-input newback" type="checkbox" data-val="true" value="true" name="default_dca_a_buy_on_first_signal"
                                id="default_dca_a_buy_on_first_signal">
                              <label title="Buy on 1st signal" class="tgl-btn tgl-btn2 small font-10" data-tg-off="1st" data-tg-on="1st" for="default_dca_a_buy_on_first_signal"></label>
                            </div>
                            <select class="custom-select config-input  form-control mr-md-2 keepEnabled" data-setting-type="DCA" name="default_dca_a_buy_strategy"
                              id="default_dca_a_buy_strategy">
                              <option value="" selected data-i18n="configSection.choose"></option>
                              <option value="ANDERSON" data-i18n="configSection.anderson"></option>
                              <#list buyStrategies as strategy>
                                <option value="${strategy}">${strategy}</option>
                              </#list>
                            </select>

                          </div>
                          <div class="col-md-3">
                            <label class="control-label small  m-0 text-nowrap full-text " for="default_dca_a_buy_value"  data-i18n="configSection.buyValueA"></label>
                            <label class="control-label small  m-0 text-nowrap  short-text font-10" for="default_dca_a_buy_value"  data-i18n="configSection.buyValA"></label>
                            <input name="default_dca_a_buy_value" id="default_dca_a_buy_value" data-setting-type="DCA" class="form-control config-input keepEnabled"
                              type="text">
                          </div>
                          <div class="col-md-3">
                            <label class="control-label small  m-0 text-nowrap full-text " for="default_dca_a_buy_value_limit"  data-i18n="configSection.buyLimitA"></label>
                            <label class="control-label small  m-0 text-nowrap  short-text font-10" for="default_dca_a_buy_value_limit"  data-i18n="configSection.buyLimA"></label>
                            <input name="default_dca_a_buy_value_limit" id="default_dca_a_buy_value_limit" data-setting-type="DCA" class="form-control config-input keepEnabled"
                              type="text">
                          </div>
                          <div class="col-md-2">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_a_buy_strategy_direction"  data-i18n="configSection.strategyDirectionA"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_a_buy_strategy_direction"  data-i18n="configSection.strategyDirectionA"></label>
                            <input name="default_dca_a_buy_strategy_direction" id="default_dca_a_buy_strategy_direction" data-setting-type="DCA" class="form-control config-input keepEnabled"
                              type="text">
                          </div>
                          <div class="col-1 pl-3 pt-1">
                            <span class="plusminus hide"></span>
                          </div>
                        </div>
                      </div>
                      <div class="col buyrow">
                        <div class="row">
                          <div class="col-md-3">
                            <label class="control-label small m-0 text-nowrap full-text buy-label" for="default_dca_b_buy_strategy"  data-i18n="configSection.buyStrategyB"></label>
                            <label class="control-label small m-0 text-nowrap short-text font-10 buy-label" for="default_dca_b_buy_strategy"  data-i18n="configSection.buyB"></label>
                            <div class="pull-left m-0 p-0">
                              <input data-setting-type="DCA" class="tgl tgl-skewed config-input newback" type="checkbox" data-val="true" value="true" name="default_dca_b_buy_on_first_signal"
                                id="default_dca_b_buy_on_first_signal">
                              <label title="Buy on 1st signal" class="tgl-btn tgl-btn2 small font-10" data-tg-off="1st" data-tg-on="1st" for="default_dca_b_buy_on_first_signal"></label>
                            </div>
                            <select class="custom-select config-input form-control " data-setting-type="DCA" name="default_dca_b_buy_strategy" id="default_dca_b_buy_strategy"
                              disabled>
                              <option value="" selected data-i18n="configSection.choose"></option>
                              <option value="ANDERSON" data-i18n="configSection.anderson"></option>
                              <#list buyStrategies as strategy>
                                <option value="${strategy}">${strategy}</option>
                              </#list>
                            </select>
                          </div>
                          <div class="col-md-3">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_b_buy_value"  data-i18n="configSection.buyValueB"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_b_buy_value"  data-i18n="configSection.buyValB"></label>
                            <input name="default_dca_b_buy_value" id="default_dca_b_buy_value" data-setting-type="DCA" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-md-3">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_b_buy_value_limit"  data-i18n="configSection.buyLimitB"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_b_buy_value_limit"  data-i18n="configSection.buyLimB"></label>
                            <input name="default_dca_b_buy_value_limit" id="default_dca_b_buy_value_limit" data-setting-type="DCA" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-md-2">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_b_buy_strategy_direction"  data-i18n="configSection.strategyDirectionB"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_b_buy_strategy_direction"  data-i18n="configSection.strategyDirectionB"></label>
                            <input name="default_dca_b_buy_strategy_direction" id="default_dca_b_buy_strategy_direction" data-setting-type="DCA" class="form-control config-input"
                              type="text">
                          </div>
                          <div class="col-1 pl-3 pt-1">
                            <span class="badge badge-success pull-left plusminus">

                            </span>
                          </div>
                        </div>
                      </div>
                      <div class="col buyrow">
                        <div class="row">
                          <div class="col-md-3">
                            <label class="control-label small m-0 text-nowrap full-text buy-label" for="default_dca_c_buy_strategy"  data-i18n="configSection.buyStrategyC"></label>
                            <label class="control-label small m-0 text-nowrap short-text font-10 buy-label" for="default_dca_c_buy_strategy"  data-i18n="configSection.buyC"></label>
                            <div class="pull-left m-0 p-0">
                              <input data-setting-type="DCA" class="tgl tgl-skewed config-input newback" type="checkbox" data-val="true" value="true" name="default_dca_c_buy_on_first_signal"
                                id="default_dca_c_buy_on_first_signal">
                              <label title="Buy on 1st signal" class="tgl-btn tgl-btn2 small font-10" data-tg-off="1st" data-tg-on="1st" for="default_dca_c_buy_on_first_signal"></label>
                            </div>
                            <select class="custom-select config-input form-control " data-setting-type="DCA" name="default_dca_c_buy_strategy" id="default_dca_c_buy_strategy"
                              disabled>
                              <option value="" selected data-i18n="configSection.choose"></option>
                              <option value="ANDERSON" data-i18n="configSection.anderson"></option>
                              <#list buyStrategies as strategy>
                                <option value="${strategy}">${strategy}</option>
                              </#list>
                            </select>
                          </div>
                          <div class="col-md-3">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_c_buy_value"  data-i18n="configSection.buyValueC"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_c_buy_value"  data-i18n="configSection.buyValC"></label>
                            <input name="default_dca_c_buy_value" id="default_dca_c_buy_value" data-setting-type="DCA" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-md-3">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_c_buy_value_limit"  data-i18n="configSection.buyLimitC"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_c_buy_value_limit"  data-i18n="configSection.buyLimC"></label>
                            <input name="default_dca_c_buy_value_limit" id="default_dca_c_buy_value_limit" data-setting-type="DCA" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-md-2">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_c_buy_strategy_direction"  data-i18n="configSection.strategyDirectionC"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_c_buy_strategy_direction"  data-i18n="configSection.strategyDirectionC"></label>
                            <input name="default_dca_c_buy_strategy_direction" id="default_dca_c_buy_strategy_direction" data-setting-type="DCA" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-1 pl-3 pt-1">
                            <span class="badge badge-success pull-left plusminus">
                              <span class="fa fa-plus plusminusi"></span>
                            </span>
                          </div>
                        </div>
                      </div>
                      <div class="col buyrow">
                        <div class="row">
                          <div class="col-md-3">
                            <label class="control-label small m-0 text-nowrap full-text buy-label" for="default_dca_d_buy_strategy"  data-i18n="configSection.buyStrategyD"></label>
                            <label class="control-label small m-0 text-nowrap short-text font-10 buy-label" for="default_dca_d_buy_strategy"  data-i18n="configSection.buyD"></label>
                            <div class="pull-left m-0 p-0">
                              <input data-setting-type="DCA" class="tgl tgl-skewed config-input newback" type="checkbox" data-val="true" value="true" name="default_dca_d_buy_on_first_signal"
                                id="default_dca_d_buy_on_first_signal">
                              <label title="Buy on 1st signal" class="tgl-btn tgl-btn2 small font-10" data-tg-off="1st" data-tg-on="1st" for="default_dca_d_buy_on_first_signal"></label>
                            </div>
                            <select class="custom-select config-input form-control " data-setting-type="DCA" name="default_dca_d_buy_strategy" id="default_dca_d_buy_strategy"
                              disabled>
                              <option value="" selected data-i18n="configSection.choose"></option>
                              <option value="ANDERSON" data-i18n="configSection.anderson"></option>
                              <#list buyStrategies as strategy>
                                <option value="${strategy}">${strategy}</option>
                              </#list>
                            </select>
                          </div>
                          <div class="col-md-3">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_d_buy_value"  data-i18n="configSection.buyValueD"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_d_buy_value"  data-i18n="configSection.buyLimD"></label>
                            <input name="default_dca_d_buy_value" id="default_dca_d_buy_value" data-setting-type="DCA" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-md-3">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_d_buy_value_limit"  data-i18n="configSection.buyLimitD"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_d_buy_value_limit"  data-i18n="configSection.buyValD"></label>
                            <input name="default_dca_d_buy_value_limit" id="default_dca_d_buy_value_limit" data-setting-type="DCA" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-md-2">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_d_buy_strategy_direction"  data-i18n="configSection.strategyDirectionD"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_d_buy_strategy_direction"  data-i18n="configSection.strategyDirectionD"></label>
                            <input name="default_dca_d_buy_strategy_direction" id="default_dca_d_buy_strategy_direction" data-setting-type="DCA" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-1 pl-3 pt-1">
                            <span class="badge badge-success pull-left plusminus">
                              <span class="fa fa-plus plusminusi"></span>
                            </span>
                          </div>
                        </div>
                      </div>
                      <div class="col buyrow">
                        <div class="row">
                          <div class="col-md-3">
                            <label class="control-label small m-0 text-nowrap full-text buy-label" for="default_dca_e_buy_strategy"  data-i18n="configSection.buyStrategyE"></label>
                            <label class="control-label small m-0 text-nowrap short-text font-10 buy-label" for="default_dca_e_buy_strategyult_d_buy_value_limit"  data-i18n="configSection.buyE"></label>
                            <div class="pull-left m-0 p-0">
                              <input data-setting-type="DCA" class="tgl tgl-skewed config-input newback" type="checkbox" data-val="true" value="true" name="default_dca_e_buy_on_first_signal"
                                id="default_dca_e_buy_on_first_signal">
                              <label title="Buy on 1st signal" class="tgl-btn tgl-btn2 small font-10" data-tg-off="1st" data-tg-on="1st" for="default_dca_e_buy_on_first_signal"></label>
                            </div>
                            <select class="custom-select config-input form-control " data-setting-type="DCA" name="default_dca_e_buy_strategy" id="default_dca_e_buy_strategy"
                              disabled>
                              <option value="" selected data-i18n="configSection.choose"></option>
                              <option value="ANDERSON" data-i18n="configSection.anderson"></option>
                              <#list buyStrategies as strategy>
                                <option value="${strategy}">${strategy}</option>
                              </#list>
                            </select>
                          </div>
                          <div class="col-md-3">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_e_buy_value"  data-i18n="configSection.buyValueE"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_e_buy_value"  data-i18n="configSection.buyValE"></label>
                            <input name="default_dca_e_buy_value" id="default_dca_e_buy_value" data-setting-type="DCA" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-md-3">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_e_buy_value_limit"  data-i18n="configSection.buyLimitE"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_e_buy_value_limit"  data-i18n="configSection.buyLimE"></label>
                            <input name="default_dca_e_buy_value_limit" id="default_dca_e_buy_value_limit" data-setting-type="DCA" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-md-2">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_e_buy_strategy_direction"  data-i18n="configSection.strategyDirectionE"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_e_buy_strategy_direction"  data-i18n="configSection.strategyDirectionE"></label>
                            <input name="default_dca_e_buy_strategy_direction" id="default_dca_e_buy_strategy_direction" data-setting-type="DCA" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-1 pl-3 pt-1">
                            <span class="badge badge-success pull-left plusminus">
                              <span class="fa fa-plus plusminusi"></span>
                            </span>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="card-box col-md-2 bc">
                      <div class="col">
                        <div class="row">

                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_trailing_buy"  data-i18n="configSection.trailingBuy"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_trailing_buy"  data-i18n="configSection.trailingBuy"></label>
                            <input name="default_dca_trailing_buy" id="default_dca_trailing_buy" data-setting-type="DCA" class="form-control keepEnabled config-input"
                              type="text">
                          </div>

                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_min_buy_volume"  data-i18n="configSection.minBuyVolume"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_min_buy_volume"  data-i18n="configSection.minVol"></label>
                            <input name="default_dca_min_buy_volume" id="default_dca_min_buy_volume" data-setting-type="DCA" class="form-control keepEnabled config-input"
                              type="text">
                          </div>

                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_max_buy_spread"  data-i18n="configSection.maxBuySpread"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_max_buy_spread"  data-i18n="configSection.maxSpread"></label>
                            <input name="default_dca_max_buy_spread" id="default_dca_max_buy_spread" data-setting-type="DCA" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_min_orderbook_volume_percentage"  data-i18n="configSection.minOrderbookPerc"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="max_trading_pairs"  data-i18n="configSection.minOrderbookPerc"></label>
                            <input name="default_dca_min_orderbook_volume_percentage" id="default_dca_min_orderbook_volume_percentage" data-setting-type="DCA"
                              class="form-control keepEnabled config-input" type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="default_dca_buy_min_change_percentage"  data-i18n="configSection.buyMinChgPerc"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_dca_buy_min_change_percentage"  data-i18n="configSection.buyMinChgPerc"></label>
                            <input name="default_dca_buy_min_change_percentage" id="default_dca_buy_min_change_percentage" data-setting-type="DCA" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="default_dca_buy_max_change_percentage"  data-i18n="configSection.buyMaxChgPerc"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_dca_buy_max_change_percentage"  data-i18n="configSection.buyMaxChgPerc"></label>
                            <input name="default_dca_buy_max_change_percentage" id="default_dca_buy_max_change_percentage" data-setting-type="DCA" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="som_dca_buy_trigger"  data-i18n="configSection.somBuyTrigger"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="som_dca_buy_trigger"  data-i18n="configSection.somBuyTrigger"></label>
                            <input name="som_dca_buy_trigger" id="som_dca_buy_trigger" data-setting-type="DCA" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="default_dca_rebuy_timeout"  data-i18n="configSection.rebuyTimeout"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_dca_rebuy_timeout"  data-i18n="configSection.rebuyTimeout"></label>
                            <input name="default_dca_rebuy_timeout" id="default_dca_rebuy_timeout" data-setting-type="DCA" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_buy_trigger"  data-i18n="configSection.buyTriggers"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_buy_trigger"  data-i18n="configSection.buyTriggers"></label>
                            <input name="default_dca_buy_trigger" id="default_dca_buy_trigger" data-setting-type="DCA" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_buy_percentage"  data-i18n="configSection.buyPercentages"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_buy_percentage"  data-i18n="configSection.buyPercs"></label>
                            <input name="default_dca_buy_percentage" id="default_dca_buy_percentage" data-setting-type="DCA" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_buy_leverage"  data-i18n="configSection.buyLeverage"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_buy_leverage"  data-i18n="configSection.buyLeverage"></label>
                            <input name="default_dca_buy_leverage" id="default_dca_buy_leverage" data-setting-type="DCA" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="card-box col-md buycol sc">
                      <div class="col sellrowAB">
                        <div class="row">
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_a_sell_strategy"  data-i18n="configSection.sellStrategyA"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_a_sell_strategy"  data-i18n="configSection.sellA"></label>
                            <select class="custom-select config-input form-control " data-setting-type="DCA" name="default_dca_a_sell_strategy" id="default_dca_a_sell_strategy">
                              <option value="" selected data-i18n="configSection.choose"></option>
                              <#list sellStrategies as strategy>
                                <option value="${strategy}">${strategy}</option>
                              </#list>
                            </select>
                          </div>
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_a_sell_value"  data-i18n="configSection.sellValueA"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_a_sell_value"  data-i18n="configSection.sellValA"></label>
                            <input name="default_dca_a_sell_value" id="default_dca_a_sell_value" data-setting-type="DCA" class="form-control config-input"
                              type="text">
                          </div>
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_a_sell_value"  data-i18n="configSection.sellValueALimit"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_a_sell_value_limit"  data-i18n="configSection.sellValALim"></label>
                            <input name="default_dca_a_sell_value_limit" id="default_dca_a_sell_value_limit" data-setting-type="DCA" class="form-control config-input keepEnabled"
                              type="text">
                          </div>
                          <div class="col-1">
                          </div>
                        </div>
                      </div>
                      <div class="col sellrowA " id="sell1">
                        <div class="row">
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_b_sell_strategy"  data-i18n="configSection.sellStrategyB"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_b_sell_strategy"  data-i18n="configSection.sellB"></label>
                            <select class="custom-select config-input form-control " data-setting-type="DCA" name="default_dca_b_sell_strategy" id="default_dca_b_sell_strategy"
                              disabled>
                              <option value="" selected data-i18n="configSection.choose"></option>
                              <#list sellStrategies as strategy>
                                <option value="${strategy}">${strategy}</option>
                              </#list>
                            </select>
                          </div>
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_b_sell_value"  data-i18n="configSection.sellValueB"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_b_sell_value"  data-i18n="configSection.sellValB"></label>
                            <input name="default_dca_b_sell_value" id="default_dca_b_sell_value" data-setting-type="DCA" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_b_sell_value_limit"  data-i18n="configSection.sellValueALimit"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_b_sell_value_limit"  data-i18n="configSection.sellValALim"></label>
                            <input name="default_dca_b_sell_value_limit" id="default_dca_b_sell_value_limit" data-setting-type="DCA" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-1 pl-3 pt-1">
                            <span class="badge badge-success pull-left plusminus">
                              <i class="fa fa-plus plusminusi"></i>
                            </span>
                          </div>
                        </div>
                      </div>
                      <div class="col sellrowA " id="sell2">
                        <div class="row">
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_c_sell_strategy"  data-i18n="configSection.sellStrategyC"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_c_sell_strategy"  data-i18n="configSection.sellC"></label>
                            <select class="custom-select config-input form-control " data-setting-type="DCA" name="default_dca_c_sell_strategy" id="default_dca_c_sell_strategy"
                              disabled>
                              <option value="" selected data-i18n="configSection.choose"></option>
                              <#list sellStrategies as strategy>
                                <option value="${strategy}">${strategy}</option>
                              </#list>
                            </select>
                          </div>
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_c_sell_value"  data-i18n="configSection.sellValueC"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_c_sell_value"  data-i18n="configSection.sellValC"></label>
                            <input name="default_dca_c_sell_value" id="default_dca_c_sell_value" data-setting-type="DCA" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_c_sell_value_limit"  data-i18n="configSection.sellValueALimit"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_c_sell_value_limit"  data-i18n="configSection.sellValALim"></label>
                            <input name="default_dca_c_sell_value_limit" id="default_dca_c_sell_value_limit" data-setting-type="DCA" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-1 pl-3 pt-1">
                            <span class="badge badge-success pull-left plusminus">
                              <i class="fa fa-plus plusminusi"></i>
                            </span>
                          </div>
                        </div>
                      </div>
                      <div class="col sellrowA " id="sell3">
                        <div class="row">
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_d_sell_strategy"  data-i18n="configSection.sellStrategyD"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_d_sell_strategy"  data-i18n="configSection.sellD"></label>
                            <select class="custom-select config-input form-control " data-setting-type="DCA" name="default_dca_d_sell_strategy" id="default_dca_d_sell_strategy"
                              disabled>
                              <option value="" selected data-i18n="configSection.choose"></option>
                              <#list sellStrategies as strategy>
                                <option value="${strategy}">${strategy}</option>
                              </#list>
                            </select>
                          </div>
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_d_sell_value"  data-i18n="configSection.sellValueD"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_d_sell_value"  data-i18n="configSection.sellValD"></label>
                            <input name="default_dca_d_sell_value" id="default_dca_d_sell_value" data-setting-type="DCA" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_d_sell_value_limit"  data-i18n="configSection.sellValueALimit"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_d_sell_value_limit"  data-i18n="configSection.sellValALim"></label>
                            <input name="default_dca_d_sell_value_limit" id="default_dca_d_sell_value_limit" data-setting-type="DCA" class="form-control config-input"
                              type="text">
                          </div>
                          <div class="col-1 pl-3 pt-1">
                            <span class="badge badge-success pull-left plusminus">
                              <i class="fa fa-plus plusminusi"></i>
                            </span>
                          </div>
                        </div>
                      </div>
                      <div class="col sellrowA " id="sell4">
                        <div class="row">
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_e_sell_strategy"  data-i18n="configSection.sellStrategyE"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_e_sell_strategy"  data-i18n="configSection.sellE"></label>
                            <select class="custom-select config-input form-control " data-setting-type="DCA" name="default_dca_e_sell_strategy" id="default_dca_e_sell_strategy"
                              disabled>
                              <option value="" selected data-i18n="configSection.choose"></option>
                              <#list sellStrategies as strategy>
                                <option value="${strategy}">${strategy}</option>
                              </#list>
                            </select>
                          </div>
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_e_sell_value"  data-i18n="configSection.sellValueE"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_e_sell_value"  data-i18n="configSection.sellValE"></label>
                            <input name="default_dca_e_sell_value" id="default_dca_e_sell_value" data-setting-type="DCA" class="form-control config-input"
                              type="text" disabled>
                          </div>
                          <div class="col-md">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_e_sell_value_limit"  data-i18n="configSection.sellValueALimit"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_e_sell_value_limit"  data-i18n="configSection.sellValALim"></label>
                            <input name="default_dca_e_sell_value_limit" id="default_dca_e_sell_value_limit" data-setting-type="DCA" class="form-control config-input"
                              type="text">
                          </div>
                          <div class="col-1 pl-3 pt-1">
                            <span class="badge badge-success pull-left plusminus">
                              <i class="fa fa-plus plusminusi"></i>
                            </span>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="card-box col-md-2 sc">
                      <div class="col">
                        <div class="row">

                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap short-text font-10 " for="default_dca_trailing_profit"  data-i18n="configSection.trailingProfit"></label>
                            <label class="control-label small  m-0 text-nowrap full-text " for="default_dca_dca_trailing_profit"  data-i18n="configSection.trailingProfit"></label>
                            <input name="default_dca_trailing_profit" id="default_dca_trailing_profit" data-setting-type="DCA" class="form-control config-input keepEnabled"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap full-text" for="default_dca_trailing_profit_type"  data-i18n="configSection.smartTrailingType"></label>
                            <label class="control-label small  m-0 text-nowrap short-text font-10" for="default_dca_trailing_profit_type"  data-i18n="configSection.smartTrailing"></label>
                            <select class="custom-select config-input form-control keepEnabled" data-setting-type="DCA" name="default_dca_trailing_profit_type"
                              id="default_dca_trailing_profit_type">
                              <option value="" selected data-i18n="configSection.choose"></option>
                              <option value="DEFAULT" data-i18n="configOptions.default"></option>
                              <option value="GROW" data-i18n="configSection.grow"></option>
                              <option value="SHRINK" data-i18n="configSection.shrink"></option>
                            </select>
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="default_dca_max_profit"  data-i18n="configSection.maxProfit"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_dca_max_profit"  data-i18n="configSection.maxProfit"></label>
                            <input name="default_dca_max_profit" id="default_dca_max_profit" data-setting-type="DCA" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="default_dca_take_profit_percentage"  data-i18n="configSection.takeProfitPerc"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_dca_take_profit_percentage"  data-i18n="configSection.takeProfitPerc"></label>
                            <input name="default_dca_take_profit_percentage" id="default_dca_take_profit_percentage" data-setting-type="DCA" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="default_dca_take_profit_wait_time"  data-i18n="configSection.takeProfitWait"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_dca_take_profit_wait_time"  data-i18n="configSection.takeProfitWait"></label>
                            <input name="default_dca_take_profit_wait_time" id="default_dca_take_profit_wait_time" data-setting-type="DCA" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="default_dca_take_profit_reset_percentage_move"  data-i18n="configSection.TakeProfitMovePerc"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_dca_take_profit_reset_percentage_move"  data-i18n="configSection.TakeProfitMovePerc"></label>
                            <input name="default_dca_take_profit_reset_percentage_move" id="default_dca_take_profit_reset_percentage_move" data-setting-type="DCA"
                              class="form-control keepEnabled config-input" type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="default_dca_take_profit_safety_arm"  data-i18n="configSection.TakeProfitSafetyArm"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_dca_take_profit_safety_arm"  data-i18n="configSection.TakeProfitSafetyArm"></label>
                            <input name="default_dca_take_profit_safety_arm" id="default_dca_take_profit_safety_arm" data-setting-type="DCA"
                              class="form-control keepEnabled config-input" type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="default_dca_take_profit_safety_fire"  data-i18n="configSection.TakeProfitSafetyFire"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_dca_take_profit_safety_fire"  data-i18n="configSection.TakeProfitSafetyFire"></label>
                            <input name="default_dca_take_profit_safety_fire" id="default_dca_take_profit_safety_fire" data-setting-type="DCA"
                              class="form-control keepEnabled config-input" type="text">
                          </div>


                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap short-text font-10 " for="default_dca_stop_loss_trigger"  data-i18n="configSection.stopLossTrigger"></label>
                            <label class="control-label small  m-0 text-nowrap full-text " for="default_dca_stop_loss_trigger"  data-i18n="configSection.stopLossTrigger"></label>
                            <input name="default_dca_stop_loss_trigger" id="default_dca_stop_loss_trigger" data-setting-type="DCA" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap short-text font-10 " for="default_dca_stop_loss_timeout" data-i18n="configSection.stopLossTimeout"></label>
                            <label class="control-label small  m-0 text-nowrap full-text " for="default_dca_stop_loss_timeout" data-i18n="configSection.stopLossTimeout"></label>
                            <input name="default_dca_stop_loss_timeout" id="default_dca_stop_loss_timeout" data-setting-type="DCA" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap short-text font-10 " for="default_dca_trailing_stop_loss_trigger"  data-i18n="configSection.trailingStopLossTrigger"></label>
                            <label class="control-label small  m-0 text-nowrap full-text " for="default_dca_trailing_stop_loss_trigger"  data-i18n="configSection.trailingStopLossTrigger"></label>
                            <input name="default_dca_trailing_stop_loss_trigger" id="default_dca_trailing_stop_loss_trigger" data-setting-type="DCA" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap short-text font-10 " for="default_dca_trailing_stop_loss_trigger_arm" data-i18n="configSection.trailingStopLossTriggerArm"></label>
                            <label class="control-label small  m-0 text-nowrap full-text " for="default_dca_trailing_stop_loss_trigger_arm" data-i18n="configSection.trailingStopLossTriggerArm"></label>
                            <input name="default_dca_trailing_stop_loss_trigger_arm" id="default_dca_trailing_stop_loss_trigger_arm" data-setting-type="DCA" class="form-control keepEnabled config-input"
                              type="text">
                          </div>

                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="default_dca_pending_order_wait_time"  data-i18n="configSection.pendingOrderWait"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_dca_pending_order_wait_time"  data-i18n="configSection.pendingWait"></label>
                            <input name="default_dca_pending_order_wait_time" id="default_dca_pending_order_wait_time" data-setting-type="DCA" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="default_dca_pending_gain_percentage"  data-i18n="configSection.pendingGainPercentage"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_dca_pending_order_wait_time"  data-i18n="configSection.pendingGainPercentage"></label>
                            <input name="default_dca_pending_gain_percentage" id="default_dca_pending_gain_percentage" data-setting-type="DCA" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="default_dca_cancel_pending_trigger"  data-i18n="configSection.cancelPendingTrigger"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_dca_cancel_pending_trigger"  data-i18n="configSection.cancelPendingTrigger"></label>
                            <input name="default_dca_cancel_pending_trigger" id="default_dca_cancel_pending_trigger" data-setting-type="DCA" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                          <div class="col-6">
                            <label class="control-label small  m-0 text-nowrap small full-text" for="default_dca_combined_cancel_pending_trigger"  data-i18n="configSection.combinedCancelPendingTrigger"></label>
                            <label class="control-label small  m-0 text-nowrap small short-text font-10" for="default_dca_pending_order_wait_time"  data-i18n="configSection.combinedCancelPendingTrigger"></label>
                            <input name="default_dca_combined_cancel_pending_trigger" id="default_dca_combined_cancel_pending_trigger" data-setting-type="DCA" class="form-control keepEnabled config-input"
                              type="text">
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row text-center">
                    <div class="col-md-12">

                      <div class="row justify-content-center align-items-center">
                        <div class="col-md-1" align="center">
                          <input data-setting-type="DCA" class="tgl tgl-skewed config-input" type="checkbox" data-val="true" value="" name="default_dca_ignore_sell_only_mode"
                            id="default_dca_ignore_sell_only_mode" />
                          <label class="tgl-btn mainswitch small " data-tg-off="Ignore SOM" data-tg-on="Ignore SOM" for="default_dca_ignore_sell_only_mode"></label>
                        </div>
                        <div class="col-md-1" align="center">
                          <input data-setting-type="DCA" class="tgl tgl-skewed config-input" type="checkbox" data-val="true" value="" name="dca_orderbook_profit_calculation"
                            id="dca_orderbook_profit_calculation" />
                          <label class="tgl-btn mainswitch small" data-tg-off="Orderbook Calc OFF" data-tg-on="Orderbook Calc ON" for="dca_orderbook_profit_calculation"></label>
                        </div>
                        <div class="col-md-1" align="center">
                          <input data-setting-type="DCA" class="tgl tgl-skewed config-input dcacombined" type="checkbox" data-val="true" value="" name="default_dca_combine_pending_orders"
                            id="default_dca_combine_pending_orders" />
                          <label class="tgl-btn mainswitch small" data-tg-off="COMB PENDING" data-tg-on="COMB PENDING" for="default_dca_combine_pending_orders"></label>
                        </div>
                      </div>
                    </div>

                  </div>
                </div>
                <!--  DCA tab end-->

                <!--*****************************************************-->

                <div class="tab-pane fade" id="indicators">
                  <div class="row">
                    <div class="col card-box bc">
                      <div class="row justify-content-center align-items-center">
                        <div class="col-md-1"></div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="bb_candle_period"  data-i18n="configSection.bbPeriod"></label>
                          <select class="custom-select config-input form-control keepEnabled" data-setting-type="INDICATORS" name="bb_candle_period"
                            id="bb_candle_period">
                            <#include "/includes/exchangePeriods.ftl">
                          </select>
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="bb_length"  data-i18n="configSection.bbLength"></label>
                          <input name="bb_length" id="bb_length" data-setting-type="PAIRS" class="form-control config-input keepEnabled" type="text">
                        </div>
                        <div class="col-md-2 align-items-center"></div>
                        <div class="col-md-2">
                          <label class="control-label small  m-0 text-nowrap" for="bb_std"  data-i18n="configSection.bbStd"></label>
                          <input name="bb_std" id="bb_std" data-setting-type="INDICATORS" class="form-control config-input keepEnabled" type="text">
                        </div>

                        <div class="col-md-1"></div>
                      </div>
                      <div class="row justify-content-center align-items-center">
                        <div class="col-md-1"></div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="obv_candle_period"  data-i18n="configSection.obvPeriod"></label>
                          <select class="custom-select config-input form-control keepEnabled" data-setting-type="INDICATORS" name="obv_candle_period"
                            id="obv_candle_period">
                            <#include "/includes/exchangePeriods.ftl">
                          </select>
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="obv_length"  data-i18n="configSection.obvLength"></label>
                          <input name="obv_length" id="obv_length" data-setting-type="INDICATORS" class="form-control config-input keepEnabled" type="text">
                        </div>
                        <div class="col-md-2 align-items-center"></div>
                        <div class="col-md-2">
                          <label class="control-label small  m-0 text-nowrap" for="obv_signal"  data-i18n="configSection.obvSignal"></label>
                          <input name="obv_signal" id="obv_signal" data-setting-type="INDICATORS" class="form-control config-input keepEnabled" type="text">
                        </div>

                        <div class="col-md-1"></div>
                      </div>
                      <div class="row justify-content-center align-items-center">
                        <div class="col-md-1"></div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="sma_candle_period"  data-i18n="configSection.smaPeriod"></label>
                          <select class="custom-select config-input form-control keepEnabled" data-setting-type="INDICATORS" name="sma_candle_period"
                            id="sma_candle_period">
                            <#include "/includes/exchangePeriods.ftl">
                          </select>
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="sma_fast_length"  data-i18n="configSection.smaFastLength"></label>
                          <input name="sma_fast_length" id="sma_fast_length" data-setting-type="INDICATORS" class="form-control config-input keepEnabled"
                            type="text">
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="sma_slow_length"  data-i18n="configSection.smaSlowLength"></label>
                          <input name="sma_slow_length" id="sma_slow_length" data-setting-type="INDICATORS" class="form-control config-input keepEnabled"
                            type="text">
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="sma_cross_candles"  data-i18n="configSection.smaCrossCandles"></label>
                          <input name="sma_cross_candles" id="sma_cross_candles" data-setting-type="INDICATORS" class="form-control config-input keepEnabled"
                            type="text">
                        </div>
                        <div class="col-md-1"></div>
                      </div>
                      <div class="row justify-content-center align-items-center">
                        <div class="col-md-1"></div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="ema_candle_period"  data-i18n="configSection.emaPeriod"></label>
                          <select class="custom-select config-input form-control keepEnabled" data-setting-type="INDICATORS" name="ema_candle_period"
                            id="ema_candle_period">
                            <#include "/includes/exchangePeriods.ftl">
                          </select>
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="ema_fast_length"  data-i18n="configSection.emaFastLength"></label>
                          <input name="ema_fast_length" id="ema_fast_length" data-setting-type="INDICATORS" class="form-control config-input keepEnabled"
                            type="text">
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="ema_slow_length"  data-i18n="configSection.emaSlowLength"></label>
                          <input name="ema_slow_length" id="ema_slow_length" data-setting-type="INDICATORS" class="form-control config-input keepEnabled"
                            type="text">
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="ema_cross_candles"  data-i18n="configSection.emaCrossCandles"></label>
                          <input name="ema_cross_candles" id="ema_cross_candles" data-setting-type="INDICATORS" class="form-control config-input keepEnabled"
                            type="text">
                        </div>
                        <div class="col-md-1"></div>
                      </div>
                      <div class="row justify-content-center align-items-center">
                        <div class="col-md-1"></div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="rsi_candle_period"  data-i18n="configSection.rsiPeriod"></label>
                          <select class="custom-select config-input form-control keepEnabled" data-setting-type="INDICATORS" name="rsi_candle_period"
                            id="rsi_candle_period">
                            <#include "/includes/exchangePeriods.ftl">
                          </select>
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="rsi_length"  data-i18n="configSection.rsiLength"></label>
                          <input name="rsi_length" id="rsi_length" data-setting-type="INDICATORS" class="form-control config-input keepEnabled" type="text">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-2"></div>

                        <div class="col-md-1"></div>
                      </div>
                      <div class="row justify-content-center align-items-center">
                        <div class="col-md-1"></div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="stochrsi_candle_period"  data-i18n="configSection.stochrsiPeriod"></label>
                          <select class="custom-select config-input form-control keepEnabled" data-setting-type="INDICATORS" name="stochrsi_candle_period"
                            id="stochrsi_candle_period">
                            <#include "/includes/exchangePeriods.ftl">
                          </select>
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="stochrsi_rsi_length"  data-i18n="configSection.stochrsiRsiLen"></label>
                          <input name="stochrsi_rsi_length" id="stochrsi_rsi_length" data-setting-type="INDICATORS" class="form-control config-input keepEnabled"
                            type="text">
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="stochrsi_stoch_length"  data-i18n="configSection.stochrsiStochLen"></label>
                          <input name="stochrsi_stoch_length" id="stochrsi_stoch_length" data-setting-type="INDICATORS" class="form-control config-input keepEnabled"
                            type="text">
                        </div>
                        <div class="col-md-2"></div>

                        <div class="col-md-1"></div>
                      </div>

                      <div class="row justify-content-center align-items-center">
                        <div class="col-md-1"></div>
                        <div class="col-md-2"></div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="som_trigger_length"  data-i18n="configSection.somTriggerLength"></label>
                          <input name="som_trigger_length" id="som_trigger_length" data-setting-type="INDICATORS" class="form-control config-input keepEnabled"
                            type="text">
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="pdhigh_candle_period"  data-i18n="configSection.pdhighcandleperiod"></label>
                          <select class="custom-select config-input form-control keepEnabled" data-setting-type="INDICATORS" name="pdhigh_candle_period"
                              id="pdhigh_candle_period">
                              <#include "/includes/exchangePeriods.ftl">
                          </select>
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1"></div>
                      </div>


                    </div>
                    <div class="col card-box bc">
                      <div class="row justify-content-center align-items-center">
                        <div class="col-md-1"></div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="macd_candle_period"  data-i18n="configSection.macdPeriod"></label>
                          <select class="custom-select config-input form-control keepEnabled" data-setting-type="INDICATORS" name="macd_candle_period"
                            id="macd_candle_period">
                            <#include "/includes/exchangePeriods.ftl">
                          </select>
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="macd_fast_length"  data-i18n="configSection.macdFastLength"></label>
                          <input name="macd_fast_length" id="macd_fast_length" data-setting-type="INDICATORS" class="form-control config-input keepEnabled"
                            type="text">
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="macd_slow_length"  data-i18n="configSection.macdSlowLength"></label>
                          <input name="macd_slow_length" id="macd_slow_length" data-setting-type="INDICATORS" class="form-control config-input keepEnabled"
                            type="text">
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="macd_signal"  data-i18n="configSection.macdSignal"></label>
                          <input name="macd_signal" id="macd_signal" data-setting-type="INDICATORS" class="form-control config-input keepEnabled" type="text">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1"></div>
                      </div>

                      <div class="row justify-content-center align-items-center">
                        <div class="col-md-1"></div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="stoch_candle_period"  data-i18n="configSection.stochPeriod"></label>
                          <select class="custom-select config-input form-control keepEnabled" data-setting-type="INDICATORS" name="stoch_candle_period"
                            id="stoch_candle_period">
                            <#include "/includes/exchangePeriods.ftl">
                          </select>
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="stoch_length"  data-i18n="configSection.stochLength"></label>
                          <input name="stoch_length" id="stoch_length" data-setting-type="INDICATORS" class="form-control config-input keepEnabled"
                            type="text">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="stoch_k"  data-i18n="configSection.k"></label>
                          <input name="stoch_k" id="stoch_k" data-setting-type="INDICATORS" class="form-control config-input keepEnabled" type="text">
                        </div>
                        <div class="col-md-1 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="stoch_d"  data-i18n="configSection.d"></label>
                          <input name="stoch_d" id="stoch_d" data-setting-type="INDICATORS" class="form-control config-input keepEnabled" type="text">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1"></div>
                      </div>

                      <div class="row justify-content-center align-items-center">
                        <div class="col-md-1"></div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="stochrsid_candle_period"  data-i18n="configSection.stochrsidPeriod"></label>
                          <select class="custom-select config-input form-control keepEnabled" data-setting-type="INDICATORS" name="stochrsid_candle_period"
                            id="stochrsid_candle_period">
                            <#include "/includes/exchangePeriods.ftl">
                          </select>
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="stochrsid_rsi_length"  data-i18n="configSection.stochrsidRsiLen"></label>
                          <input name="stochrsid_rsi_length" id="stochrsid_rsi_length" data-setting-type="INDICATORS" class="form-control config-input keepEnabled"
                            type="text">
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="stochrsid_stoch_length"  data-i18n="configSection.stochrsidStochLen"></label>
                          <input name="stochrsid_stoch_length" id="stochrsid_stoch_length" data-setting-type="INDICATORS" class="form-control config-input keepEnabled"
                            type="text">
                        </div>
                        <div class="col-md-1 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="stochrsid_k"  data-i18n="configSection.k"></label>
                          <input name="stochrsid_k" id="stochrsid_k" data-setting-type="INDICATORS" class="form-control config-input keepEnabled" type="text">
                        </div>
                        <div class="col-md-1 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="stochrsid_d"  data-i18n="configSection.d"></label>
                          <input name="stochrsid_d" id="stochrsid_d" data-setting-type="INDICATORS" class="form-control config-input keepEnabled" type="text">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1"></div>
                      </div>
                      <div class="row justify-content-center align-items-center">
                        <div class="col-md-1"></div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="stochrsik_candle_period"  data-i18n="configSection.stochrsikPeriod"></label>
                          <select class="custom-select config-input form-control keepEnabled" data-setting-type="INDICATORS" name="stochrsik_candle_period"
                            id="stochrsik_candle_period">
                            <#include "/includes/exchangePeriods.ftl">
                          </select>
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="stochrsik_rsi_length"  data-i18n="configSection.stochrsikRsiLen"></label>
                          <input name="stochrsik_rsi_length" id="stochrsik_rsi_length" data-setting-type="INDICATORS" class="form-control config-input keepEnabled"
                            type="text">
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="stochrsik_stoch_length"  data-i18n="configSection.stochrsikStochLen"></label>
                          <input name="stochrsik_stoch_length" id="stochrsik_stoch_length" data-setting-type="INDICATORS" class="form-control config-input keepEnabled"
                            type="text">
                        </div>
                        <div class="col-md-1 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="stochrsik_k"  data-i18n="configSection.k"></label>
                          <input name="stochrsik_k" id="stochrsik_k" data-setting-type="INDICATORS" class="form-control config-input keepEnabled" type="text">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1"></div>
                      </div>
                      <div class="row justify-content-center align-items-center">
                        <div class="col-md-1"></div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="stochrsicross_candle_period"  data-i18n="configSection.stochrsicrossPeriod"></label>
                          <select class="custom-select config-input form-control keepEnabled" data-setting-type="INDICATORS" name="stochrsicross_candle_period"
                            id="stochrsicross_candle_period">
                            <#include "/includes/exchangePeriods.ftl">
                          </select>
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="stochrsicross_rsi_length"  data-i18n="configSection.stochrsicrossRsiLen"></label>
                          <input name="stochrsicross_rsi_length" id="stochrsicross_rsi_length" data-setting-type="INDICATORS" class="form-control config-input keepEnabled"
                            type="text">
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="stochrsicross_stoch_length"  data-i18n="configSection.stochrsicrossStochLen"></label>
                          <input name="stochrsicross_stoch_length" id="stochrsicross_stoch_length" data-setting-type="INDICATORS" class="form-control config-input keepEnabled"
                            type="text">
                        </div>
                        <div class="col-md-1 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="stochrsicross_k"  data-i18n="configSection.k"></label>
                          <input name="stochrsicross_k" id="stochrsicross_k" data-setting-type="INDICATORS" class="form-control config-input keepEnabled"
                            type="text">
                        </div>
                        <div class="col-md-1 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="stochrsicross_d"  data-i18n="configSection.d"></label>
                          <input name="stochrsicross_d" id="stochrsicross_d" data-setting-type="INDICATORS" class="form-control config-input keepEnabled"
                            type="text">
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="stochrsicross_cross_candles"  data-i18n="configSection.crossCandles"></label>
                          <input name="stochrsicross_cross_candles" id="stochrsicross_cross_candles" data-setting-type="INDICATORS" class="form-control config-input keepEnabled"
                            type="text">
                        </div>
                        <div class="col-md-1"></div>

                      </div>



                      <div class="row justify-content-center align-items-center">
                        <div class="col-md-1"></div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="hma_candle_period"  data-i18n="configSection.hmacandleperiod"></label>
                          <select class="custom-select config-input form-control keepEnabled" data-setting-type="INDICATORS" name="hma_candle_period"
                            id="hma_candle_period">
                            <#include "/includes/exchangePeriods.ftl">
                          </select>
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="hma_cross_candles"  data-i18n="configSection.hmacrosscandles"></label>
                          <input name="hma_cross_candles" id="hma_cross_candles" data-setting-type="INDICATORS" class="form-control config-input keepEnabled"
                            type="text">
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="hma_fast_length"  data-i18n="configSection.hmafastlength"></label>
                          <input name="hma_fast_length" id="hma_fast_length" data-setting-type="INDICATORS" class="form-control config-input keepEnabled"
                            type="text">
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="hma_slow_length"  data-i18n="configSection.hmaslowlength"></label>
                          <input name="hma_slow_length" id="hma_slow_length" data-setting-type="INDICATORS" class="form-control config-input keepEnabled"
                            type="text">
                        </div>
                        <div class="col-md-3"></div>

                      </div>

                      <div class="row justify-content-center align-items-center">
                        <div class="col-md-1"></div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="dema_candle_period"  data-i18n="configSection.demacandleperiod"></label>
                          <select class="custom-select config-input form-control keepEnabled" data-setting-type="INDICATORS" name="dema_candle_period"
                            id="dema_candle_period">
                            <#include "/includes/exchangePeriods.ftl">
                          </select>
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="dema_cross_candles"  data-i18n="configSection.demacrosscandles"></label>
                          <input name="dema_cross_candles" id="dema_cross_candles" data-setting-type="INDICATORS" class="form-control config-input keepEnabled"
                            type="text">
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="dema_fast_length"  data-i18n="configSection.demafastlength"></label>
                          <input name="dema_fast_length" id="dema_fast_length" data-setting-type="INDICATORS" class="form-control config-input keepEnabled"
                            type="text">
                        </div>
                        <div class="col-md-2 align-items-center">
                          <label class="control-label small  m-0 text-nowrap" for="dema_slow_length"  data-i18n="configSection.demaslowlength"></label>
                          <input name="dema_slow_length" id="dema_slow_length" data-setting-type="INDICATORS" class="form-control config-input keepEnabled"
                            type="text">
                        </div>
                        <div class="col-md-3"></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
          </div>
        </div>
      </div>
      <div id="configurationContainer" class="row">
        <div class="col-12 configuration-heading-container text-center">
          <nav class="navbar navbar-expand-sm justify-content-center">
            <ul class="navbar-nav align-items-center">
              <li class="nav-item" >
                <span class="active-config current">${activeConfig}</span>
              </li>
              <li class="nav-item ">
                <i class="fa fa-trash ml-3 removeConfig" aria-hidden="true" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]constantMsgs.delete"></i>

                <i id="aceEditorSearch" class="fa fa-search ml-3" aria-hidden="true" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]constantMsgs.search"></i>

                <i class="fa fa-floppy-o save-config new-config-el ml-3" id="ace-save-button" aria-hidden="true" data-toggle="tooltip" data-placement="bottom"
                  data-i18n="[title]constantMsgs.save"></i>
                <i class="fa fa-share-alt share-config ml-3" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]constantMsgs.publishButton"></i>
                <i class="fa fa-download backup-config ml-3" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]constantMsgs.backupButton"></i>
                <i class="fa fa-spinner fa-spin ml-3" id="config-save-loader-ace" style="visibility: hidden;"></i>
              </li>
              <li class="nav-item saveli">
                <span class="show-save-message text-danger ml-3"  data-i18n="configOptions.notSaved"></span>
              </li>
            </ul>

          </nav>


        </div>
        <div class="config-tab col-12" id="acetabs">
          <ul class="nav nav-tabs tabs-bordered nav-justified">

            <li class="nav-item">
              <a href="javascript:void(0);" data-setting-type="PAIRS" class="acetab nav-link active " data-toggle="tab" aria-expanded="false" data-i18n="configOptions.pairs"></a>
            </li>
            <li class="nav-item">
              <a href="javascript:void(0);" data-setting-type="DCA" class="acetab nav-link " data-toggle="tab" aria-expanded="true" data-i18n="configOptions.dca"></a>
            </li>
            <li class="nav-item">
              <a href="javascript:void(0);" data-setting-type="INDICATORS" class="acetab nav-link" data-toggle="tab" aria-expanded="true" data-i18n="configOptions.indicators"></a>
            </li>
            <li class="nav-item">
              <a href="javascript:void(0);" data-setting-type="HOTCONFIG" class="acetab nav-link" data-toggle="tab" aria-expanded="true" data-i18n="configOptions.hotConfig"></a>
            </li>
          </ul>
          <div class="tab-content">
            <div class="editor-container col-12">
              <div class="editor-inner-container">
                <div id="PBConfigEditor"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- End Config -->
