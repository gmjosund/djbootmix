    <!-- Notifications and settings -->
    <div class="side-bar right-bar settings-tab" id="settingsTabContainer">
      <div class="">
        <ul class="nav nav-tabs tabs-bordered nav-justified">
          <li class="nav-item">
            <a href="#heartsBeatsTab" class="nav-link active" data-toggle="tab" aria-expanded="false" data-i18n="settingInfo.heartbeats.label">
            </a>
          </li>
          <li class="nav-item">
            <a href="#settingsTab" class="nav-link" data-toggle="tab" aria-expanded="true" data-i18n="settingInfo.settings.label">
            </a>
          </li>
        </ul>
        <div class="tab-content">

          <!-- Notifications tab -->
          <div class="tab-pane fade show active" id="heartsBeatsTab">
            <div class="text-center">
              <p data-i18n="constantMsgs.noHeartbeats">
              </p>
            </div>
          </div>

          <!-- Settings tab -->
          <div class="tab-pane" id="settingsTab">
            <div class="top-section-btns-container">
              <!-- SOM and SOMO buttons -->
              <div class="row m-t-20 text-center btn-container disabled" id="advConfigTgleContainer" data-toggle="tooltip" data-placement="top"
                data-i18n="[title]settingInfo.noPswrd.title;">
                <div class="col-md text-center">
                  <input data-setting-type="" class="tgl tgl-skewed disabled" type="checkbox" data-val="" value="" name="advConfigSwitch" id="advConfigSwitch"
                  />
                  <label class="tgl-btn" data-tg-off="Adv. Config" data-tg-on="Adv. Config" for="advConfigSwitch"></label>
                </div>
              </div>
              <div class="row m-t-20 text-center btn-container disabled" id="buySellBtnTgleContainer" data-toggle="tooltip" data-placement="top"
                data-i18n="[title]settingInfo.noPswrd.title;">
                <div class="col-md text-center">
                  <input data-setting-type="" class="tgl tgl-skewed tglBS disabled" type="checkbox" data-val="" value="" name="tgl-buy-or-sell-btns"
                    id="tgl-buy-or-sell-btns" />
                  <label class="tgl-btn" data-tg-off="SHOW BUY/SELL Buttons" data-tg-on="HIDE BUY/SELL Buttons" for="tgl-buy-or-sell-btns"></label>
                </div>
              </div>

              <!-- SOMO switcher -->
              <div class="row m-t-20 btn-container disabled" id="somoSwitchContainer" data-toggle="tooltip" data-placement="top"
                data-i18n="[title]settingInfo.noPswrd.title;">
                <label class="control-label m-0 text-nowrap" for="switchSomo" data-i18n="settingInfo.somoOnOff.label"></label>
                <select class="custom-select form-control mr-md-2 disabled" name="" id="switchSomo">
                  <option value="0" data-i18n="settingInfo.somoOnOff.optionOne"></option>
                  <option value="1" data-i18n="settingInfo.somoOnOff.optionTwo"></option>
                  <option value="2" data-i18n="settingInfo.somoOnOff.optionThree"></option>
                </select>
              </div>

              <div class="row m-t-20 btn-container disabled" id="activeConfigSwitchContainer" data-toggle="tooltip" data-placement="top"
                data-i18n="[title]settingInfo.noPswrd.title;">
                <label class="control-label   m-0 text-nowrap" id="switchActiveConfigLabel" for="switchActiveConfig" data-i18n="settingInfo.active"></label>
                <select class="custom-select form-control mr-md-2 disabled" data-setting-type="" name="" id="switchActiveConfig">
	                <#list availableConfigs as configName>
	                  <#assign isSelected = activeConfig == configName>
	                  <option value="${configName}" <#if isSelected> selected="selected"</#if>>${configName}</option>
	                </#list>
                </select>
              </div>
            </div>



            <!-- Logout button -->
            <div class="btns-container">
              <div class="btn-container disabled" data-toggle="tooltip" data-placement="top" data-i18n="[title]settingInfo.noPswrd.title;"
                id="btnLogoutContainer">
                <a class="btn btn-dark link disabled" href="logout">
                  <i class="mdi mdi-logout"></i>
                  <span data-i18n="settingInfo.logout.label"></span>
                </a>
              </div>

              <!-- Stop button -->
              <div class="btn-container disabled" data-toggle="tooltip" data-placement="top" data-i18n="[title]settingInfo.noPswrd.title;"
                id="btnStopContainer">
                <button class="btn btn-dark disabled" data-toggle="tooltip">
                  <i class="mdi mdi-close-circle-outline"></i>
                  <span data-i18n="footer.stopPFTrailer"></span>
                </button>
              </div>
              <!-- Reset button -->
              <div class="btn-container" data-toggle="tooltip" data-placement="top" id="btnResetContainer" data-toggle="tooltip" data-placement="top"
                data-i18n="[title]settingInfo.noPswrd.title;">
                <button class="btn btn-dark btnReset" data-toggle="tooltip">
                  <i class="mdi mdi-restart btnReset"></i>
                  <span class="btnReset" data-i18n="settingInfo.reset"></span>
                </button>
              </div>
              <!-- Setup button -->
              <div class="btn-container disabled" data-toggle="tooltip" data-placement="top" data-i18n="[title]settingInfo.noPswrd.title;"
              id="btnSetUpContainer">
              <a class="btn btn-dark link disabled" href="setup">
                <i class="mdi mdi-cloud-outline"></i>
                <span data-i18n="settingInfo.setup.label"></span>
              </a>
            </div>
              <!-- Change passwords button -->
              <div class="btn-container disabled" data-toggle="tooltip" data-placement="top" data-i18n="[title]settingInfo.noPswrd.title;"
                id="btnChngePswrdContainer">
                <a class="btn btn-dark link disabled" href="changePassword">
                  <i class="mdi mdi-key"></i>
                  <span data-i18n="settingInfo.chngePswrd.label"></span>
                </a>
              </div>

            </div>
          </div>
        </div>
      </div>
    </div>