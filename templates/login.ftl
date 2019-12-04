<#include "/includes/version.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <meta name="ProfitTrailer" content="The one and only ProfitTrailer Monitor">
  <meta name="Elroy" content="ProfitTrailer">
  <meta name="dj_crypto" content="ProfitTrailer">
  <meta name="robots" content="noindex, nofollow">
  <link rel="shortcut icon" href="images/favicon-32x32.png">
  <title>ProfitTrailer Login</title>
  <link href="css/vendor/responsive.bootstrap4.min.css?ver=${version}" rel="stylesheet" type="text/css" />
  <link href="css/vendor/bootstrap.min.css?ver=${version}" rel="stylesheet" type="text/css">
  <link href="css/vendor/icons.min.css?ver=${version}" rel="stylesheet" type="text/css">
  <link href="css/style.css?ver=${version}" rel="stylesheet" type="text/css">
  <link href="css/themes/dark/template-style.css?ver=${version}" rel="stylesheet" type="text/css" id="customTheme">
  <script src="js/vendor/jquery.min.js?ver=${version}"></script>
  <script src="js/vendor/popper.min.js?ver=${version}"></script>
  <script src="js/vendor/fastclick.js?ver=${version}"></script>
  <script src="js/vendor/bootstrap.min.js?ver=${version}"></script>
  <script src="js/vendor/detect.min.js?ver=${version}"></script>
  <script src="js/vendor/jquery.slimscroll.js?ver=${version}"></script>
  <script src="js/custom/services.js?ver=${version}"></script>
  <script src="js/custom/templateThemes.js?ver=${version}"></script>
  <script src="js/vendor/jquery.app.js?ver=${version}"></script>
  <script src="js/vendor/modernizr.min.js?ver=${version}"></script>
</head>
    <body>
      <div class="ex-page-content">
            <div class="container">
                <div class="row">
                  <ul class="list-inline mb-0 monitor-summary hide-phone">
                    <div class="col-lg-6">
                        <svg class="svg-box" width="280px" height="400px" viewBox="0 0 837 1045" version="1.2"
                             xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                             xmlns:sketch="http://www.bohemiancoding.com/sketch/ns">
                            <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"
                               sketch:type="MSPage">
                                <path d="M353,9 L626.664028,170 L626.664028,487 L353,642 L79.3359724,487 L79.3359724,170 L353,9 Z"
                                      id="Polygon-1" stroke="#3bafda" stroke-width="6" sketch:type="MSShapeGroup"></path>
                                <path d="M78.5,529 L147,569.186414 L147,648.311216 L78.5,687 L10,648.311216 L10,569.186414 L78.5,529 Z"
                                      id="Polygon-2" stroke="#7266ba" stroke-width="6" sketch:type="MSShapeGroup"></path>
                                <path d="M773,186 L827,217.538705 L827,279.636651 L773,310 L719,279.636651 L719,217.538705 L773,186 Z"
                                      id="Polygon-3" stroke="#f76397" stroke-width="6" sketch:type="MSShapeGroup"></path>
                                <path d="M639,529 L773,607.846761 L773,763.091627 L639,839 L505,763.091627 L505,607.846761 L639,529 Z"
                                      id="Polygon-4" stroke="#00b19d" stroke-width="6" sketch:type="MSShapeGroup"></path>
                                <path d="M281,801 L383,861.025276 L383,979.21169 L281,1037 L179,979.21169 L179,861.025276 L281,801 Z"
                                      id="Polygon-5" stroke="#ffaa00" stroke-width="6" sketch:type="MSShapeGroup"></path>
                            </g>
                        </svg>
                    </div>
                    </ul>
                    <div class="col-lg-6">
                        <div class="message-box">
                            <div class="buttons-con">
                                <div class="text-center">
                                <a class="logo"><img src="images/Logo.png" alt="ProfitTrailer" height="35" width="35"><span class="tdbitcoin">Profit</span><span class="text-primary">Trailer</span></a>
                               <#if demoPassword??>
                                   <p></p>
                                   <span class="text-muted">Password: </span><span class="bold text-primary">${demoPassword}</span>
                               </#if>
                               </div><p>
                                <form action="" method="POST" class="text-center m-t-20">
                                   <div class="form-group">
                                   <div class="input-group m-t-30">
                                    <input name="password" type="password" class="form-control" placeholder="Password" autocomplete="off">
                                    <i class="md md-vpn-key form-control-feedback l-h-34" style="left:6px;z-index: 99;"></i>
                                    <span class="input-group-btn"><button type="submit" class="btn btn-email btn-primary waves-effect waves-light text-dark"> Log In </button></span>
                                  </div>
                                  <span class="text-danger">${error!""}</span>
                                </div>
                            </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          </div>
         </div>
    </body>
</html>
