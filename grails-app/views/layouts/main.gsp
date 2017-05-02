<%--
 - Author: pvmagacho, GreatKevin
 - Version: 1.3
 - Copyright (C) 2011 - 2014 TopCoder Inc., All Rights Reserved.
 -
 - Description: This page is the main layout of pages.
 - 
 - Version 1.1 (System Assembly - Direct TopCoder Scorecard Tool Integration) Change notes:
 - - added include for right bar
 - - added new scripts to handle right bar
 - - fixed login/help/logout links
 - - fixed other direct links
 -
 - Version 1.2 (Release Assembly - TopCoder Scorecard Tool Ajax Loading and Static Files Sharing) Change notes:
 - - Move css/javascripts/images to common folder of direct
 -
 - Version 1.3 (Release Assembly - TC Group Management and Scorecard Tool Rebranding)
 - - Reskin the scorecard tool to the new look
 --%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Meta Tags -->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title><g:layoutTitle default="topcoder Scorecard Tool" /></title>
        <link rel="stylesheet" type="text/css" media="screen" href="${resource(dir: 'css/direct', file: 'customFont.css')}"/>
        <link rel="stylesheet" href="${resource(dir: 'css/scorecard', file: 'screen.css')}" />
        <link rel="stylesheet" href="${resource(dir: 'css/scorecard', file: 'dashboard.css')}" />
        <link rel="stylesheet" href="${resource(dir: 'css/scorecard', file: 'modal.css')}" />
        <link rel="stylesheet" href="${resource(dir: 'css/scorecard', file: 'launchcontest.css')}" />
        <link rel="stylesheet" href="${resource(dir: 'css/scorecard', file: 'permissions.css')}" />
        <link rel="stylesheet" href="${resource(dir: 'css/direct', file: 'jquery.multiSelect.css')}" />
        <!--[if IE 6]>
        <link rel="stylesheet" href="${resource(dir: 'css/direct', file: 'dashboard-ie6.css')}" />
        <![endif]-->
        <!--[if IE 7]>
        <link rel="stylesheet" href="${resource(dir: 'css/direct', file: 'dashboard-ie7.css')}" />
        <![endif]-->
        <link rel="stylesheet" href="${resource(dir: 'css/direct', file: 'ui.dialog.css')}" />
        <link rel="stylesheet" href="${resource(dir: 'css/direct', file: 'ui.theme.css')}" />
        <link rel="stylesheet" href="${resource(dir: 'css/direct', file: 'ui.core.css')}" />
		<link rel="stylesheet" href="${resource(dir: 'css/direct', file: 'jScrollPane.css')}" />

        <g:javascript library="scorecard/jquery-1.4.1.min" />
        <g:javascript library="scorecard/jquery-ui-1.7.2.custom" />
        <g:javascript library="scorecard/jquery.blockUI" />
        <g:javascript library="scorecard/dashboard" />
        <g:javascript library="scorecard/launchcontest" />
        <g:javascript library="scorecard/ui.resizable" />
        <g:javascript library="scorecard/ui.dialog" />
        <g:javascript library="scorecard/jquery.tablesorter.min" />
        <g:javascript library="scorecard/fullcalendar.min" />
        <g:javascript library="scorecard/jquery.mousewheel" />
        <g:javascript library="scorecard/jquery.em" />
        <g:javascript library="scorecard/jScrollPane" />
        <g:javascript library="scorecard/jquery.stylish-select" />
        <g:javascript library="scorecard/date" />
        <g:javascript library="scorecard/jquery.datePicker" />
        <g:javascript library="scorecard/jquery.bgiframe" />
        <g:javascript library="scorecard/jquery.scrollfollow" />
        <g:javascript library="scorecard/jquery.select" />
        <g:javascript library="scorecard/jquery.multiselect" />
        <g:javascript library="scorecard/jquery.validate" />
        <g:javascript library="scorecard/ui.core" />
        <g:javascript library="scorecard/ui.widget" />
        <g:javascript library="scorecard/ui.mouse" />
        <g:javascript library="scorecard/ui.sortable" />
        <g:javascript library="scorecard/ui.draggable" />
        <g:javascript library="scorecard/ui.droppable" />
        <g:javascript library="scorecard/ui.accordion" />
        <g:javascript library="scorecard/json2" />
        <g:javascript library="scorecard/scorecard" />
        <g:javascript library="scorecard/loadHelps" />
        <g:layoutHead />
    </head>
    <body id="page">
        <div id="wrapper">
            <div id="wrapperInner">
                <div id="container">
                    <div id="content">
                
		                <div id="newHeader">

                            <div class="topMenu">
                                <ul class="menus">
                                </ul>

                                <div class="helloUser">
                                    <ul>
                                        <li>
                                            <strong>Hello</strong>
                                            <g:memberLink coderId="${request.userId}"/>
                                        </li>

                                        <li class="helloUserLink">
                                            <a href="/scorecard/logout">Logout</a>
                                        </li>

                                        <li class="helloUserLink">
                                            <a target="_blank" href="https://www.topcoder.com/university/help-center">Help</a>
                                        </li>
                                    </ul>
                                </div>
                            <!-- End .helloUSer -->
                            </div>


                            <div class="midarea">
                                <a class="logo" href="/scorecard/">Scorecard Tool</a>
                            </div>


		                    <!-- the left tabs -->
		                    <div id="tabs1" class="scorecardTabs">
		                        <ul>
		                            <li <g:if test="${activeTab == 0}">class="on"</g:if>><g:link controller="scorecard" action="find"><span>Find Scorecard</span></g:link></li>  
		                            <li <g:if test="${activeTab == 1}">class="on"</g:if>><g:link controller="scorecard" action="create"><span>Create/Edit Scorecard</span></g:link></li>
		                        </ul>
		                    </div>
		                    <!-- End #tabs1 -->

		                </div><!-- End #header -->
                                
		                <div id="mainContent">
		                    <g:layoutBody />
		                </div><!-- End #mainContent -->

                    <div id="footer">
                        <!--Update footer-->
                        <div class="socialNetwork">
                            <span>Follow us on :</span>
                            <a href="https://www.twitter.com/TopCoder" class="twitterIcon" target="_blank" title="Follow us on Twitter"></a>
                            <a href="https://www.linkedin.com/company/topcoder" class="linkedInIcon" target="_blank" title="Follow us on LinkedIn"></a>
                            <a href="https://www.facebook.com/TopCoderInc" class="facebookIcon" target="_blank" title="Follow us on Facebook"></a>
                            <a href="https://plus.google.com/104268008777050019973" class="gPlusIcon" target="_blank" title="Follow us on Google+"></a>
                            <a href="https://youtube.com/topcoderinc" class="youtubeIcon" target="_blank" title="Follow us on YouTube"></a>
                        </div>
                        <!--End socialNetwork-->
                        <div class="copyright">
                            <%--<div class="logoFooterWrapper"><img src="${resource(dir:'images',file:'CS_TopCoder-Banner_782x175.png')}" alt="TopCoder" width="250"></div>--%>
                            <span>&#169; Copyright TopCoder, Inc. 2001 - <script type="text/javascript">d=new Date();document.write(d.getFullYear());</script></span>&nbsp;|&nbsp;
                            <a href="https://www.topcoder.com/tc?module=Static&d1=about&d2=terms" target="_blank" title="Terms of Use">Terms of Use</a>&nbsp;|&nbsp;
                            <a href="https://www.topcoder.com/tc?module=Static&d1=about&d2=privacy" target="_blank" title="Privacy Policy">Privacy Policy</a>
                        </div>
                     </div>
		                %{----}%
		                %{--<div id="footer">--}%
		                    %{--<p>TopCoder is the world's largest competitive software development community with 232,058 developers representing over 200 countries.</p>--}%
		                    %{--<p><strong>Copyright ©2001 - 2014, TopCoder, Inc. All rights reserved</strong></p>--}%
		                    %{--<a href="javascript:;" class="poweredBy"><img src="${resource(dir:'images',file:'logo2.png')}" alt="TopCoder" /></a>--}%
		                %{--</div><!-- End #footer -->  --}%
                        <input id="ctx" value="${request.contextPath}" type="hidden"/>
                    </div><!-- End #content -->
                </div><!-- End #container -->
            </div>
        </div><!-- End #wrapper -->
	<div id="popups">
		<div id="modalBackground"></div>
		<div id="new-modal">
			<div class="outLay" id="preloaderModal" style="display: none;">
				<div class="modalHeaderSmall">
					<div class="modalHeaderSmallRight">
						<div class="modalHeaderSmallCenter"></div>
					</div>
				</div>
				<div class="modalBody">
					<span id="preloaderAnimation">
					<img alt="Loading" src="${resource(dir:'images',file:'preloader-loading.gif')}">
					</span>
					<div class="preloaderTips">Loading...</div>
				</div>
				<div class="modalFooter">
					<div class="modalFooterRight">
						<div class="modalFooterCenter">
							<div class="&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<span class="hide">
			<img src="${resource(dir:'images',file:'preloader-corner.png')}"/>
			<img src="${resource(dir:'images',file:'modal-header.png')}"/>
			<img src="${resource(dir:'images',file:'modal-body-normal.png')}"/>
			<img src="${resource(dir:'images',file:'preloader-body.png')}"/>
			<img src="${resource(dir:'images',file:'modal-warning.png')}"/>
			<img src="${resource(dir:'images',file:'modal-error.png')}"/>
			<img src="${resource(dir:'images',file:'modal-success.png')}"/>
			<img src="${resource(dir:'images',file:'modal-confirmation.png')}"/>
			<img src="${resource(dir:'images',file:'modal-arrow.png')}"/>
			<img src="${resource(dir:'images',file:'button-new-1.png')}"/>
		</span>
	</div>
    </body>
</html>
